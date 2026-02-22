import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vad_result.freezed.dart';
part 'vad_result.g.dart';

/// Domain entity representing Voice Activity Detection (VAD) result
///
/// Contains speech detection status, energy level, and threshold information.
@freezed
abstract class VadResult with _$VadResult {
  const factory VadResult({
    /// true if speech detected, false if silence
    required bool isSpeech,
    
    /// RMS energy level (0.0 to 1.0)
    required double energy,
    
    /// Current threshold value
    required double threshold,
    
    /// Timestamp when analysis was performed
    required DateTime timestamp,
  }) = _VadResult;
  
  factory VadResult.fromJson(Map<String, dynamic> json) =>
      _$VadResultFromJson(json);
}
