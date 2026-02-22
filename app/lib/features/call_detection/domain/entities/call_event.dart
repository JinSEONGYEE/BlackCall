import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_event.freezed.dart';
part 'call_event.g.dart';

/// Represents the state of a phone call
enum CallState {
  /// No active call
  idle,
  
  /// Incoming call ringing
  ringing,
  
  /// Call is active (answered)
  offhook,
  
  /// Call has been disconnected
  disconnected,
  
  /// Unknown state
  unknown,
}

/// Domain entity representing a call event
///
/// This entity is immutable and represents a single call state change event.
@freezed
abstract class CallEvent with _$CallEvent {
  const factory CallEvent({
    /// Phone number of the caller (may be empty for private/blocked calls)
    required String phoneNumber,
    
    /// Current state of the call
    required CallState callState,
    
    /// Timestamp when the event occurred (milliseconds since epoch)
    required int timestamp,
  }) = _CallEvent;
  
  /// Creates a CallEvent from JSON
  factory CallEvent.fromJson(Map<String, dynamic> json) =>
      _$CallEventFromJson(json);
}
