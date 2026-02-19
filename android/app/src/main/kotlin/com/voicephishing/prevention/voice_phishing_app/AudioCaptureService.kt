package com.voicephishing.prevention.voice_phishing_app

import android.media.AudioFormat
import android.media.AudioRecord
import android.media.MediaRecorder
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodChannel
import java.nio.ByteBuffer

/**
 * Service to capture audio using Android AudioRecord API
 *
 * Captures user voice during calls for real-time fraud detection analysis.
 * Implements privacy safeguards: no disk storage, immediate buffer overwrite.
 */
class AudioCaptureService(private val methodChannel: MethodChannel) {
    private var audioRecord: AudioRecord? = null
    private var isCapturing = false
    private var captureThread: Thread? = null
    private val handler = Handler(Looper.getMainLooper())
    
    companion object {
        private const val SAMPLE_RATE = 16000  // 16kHz - standard for speech recognition
        private const val CHANNEL_CONFIG = AudioFormat.CHANNEL_IN_MONO
        private const val AUDIO_FORMAT = AudioFormat.ENCODING_PCM_16BIT
        private const val BUFFER_SIZE_MULTIPLIER = 2
    }
    
    /**
     * Start audio capture
     *
     * Initializes AudioRecord and starts capture loop in background thread.
     * Audio data is sent to Flutter via MethodChannel.
     */
    fun startCapture() {
        if (isCapturing) {
            println("⚠️ Audio capture already running")
            return
        }
        
        try {
            // Calculate buffer size
            val minBufferSize = AudioRecord.getMinBufferSize(
                SAMPLE_RATE,
                CHANNEL_CONFIG,
                AUDIO_FORMAT
            )
            
            if (minBufferSize == AudioRecord.ERROR || minBufferSize == AudioRecord.ERROR_BAD_VALUE) {
                throw IllegalStateException("Invalid buffer size: $minBufferSize")
            }
            
            val bufferSize = minBufferSize * BUFFER_SIZE_MULTIPLIER
            
            println("📊 Audio buffer size: $bufferSize bytes (min: $minBufferSize)")
            
            // Initialize AudioRecord
            audioRecord = AudioRecord(
                MediaRecorder.AudioSource.VOICE_COMMUNICATION,  // Optimized for calls
                SAMPLE_RATE,
                CHANNEL_CONFIG,
                AUDIO_FORMAT,
                bufferSize
            )
            
            if (audioRecord?.state != AudioRecord.STATE_INITIALIZED) {
                throw IllegalStateException("AudioRecord not initialized properly")
            }
            
            // Start recording
            audioRecord?.startRecording()
            isCapturing = true
            
            println("✅ Audio capture started (16kHz, Mono, 16-bit PCM)")
            
            // Start capture loop in background thread
            captureThread = Thread {
                captureAudioLoop(bufferSize)
            }.apply {
                name = "AudioCaptureThread"
                start()
            }
            
        } catch (e: SecurityException) {
            println("❌ Permission denied: ${e.message}")
            stopCapture()
            throw e
        } catch (e: Exception) {
            println("❌ Failed to start audio capture: ${e.message}")
            e.printStackTrace()
            stopCapture()
            throw e
        }
    }
    
    /**
     * Audio capture loop (runs in background thread)
     *
     * Continuously reads audio data from AudioRecord and sends to Flutter.
     * Implements privacy safeguard: buffer is zeroed after each read (NFR4).
     */
    private fun captureAudioLoop(bufferSize: Int) {
        val audioBuffer = ByteArray(bufferSize)
        var totalBytesRead = 0L
        var chunkCount = 0
        
        println("🔄 Audio capture loop started")
        
        while (isCapturing) {
            try {
                // Read audio data
                val bytesRead = audioRecord?.read(audioBuffer, 0, bufferSize) ?: 0
                
                if (bytesRead > 0) {
                    totalBytesRead += bytesRead
                    chunkCount++
                    
                    // Send audio data to Flutter
                    sendAudioToFlutter(audioBuffer, bytesRead)
                    
                    // Privacy safeguard: Overwrite buffer immediately (NFR4)
                    audioBuffer.fill(0)
                    
                    // Log progress every 100 chunks
                    if (chunkCount % 100 == 0) {
                        println("📊 Captured $chunkCount chunks, ${totalBytesRead / 1024}KB total")
                    }
                    
                } else if (bytesRead < 0) {
                    println("⚠️ AudioRecord read error: $bytesRead")
                    break
                }
                
            } catch (e: Exception) {
                println("❌ Error reading audio: ${e.message}")
                e.printStackTrace()
                break
            }
        }
        
        println("🛑 Audio capture loop ended (chunks: $chunkCount, bytes: $totalBytesRead)")
    }
    
    /**
     * Send audio data to Flutter via MethodChannel
     *
     * Audio data is sent as a map with metadata (length, sample rate, timestamp).
     */
    private fun sendAudioToFlutter(audioData: ByteArray, length: Int) {
        // Copy only the valid portion of the buffer
        val validData = audioData.copyOfRange(0, length)
        
        // Send to Flutter via MethodChannel (on main thread)
        handler.post {
            try {
                methodChannel.invokeMethod("onAudioData", mapOf(
                    "data" to validData,
                    "length" to length,
                    "sampleRate" to SAMPLE_RATE,
                    "timestamp" to System.currentTimeMillis()
                ))
            } catch (e: Exception) {
                println("❌ Error sending audio to Flutter: ${e.message}")
            }
        }
    }
    
    /**
     * Stop audio capture
     *
     * Stops recording, releases resources, and cleans up.
     */
    fun stopCapture() {
        if (!isCapturing) {
            return
        }
        
        println("🛑 Stopping audio capture...")
        isCapturing = false
        
        try {
            // Wait for capture thread to finish
            captureThread?.join(1000)  // Wait max 1 second
            
            // Stop and release AudioRecord
            audioRecord?.apply {
                if (state == AudioRecord.STATE_INITIALIZED) {
                    stop()
                }
                release()
            }
            audioRecord = null
            captureThread = null
            
            println("✅ Audio capture stopped and resources released")
            
        } catch (e: Exception) {
            println("❌ Error stopping audio capture: ${e.message}")
            e.printStackTrace()
        }
    }
    
    /**
     * Check if audio capture is active
     */
    fun isCapturing(): Boolean = isCapturing
}
