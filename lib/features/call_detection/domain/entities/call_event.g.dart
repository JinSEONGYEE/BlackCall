// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallEventImpl _$$CallEventImplFromJson(Map<String, dynamic> json) =>
    _$CallEventImpl(
      phoneNumber: json['phoneNumber'] as String,
      callState: $enumDecode(_$CallStateEnumMap, json['callState']),
      timestamp: (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$CallEventImplToJson(_$CallEventImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'callState': _$CallStateEnumMap[instance.callState]!,
      'timestamp': instance.timestamp,
    };

const _$CallStateEnumMap = {
  CallState.idle: 'idle',
  CallState.ringing: 'ringing',
  CallState.offhook: 'offhook',
  CallState.disconnected: 'disconnected',
  CallState.unknown: 'unknown',
};
