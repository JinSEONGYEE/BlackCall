// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tflite_inference_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TFLiteInferenceResultImpl _$$TFLiteInferenceResultImplFromJson(
        Map<String, dynamic> json) =>
    _$TFLiteInferenceResultImpl(
      output: (json['output'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      inferenceTimeMs: (json['inferenceTimeMs'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$TFLiteInferenceResultImplToJson(
        _$TFLiteInferenceResultImpl instance) =>
    <String, dynamic>{
      'output': instance.output,
      'inferenceTimeMs': instance.inferenceTimeMs,
      'timestamp': instance.timestamp.toIso8601String(),
    };

TFLiteInferenceResult _$TFLiteInferenceResultFromJson(Map<String, dynamic> json) =>
    _$$TFLiteInferenceResultImplFromJson(json);
