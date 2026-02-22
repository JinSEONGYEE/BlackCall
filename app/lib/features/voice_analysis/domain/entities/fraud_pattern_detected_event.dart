import 'package:freezed_annotation/freezed_annotation.dart';

part 'fraud_pattern_detected_event.freezed.dart';
part 'fraud_pattern_detected_event.g.dart';

/// Entity representing a detected fraud pattern
@freezed
abstract class FraudPatternDetectedEvent with _$FraudPatternDetectedEvent {
  const factory FraudPatternDetectedEvent({
    /// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
    required String patternType,
    
    /// Aggregate confidence score (0.0 to 1.0)
    required double confidence,
    
    /// When the pattern was detected
    required DateTime timestamp,
    
    /// List of keywords that contributed to this detection
    required List<String> contributingKeywords,
  }) = _FraudPatternDetectedEvent;

  factory FraudPatternDetectedEvent.fromJson(Map<String, dynamic> json) =>
      _$FraudPatternDetectedEventFromJson(json);
}
