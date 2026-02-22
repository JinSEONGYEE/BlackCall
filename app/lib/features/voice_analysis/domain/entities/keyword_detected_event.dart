import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/audio_data.dart';

part 'keyword_detected_event.freezed.dart';
part 'keyword_detected_event.g.dart';

/// Entity representing a keyword detection event
///
/// Emitted when a fraud-related keyword is detected in user speech.
@freezed
abstract class KeywordDetectedEvent with _$KeywordDetectedEvent {
  const factory KeywordDetectedEvent({
    /// Detected keyword (e.g., "납치", "입금", "지금")
    required String keyword,
    
    /// When keyword was detected
    required DateTime timestamp,
    
    /// Confidence score (0.0 to 1.0)
    /// Higher values indicate more confident detection
    required double confidence,
    
    /// Audio data containing the keyword
    required AudioData audioData,
  }) = _KeywordDetectedEvent;

  factory KeywordDetectedEvent.fromJson(Map<String, dynamic> json) =>
      _$KeywordDetectedEventFromJson(json);
}
