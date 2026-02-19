import 'package:freezed_annotation/freezed_annotation.dart';

part 'caller_info.freezed.dart';
part 'caller_info.g.dart';

/// Caller information entity
///
/// Represents information about an incoming caller, including
/// the raw phone number, formatted display number, and privacy status.
@freezed
class CallerInfo with _$CallerInfo {
  const factory CallerInfo({
    /// Raw phone number from the call event
    required String phoneNumber,
    
    /// Formatted phone number for display (e.g., +82-10-1234-5678)
    required String formattedNumber,
    
    /// Whether the caller ID is private/blocked
    required bool isPrivate,
    
    /// Whether the number is Korean
    @Default(false) bool isKorean,
    
    /// Whether the number is international
    @Default(false) bool isInternational,
    
    /// Whether the number has spoofing risk patterns (070, international)
    @Default(false) bool isSpoofingRisk,
  }) = _CallerInfo;
  
  factory CallerInfo.fromJson(Map<String, dynamic> json) =>
      _$CallerInfoFromJson(json);
}
