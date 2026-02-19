import 'package:flutter/services.dart';

/// Platform channel for call control actions
class CallControlPlatformChannel {
  static const String _channelName = 'com.voicephishing.prevention/call_control';
  static const MethodChannel _channel = MethodChannel(_channelName);

  /// Terminate the currently active phone call
  static Future<bool> terminateCall() async {
    try {
      final bool result = await _channel.invokeMethod('terminateCall');
      return result;
    } on PlatformException catch (e) {
      print('❌ Failed to terminate call: ${e.message}');
      return false;
    }
  }

  /// Terminate current call and call 112
  static Future<bool> reportEmergency() async {
    try {
      final bool result = await _channel.invokeMethod('reportEmergency');
      return result;
    } on PlatformException catch (e) {
      print('❌ Failed to report emergency: ${e.message}');
      return false;
    }
  }
}
