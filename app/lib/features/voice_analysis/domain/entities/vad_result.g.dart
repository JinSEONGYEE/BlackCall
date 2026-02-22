// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vad_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VadResult _$VadResultFromJson(Map<String, dynamic> json) => _VadResult(
  isSpeech: json['isSpeech'] as bool,
  energy: (json['energy'] as num).toDouble(),
  threshold: (json['threshold'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$VadResultToJson(_VadResult instance) =>
    <String, dynamic>{
      'isSpeech': instance.isSpeech,
      'energy': instance.energy,
      'threshold': instance.threshold,
      'timestamp': instance.timestamp.toIso8601String(),
    };
