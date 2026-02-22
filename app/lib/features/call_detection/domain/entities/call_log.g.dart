// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CallLog _$CallLogFromJson(Map<String, dynamic> json) => _CallLog(
  id: (json['id'] as num).toInt(),
  phoneNumber: json['phoneNumber'] as String,
  formattedNumber: json['formattedNumber'] as String,
  isPrivate: json['isPrivate'] as bool,
  isKorean: json['isKorean'] as bool,
  isInternational: json['isInternational'] as bool,
  isSpoofingRisk: json['isSpoofingRisk'] as bool,
  isWhitelisted: json['isWhitelisted'] as bool,
  callState: json['callState'] as String,
  receivedAt: DateTime.parse(json['receivedAt'] as String),
  answeredAt: json['answeredAt'] == null
      ? null
      : DateTime.parse(json['answeredAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$CallLogToJson(_CallLog instance) => <String, dynamic>{
  'id': instance.id,
  'phoneNumber': instance.phoneNumber,
  'formattedNumber': instance.formattedNumber,
  'isPrivate': instance.isPrivate,
  'isKorean': instance.isKorean,
  'isInternational': instance.isInternational,
  'isSpoofingRisk': instance.isSpoofingRisk,
  'isWhitelisted': instance.isWhitelisted,
  'callState': instance.callState,
  'receivedAt': instance.receivedAt.toIso8601String(),
  'answeredAt': instance.answeredAt?.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'durationSeconds': instance.durationSeconds,
};
