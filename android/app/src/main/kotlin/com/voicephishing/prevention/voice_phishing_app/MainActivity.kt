package com.voicephishing.prevention.voice_phishing_app

import android.content.IntentFilter
import android.telephony.TelephonyManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    
    private var callStateReceiver: CallStateReceiver? = null
    
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
    }
    
    override fun onDestroy() {
        super.onDestroy()
        
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
