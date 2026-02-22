package com.voicephishing.prevention.voice_phishing_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import android.util.Log
import io.flutter.plugin.common.EventChannel

/**
 * EventChannel implementation for streaming call events to Flutter.
 * 
 * This class bridges Android's BroadcastReceiver events to Flutter's
 * EventChannel stream, allowing Flutter to listen for call state changes.
 */
class CallEventChannel(private val context: Context) : EventChannel.StreamHandler {
    
    companion object {
        private const val TAG = "CallEventChannel"
        const val CHANNEL_NAME = "com.voicephishing.prevention/call_events"
    }
    
    private var eventSink: EventChannel.EventSink? = null
    private var callStateReceiver: BroadcastReceiver? = null
    
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        Log.d(TAG, "EventChannel onListen called")
        eventSink = events
        
        // Register broadcast receiver for call state changes
        callStateReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                if (intent?.action == CallStateReceiver.ACTION_CALL_STATE_CHANGED) {
                    val phoneNumber = intent.getStringExtra(CallStateReceiver.EXTRA_PHONE_NUMBER) ?: ""
                    val callState = intent.getStringExtra(CallStateReceiver.EXTRA_CALL_STATE) ?: "unknown"
                    val timestamp = intent.getLongExtra(CallStateReceiver.EXTRA_TIMESTAMP, System.currentTimeMillis())
                    
                    // Create event map for Flutter
                    val eventData = mapOf(
                        "phoneNumber" to phoneNumber,
                        "callState" to callState,
                        "timestamp" to timestamp
                    )
                    
                    Log.d(TAG, "Sending call event to Flutter: $eventData")
                    eventSink?.success(eventData)
                }
            }
        }
        
        // Register the receiver
        val filter = IntentFilter(CallStateReceiver.ACTION_CALL_STATE_CHANGED)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            context.registerReceiver(callStateReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            context.registerReceiver(callStateReceiver, filter)
        }
        
        Log.d(TAG, "CallStateReceiver registered")
    }
    
    override fun onCancel(arguments: Any?) {
        Log.d(TAG, "EventChannel onCancel called")
        
        // Unregister broadcast receiver
        try {
            callStateReceiver?.let {
                context.unregisterReceiver(it)
                callStateReceiver = null
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error unregistering receiver", e)
        }
        
        eventSink = null
    }
}
