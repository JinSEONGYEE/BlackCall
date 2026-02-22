// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioData _$AudioDataFromJson(Map<String, dynamic> json) => _AudioData(
  data: const Uint8ListConverter().fromJson(json['data'] as List<int>),
  length: (json['length'] as num).toInt(),
  sampleRate: (json['sampleRate'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$AudioDataToJson(_AudioData instance) =>
    <String, dynamic>{
      'data': const Uint8ListConverter().toJson(instance.data),
      'length': instance.length,
      'sampleRate': instance.sampleRate,
      'timestamp': instance.timestamp.toIso8601String(),
    };
