// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caller_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallerInfoImpl _$$CallerInfoImplFromJson(Map<String, dynamic> json) =>
    _$CallerInfoImpl(
      phoneNumber: json['phoneNumber'] as String,
      formattedNumber: json['formattedNumber'] as String,
      isPrivate: json['isPrivate'] as bool,
      isKorean: json['isKorean'] as bool? ?? false,
      isInternational: json['isInternational'] as bool? ?? false,
      isSpoofingRisk: json['isSpoofingRisk'] as bool? ?? false,
    );

Map<String, dynamic> _$$CallerInfoImplToJson(_$CallerInfoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'formattedNumber': instance.formattedNumber,
      'isPrivate': instance.isPrivate,
      'isKorean': instance.isKorean,
      'isInternational': instance.isInternational,
      'isSpoofingRisk': instance.isSpoofingRisk,
    };
