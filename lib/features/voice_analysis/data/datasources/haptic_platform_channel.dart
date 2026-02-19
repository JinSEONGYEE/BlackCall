import 'package:flutter/services.dart';

/// Platform channel for haptic feedback
class HapticPlatformChannel {
  static const String _channelName = 'com.voicephishing.prevention/haptics';
  static const MethodChannel _channel = MethodChannel(_channelName);

  /// Trigger SOS vibration pattern on native side
  static Future<void> vibrateSOS() async {
    try {
      await _channel.invokeMethod('vibrateSOS');
    } on PlatformException catch (e) {
      print('❌ Failed to trigger SOS vibration: ${e.message}');
    }
  }
}
