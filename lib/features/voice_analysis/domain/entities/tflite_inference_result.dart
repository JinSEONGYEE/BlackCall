import 'package:freezed_annotation/freezed_annotation.dart';

part 'tflite_inference_result.freezed.dart';
part 'tflite_inference_result.g.dart';

/// Domain entity representing TFLite inference result
///
/// Contains the output tensor from the model, inference time,
/// and timestamp of when the inference was performed.
@freezed
class TFLiteInferenceResult with _$TFLiteInferenceResult {
  const factory TFLiteInferenceResult({
    /// Raw output tensor from model (e.g., [0.8, 0.2] for safe/fraud probabilities)
    required List<double> output,
    
    /// Time taken for inference in milliseconds (must be <100ms)
    required int inferenceTimeMs,
    
    /// When inference was performed
    required DateTime timestamp,
  }) = _TFLiteInferenceResult;
  
  /// Creates a TFLiteInferenceResult from JSON
  factory TFLiteInferenceResult.fromJson(Map<String, dynamic> json) =>
      _$TFLiteInferenceResultFromJson(json);
}
