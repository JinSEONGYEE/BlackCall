// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioDataImpl _$$AudioDataImplFromJson(Map<String, dynamic> json) =>
    _$AudioDataImpl(
      data: const Uint8ListConverter().fromJson(json['data'] as List<int>),
      length: (json['length'] as num).toInt(),
      sampleRate: (json['sampleRate'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$AudioDataImplToJson(_$AudioDataImpl instance) =>
    <String, dynamic>{
      'data': const Uint8ListConverter().toJson(instance.data),
      'length': instance.length,
      'sampleRate': instance.sampleRate,
      'timestamp': instance.timestamp.toIso8601String(),
    };

// Custom converter for Uint8List
class Uint8ListConverter implements JsonConverter<Uint8List, List<int>> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(List<int> json) => Uint8List.fromList(json);

  @override
  List<int> toJson(Uint8List object) => object.toList();
}
