import 'package:flutter/services.dart';

/// Platform channel for audio capture operations
///
/// Communicates with native Android AudioRecord API via MethodChannel.
/// Receives audio data from native side and forwards to Flutter callbacks.
class AudioCapturePlatformChannel {
  static const MethodChannel _channel =
      MethodChannel('com.voicephishing.prevention/audio_capture');
  
  /// Callback for audio data received from native side
  static Function(Map<String, dynamic>)? onAudioData;
  
  /// Initialize the platform channel
  ///
  /// Sets up method call handler to receive audio data from native side.
  static void initialize() {
    _channel.setMethodCallHandler(_handleMethodCall);
    print('📡 Audio capture platform channel initialized');
  }
  
  /// Handle method calls from native side
  static Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onAudioData':
        if (onAudioData != null) {
          final data = call.arguments as Map<Object?, Object?>;
          final audioData = {
            'data': data['data'] as Uint8List,
            'length': data['length'] as int,
            'sampleRate': data['sampleRate'] as int,
            'timestamp': data['timestamp'] as int,
          };
          onAudioData!(audioData);
        }
        break;
      default:
        print('⚠️ Unknown method: ${call.method}');
    }
  }
  
  /// Start audio capture
  ///
  /// Requests native side to start capturing audio from microphone.
  /// Returns true if capture started successfully, false otherwise.
  /// May throw PlatformException if permission denied or start failed.
  static Future<bool> startCapture() async {
    try {
      final result = await _channel.invokeMethod('startCapture');
      return result as bool;
    } on PlatformException catch (e) {
      print('❌ Platform exception: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      print('❌ Failed to start audio capture: $e');
      return false;
    }
  }
  
  /// Stop audio capture
  ///
  /// Requests native side to stop capturing audio and release resources.
  /// Returns true if capture stopped successfully, false otherwise.
  static Future<bool> stopCapture() async {
    try {
      final result = await _channel.invokeMethod('stopCapture');
      return result as bool;
    } catch (e) {
      print('❌ Failed to stop audio capture: $e');
      return false;
    }
  }
  
  /// Check if audio capture is active
  ///
  /// Returns true if native side is currently capturing audio, false otherwise.
  static Future<bool> isCapturing() async {
    try {
      final result = await _channel.invokeMethod('isCapturing');
      return result as bool;
    } catch (e) {
      print('❌ Failed to check capture status: $e');
      return false;
    }
  }
}
