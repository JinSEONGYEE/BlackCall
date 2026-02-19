// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_pattern_detected_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FraudPatternDetectedEventImpl _$$FraudPatternDetectedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$FraudPatternDetectedEventImpl(
      patternType: json['patternType'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      contributingKeywords: (json['contributingKeywords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FraudPatternDetectedEventImplToJson(
        _$FraudPatternDetectedEventImpl instance) =>
    <String, dynamic>{
      'patternType': instance.patternType,
      'confidence': instance.confidence,
      'timestamp': instance.timestamp.toIso8601String(),
      'contributingKeywords': instance.contributingKeywords,
    };
