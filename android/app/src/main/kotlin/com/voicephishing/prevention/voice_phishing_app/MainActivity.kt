package com.voicephishing.prevention.voice_phishing_app

import android.Manifest
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.telephony.TelephonyManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.telephony.PhoneStateListener
import android.os.Build

class MainActivity : FlutterActivity() {
    
    private val AUDIO_CHANNEL = "com.voicephishing.prevention/audio_capture"
    private val HAPTIC_CHANNEL = "com.voicephishing.prevention/haptics"
    private val CALL_CONTROL_CHANNEL = "com.voicephishing.prevention/call_control"
    private val PERMISSION_REQUEST_CODE = 102
    
    private var callStateReceiver: CallStateReceiver? = null
    private lateinit var audioCaptureService: AudioCaptureService
    private var pendingResult: MethodChannel.Result? = null
    
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Register EventChannel for call events
        val callEventChannel = CallEventChannel(this)
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CallEventChannel.CHANNEL_NAME
        ).setStreamHandler(callEventChannel)
        
        // Register BroadcastReceiver for phone state changes
        callStateReceiver = CallStateReceiver()
        val filter = IntentFilter(TelephonyManager.ACTION_PHONE_STATE_CHANGED)
        registerReceiver(callStateReceiver, filter)
        
        // Initialize audio capture channel
        val audioChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, AUDIO_CHANNEL)
        audioCaptureService = AudioCaptureService(audioChannel)
        
        audioChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "startCapture" -> {
                    if (checkAudioPermission()) {
                        try {
                            audioCaptureService.startCapture()
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("START_FAILED", "Failed to start audio capture: ${e.message}", null)
                        }
                    } else {
                        pendingResult = result
                        requestAudioPermission()
                    }
                }
                "stopCapture" -> {
                    try {
                        audioCaptureService.stopCapture()
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("STOP_FAILED", "Failed to stop audio capture: ${e.message}", null)
                    }
                }
                "isCapturing" -> {
                    result.success(audioCaptureService.isCapturing())
                }
                else -> result.notImplemented()
            }
        }

        // Initialize haptic channel
        val hapticChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, HAPTIC_CHANNEL)
        hapticChannel.setMethodCallHandler { call, result ->
            if (call.method == "vibrateSOS") {
                vibrateSOS()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }

        // Initialize call control channel
        val callControlChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CALL_CONTROL_CHANNEL)
        callControlChannel.setMethodCallHandler { call, result ->
            if (call.method == "terminateCall") {
                if (terminateCall()) {
                    result.success(true)
                } else {
                    result.error("TERMINATE_FAILED", "Failed to terminate call", null)
                }
            } else if (call.method == "reportEmergency") {
                if (reportEmergency()) {
                    result.success(true)
                } else {
                    result.error("REPORT_FAILED", "Failed to initiate emergency report", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun reportEmergency(): Boolean {
        // 1. Terminate the active call first
        terminateCall()

        // 2. Place call to 112
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
            return false
        }

        return try {
            val intent = Intent(Intent.ACTION_CALL)
            intent.data = Uri.parse("tel:112")
            startActivity(intent)
            true
        } catch (e: Exception) {
            false
        }
    }

    private fun terminateCall(): Boolean {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.ANSWER_PHONE_CALLS) != PackageManager.PERMISSION_GRANTED) {
            return false
        }
        
        return try {
            val telecomManager = getSystemService(android.content.Context.TELECOM_SERVICE) as android.telecom.TelecomManager
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
                telecomManager.endCall()
            } else {
                // For older versions, this is more complex and often requires unofficial APIs.
                // Given the target and modern Android focus, we use TelecomManager.
                false
            }
        } catch (e: Exception) {
            false
        }
    }

    private fun vibrateSOS() {
        val vibrator = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
            val vibratorManager = getSystemService(android.content.Context.VIBRATOR_MANAGER_SERVICE) as android.os.VibratorManager
            vibratorManager.defaultVibrator
        } else {
            @Suppress("DEPRECATION")
            getSystemService(android.content.Context.VIBRATOR_SERVICE) as android.os.Vibrator
        }

        if (vibrator.hasVibrator()) {
            // SOS Morse Code: ... --- ... (Dot: 150ms, Dash: 450ms, Gap: 150ms)
            // Pattern: [delay, dot, gap, dot, gap, dot, longGap, dash, gap, dash, gap, dash, longGap, dot, gap, dot, gap, dot]
            val pattern = longArrayOf(
                0, 
                150, 150, 150, 150, 150, 450, // ...
                450, 150, 450, 150, 450, 450, // ---
                150, 150, 150, 150, 150       // ...
            )
            
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                vibrator.vibrate(android.os.VibrationEffect.createWaveform(pattern, -1))
            } else {
                @Suppress("DEPRECATION")
                vibrator.vibrate(pattern, -1)
            }
        }
    }
    
    private fun checkAudioPermission(): Boolean {
        return ContextCompat.checkSelfPermission(
            this,
            Manifest.permission.RECORD_AUDIO
        ) == PackageManager.PERMISSION_GRANTED
    }
    
    private fun requestAudioPermission() {
        ActivityCompat.requestPermissions(
            this,
            arrayOf(Manifest.permission.RECORD_AUDIO),
            PERMISSION_REQUEST_CODE
        )
    }
    
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        
        if (requestCode == PERMISSION_REQUEST_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted, start capture
                try {
                    audioCaptureService.startCapture()
                    pendingResult?.success(true)
                } catch (e: Exception) {
                    pendingResult?.error("START_FAILED", "Failed to start audio capture: ${e.message}", null)
                }
            } else {
                // Permission denied
                pendingResult?.error("PERMISSION_DENIED", "Audio recording permission denied", null)
            }
            pendingResult = null
        }
    }
    
    override fun onDestroy() {
        super.onDestroy()
        
        // Stop audio capture
        try {
            audioCaptureService.stopCapture()
        } catch (e: Exception) {
            // Ignore
        }
        
        // Unregister BroadcastReceiver
        try {
            callStateReceiver?.let {
                unregisterReceiver(it)
                callStateReceiver = null
            }
        } catch (e: Exception) {
            // Receiver might not be registered
        }
    }
}
