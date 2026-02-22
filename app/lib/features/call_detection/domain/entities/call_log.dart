import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_log.freezed.dart';
part 'call_log.g.dart';

/// Domain entity representing a logged call
///
/// Contains comprehensive metadata about an incoming call including
/// caller information, spoofing risk flags, whitelist status, and timestamps.
@freezed
abstract class CallLog with _$CallLog {
  const factory CallLog({
    /// Unique identifier for this call log entry
    required int id,
    
    /// Raw phone number from the call event
    required String phoneNumber,
    
    /// Formatted phone number for display
    required String formattedNumber,
    
    /// Whether the caller ID is private/blocked
    required bool isPrivate,
    
    /// Whether the number is Korean
    required bool isKorean,
    
    /// Whether the number is international
    required bool isInternational,
    
    /// Whether the number has spoofing risk patterns (070, international)
    required bool isSpoofingRisk,
    
    /// Whether the number is in the whitelist (contacts)
    required bool isWhitelisted,
    
    /// Current state of the call ('idle', 'ringing', 'offhook', 'disconnected', 'unknown')
    required String callState,
    
    /// When the call was received (started ringing)
    required DateTime receivedAt,
    
    /// When the call was answered (nullable, only set if answered)
    DateTime? answeredAt,
    
    /// When the call ended (nullable, only set when disconnected)
    DateTime? endedAt,
    
    /// Call duration in seconds (nullable, calculated when call ends)
    int? durationSeconds,
  }) = _CallLog;
  
  /// Creates a CallLog from JSON
  factory CallLog.fromJson(Map<String, dynamic> json) => _$CallLogFromJson(json);
}
