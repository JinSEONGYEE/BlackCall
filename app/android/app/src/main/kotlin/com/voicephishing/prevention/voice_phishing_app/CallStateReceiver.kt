package com.voicephishing.prevention.voice_phishing_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.TelephonyManager
import android.util.Log

/**
 * BroadcastReceiver for detecting incoming call state changes.
 * 
 * Listens for TelephonyManager.ACTION_PHONE_STATE_CHANGED broadcasts
 * and extracts call state and phone number information.
 */
class CallStateReceiver : BroadcastReceiver() {
    
    companion object {
        private const val TAG = "CallStateReceiver"
        const val ACTION_CALL_STATE_CHANGED = "com.voicephishing.prevention.CALL_STATE_CHANGED"
        const val EXTRA_PHONE_NUMBER = "phone_number"
        const val EXTRA_CALL_STATE = "call_state"
        const val EXTRA_TIMESTAMP = "timestamp"
    }
    
    override fun onReceive(context: Context?, intent: Intent?) {
        if (context == null || intent == null) {
            Log.w(TAG, "Received null context or intent")
            return
        }
        
        if (intent.action != TelephonyManager.ACTION_PHONE_STATE_CHANGED) {
            return
        }
        
        try {
            // Extract call state
            val state = intent.getStringExtra(TelephonyManager.EXTRA_STATE)
            
            // Extract phone number (may be null for private/blocked calls)
            val phoneNumber = intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER)
            
            Log.d(TAG, "Call state changed: state=$state, phoneNumber=$phoneNumber")
            
            // Map telephony state to our call state
            val callState = when (state) {
                TelephonyManager.EXTRA_STATE_RINGING -> "ringing"
                TelephonyManager.EXTRA_STATE_OFFHOOK -> "offhook"
                TelephonyManager.EXTRA_STATE_IDLE -> "idle"
                else -> "unknown"
            }
            
            // Broadcast call event to EventChannel
            val callEventIntent = Intent(ACTION_CALL_STATE_CHANGED).apply {
                putExtra(EXTRA_PHONE_NUMBER, phoneNumber ?: "")
                putExtra(EXTRA_CALL_STATE, callState)
                putExtra(EXTRA_TIMESTAMP, System.currentTimeMillis())
            }
            
            context.sendBroadcast(callEventIntent)
            
        } catch (e: Exception) {
            Log.e(TAG, "Error processing call state change", e)
        }
    }
}
