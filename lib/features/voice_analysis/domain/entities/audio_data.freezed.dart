// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease use `MyClass` instead.');

AudioData _$AudioDataFromJson(Map<String, dynamic> json) {
  return _AudioData.fromJson(json);
}

/// @nodoc
mixin _$AudioData {
  /// Raw audio bytes (PCM 16-bit, mono)
  Uint8List get data => throw _privateConstructorUsedError;

  /// Length of valid data in bytes
  int get length => throw _privateConstructorUsedError;

  /// Sample rate in Hz (e.g., 16000 for 16kHz)
  int get sampleRate => throw _privateConstructorUsedError;

  /// Timestamp when audio was captured
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioDataCopyWith<AudioData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioDataCopyWith<$Res> {
  factory $AudioDataCopyWith(AudioData value, $Res Function(AudioData) then) =
      _$AudioDataCopyWithImpl<$Res, AudioData>;
  @useResult
  $Res call({Uint8List data, int length, int sampleRate, DateTime timestamp});
}

/// @nodoc
class _$AudioDataCopyWithImpl<$Res, $Val extends AudioData>
    implements $AudioDataCopyWith<$Res> {
  _$AudioDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? length = null,
    Object? sampleRate = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      sampleRate: null == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioDataImplCopyWith<$Res>
    implements $AudioDataCopyWith<$Res> {
  factory _$$AudioDataImplCopyWith(
          _$AudioDataImpl value, $Res Function(_$AudioDataImpl) then) =
      __$$AudioDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List data, int length, int sampleRate, DateTime timestamp});
}

/// @nodoc
class __$$AudioDataImplCopyWithImpl<$Res>
    extends _$AudioDataCopyWithImpl<$Res, _$AudioDataImpl>
    implements _$$AudioDataImplCopyWith<$Res> {
  __$$AudioDataImplCopyWithImpl(
      _$AudioDataImpl _value, $Res Function(_$AudioDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? length = null,
    Object? sampleRate = null,
    Object? timestamp = null,
  }) {
    return _then(_$AudioDataImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      sampleRate: null == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioDataImpl implements _AudioData {
  const _$AudioDataImpl(
      {required this.data,
      required this.length,
      required this.sampleRate,
      required this.timestamp});

  factory _$AudioDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioDataImplFromJson(json);

  /// Raw audio bytes (PCM 16-bit, mono)
  @override
  final Uint8List data;

  /// Length of valid data in bytes
  @override
  final int length;

  /// Sample rate in Hz (e.g., 16000 for 16kHz)
  @override
  final int sampleRate;

  /// Timestamp when audio was captured
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'AudioData(data: $data, length: $length, sampleRate: $sampleRate, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioDataImpl &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.sampleRate, sampleRate) ||
                other.sampleRate == sampleRate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), length, sampleRate, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioDataImplCopyWith<_$AudioDataImpl> get copyWith =>
      __$$AudioDataImplCopyWithImpl<_$AudioDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioDataImplToJson(
      this,
    );
  }
}

abstract class _AudioData implements AudioData {
  const factory _AudioData(
      {required final Uint8List data,
      required final int length,
      required final int sampleRate,
      required final DateTime timestamp}) = _$AudioDataImpl;

  factory _AudioData.fromJson(Map<String, dynamic> json) =
      _$AudioDataImpl.fromJson;

  @override

  /// Raw audio bytes (PCM 16-bit, mono)
  Uint8List get data;
  @override

  /// Length of valid data in bytes
  int get length;
  @override

  /// Sample rate in Hz (e.g., 16000 for 16kHz)
  int get sampleRate;
  @override

  /// Timestamp when audio was captured
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$AudioDataImplCopyWith<_$AudioDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
