// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_detected_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeywordDetectedEventImpl _$$KeywordDetectedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$KeywordDetectedEventImpl(
      keyword: json['keyword'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      confidence: (json['confidence'] as num).toDouble(),
      audioData: AudioData.fromJson(json['audioData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KeywordDetectedEventImplToJson(
        _$KeywordDetectedEventImpl instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'timestamp': instance.timestamp.toIso8601String(),
      'confidence': instance.confidence,
      'audioData': instance.audioData.toJson(),
    };
