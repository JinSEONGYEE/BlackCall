// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CallEvent _$CallEventFromJson(Map<String, dynamic> json) => _CallEvent(
  phoneNumber: json['phoneNumber'] as String,
  callState: $enumDecode(_$CallStateEnumMap, json['callState']),
  timestamp: (json['timestamp'] as num).toInt(),
);

Map<String, dynamic> _$CallEventToJson(_CallEvent instance) =>
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
