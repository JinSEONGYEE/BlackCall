import 'dart:async';

import 'package:flutter/services.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';

/// Platform channel data source for call detection
///
/// This class wraps the EventChannel communication with the native Android layer.
class CallDetectionPlatformChannel {
  CallDetectionPlatformChannel()
      : _eventChannel = const EventChannel(_channelName);
  
  static const String _channelName = 'com.voicephishing.prevention/call_events';
  
  final EventChannel _eventChannel;
  
  /// Stream of call events from the native platform
  ///
  /// Emits maps containing call event data:
  /// - phoneNumber: String
  /// - callState: String (idle, ringing, offhook, disconnected)
  /// - timestamp: int (milliseconds since epoch)
  ///
  /// Throws [PlatformException] if the platform channel fails.
  Stream<Map<String, dynamic>> get callEventStream {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is Map) {
        return Map<String, dynamic>.from(event);
      }
      throw const FormatException('Invalid event format from platform channel');
    });
  }
  
  /// Parse call state string to CallState enum
  CallState parseCallState(String state) {
    switch (state.toLowerCase()) {
      case 'idle':
        return CallState.idle;
      case 'ringing':
        return CallState.ringing;
      case 'offhook':
        return CallState.offhook;
      case 'disconnected':
        return CallState.disconnected;
      default:
        return CallState.unknown;
    }
  }
  
  /// Convert platform event map to CallEvent entity
  CallEvent mapToCallEvent(Map<String, dynamic> eventData) {
    final phoneNumber = eventData['phoneNumber'] as String? ?? '';
    final callStateStr = eventData['callState'] as String? ?? 'unknown';
    final timestamp = eventData['timestamp'] as int? ?? DateTime.now().millisecondsSinceEpoch;
    
    return CallEvent(
      phoneNumber: phoneNumber,
      callState: parseCallState(callStateStr),
      timestamp: timestamp,
    );
  }
}
