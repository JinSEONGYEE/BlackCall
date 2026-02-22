// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetectionHistory _$DetectionHistoryFromJson(Map<String, dynamic> json) =>
    _DetectionHistory(
      id: (json['id'] as num?)?.toInt(),
      phoneNumberHash: json['phoneNumberHash'] as String?,
      detectedAt: DateTime.parse(json['detectedAt'] as String),
      detectionType: json['type'] as String,
      confidence: (json['confidence'] as num?)?.toDouble(),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$DetectionHistoryToJson(_DetectionHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumberHash': instance.phoneNumberHash,
      'detectedAt': instance.detectedAt.toIso8601String(),
      'type': instance.detectionType,
      'confidence': instance.confidence,
      'details': instance.details,
    };
