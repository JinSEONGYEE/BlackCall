// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  isDetectionEnabled: json['isDetectionEnabled'] as bool,
  sensitivityLevel: json['sensitivityLevel'] as String,
  isReportingEnabled: json['isReportingEnabled'] as bool,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'isDetectionEnabled': instance.isDetectionEnabled,
      'sensitivityLevel': instance.sensitivityLevel,
      'isReportingEnabled': instance.isReportingEnabled,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
