// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vad_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease use `MyClass` instead.');

VadResult _$VadResultFromJson(Map<String, dynamic> json) {
  return _VadResult.fromJson(json);
}

/// @nodoc
mixin _$VadResult {
  /// true if speech detected, false if silence
  bool get isSpeech => throw _privateConstructorUsedError;

  /// RMS energy level (0.0 to 1.0)
  double get energy => throw _privateConstructorUsedError;

  /// Current threshold value
  double get threshold => throw _privateConstructorUsedError;

  /// Timestamp when analysis was performed
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VadResultCopyWith<VadResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VadResultCopyWith<$Res> {
  factory $VadResultCopyWith(VadResult value, $Res Function(VadResult) then) =
      _$VadResultCopyWithImpl<$Res, VadResult>;
  @useResult
  $Res call({bool isSpeech, double energy, double threshold, DateTime timestamp});
}

/// @nodoc
class _$VadResultCopyWithImpl<$Res, $Val extends VadResult>
    implements $VadResultCopyWith<$Res> {
  _$VadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSpeech = null,
    Object? energy = null,
    Object? threshold = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      isSpeech: null == isSpeech
          ? _value.isSpeech
          : isSpeech // ignore: cast_nullable_to_non_nullable
              as bool,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VadResultImplCopyWith<$Res>
    implements $VadResultCopyWith<$Res> {
  factory _$$VadResultImplCopyWith(
          _$VadResultImpl value, $Res Function(_$VadResultImpl) then) =
      __$$VadResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSpeech, double energy, double threshold, DateTime timestamp});
}

/// @nodoc
class __$$VadResultImplCopyWithImpl<$Res>
    extends _$VadResultCopyWithImpl<$Res, _$VadResultImpl>
    implements _$$VadResultImplCopyWith<$Res> {
  __$$VadResultImplCopyWithImpl(
      _$VadResultImpl _value, $Res Function(_$VadResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSpeech = null,
    Object? energy = null,
    Object? threshold = null,
    Object? timestamp = null,
  }) {
    return _then(_$VadResultImpl(
      isSpeech: null == isSpeech
          ? _value.isSpeech
          : isSpeech // ignore: cast_nullable_to_non_nullable
              as bool,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VadResultImpl implements _VadResult {
  const _$VadResultImpl(
      {required this.isSpeech,
      required this.energy,
      required this.threshold,
      required this.timestamp});

  factory _$VadResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$VadResultImplFromJson(json);

  /// true if speech detected, false if silence
  @override
  final bool isSpeech;

  /// RMS energy level (0.0 to 1.0)
  @override
  final double energy;

  /// Current threshold value
  @override
  final double threshold;

  /// Timestamp when analysis was performed
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'VadResult(isSpeech: $isSpeech, energy: $energy, threshold: $threshold, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VadResultImpl &&
            (identical(other.isSpeech, isSpeech) ||
                other.isSpeech == isSpeech) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isSpeech, energy, threshold, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VadResultImplCopyWith<_$VadResultImpl> get copyWith =>
      __$$VadResultImplCopyWithImpl<_$VadResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VadResultImplToJson(
      this,
    );
  }
}

abstract class _VadResult implements VadResult {
  const factory _VadResult(
      {required final bool isSpeech,
      required final double energy,
      required final double threshold,
      required final DateTime timestamp}) = _$VadResultImpl;

  factory _VadResult.fromJson(Map<String, dynamic> json) =
      _$VadResultImpl.fromJson;

  @override

  /// true if speech detected, false if silence
  bool get isSpeech;
  @override

  /// RMS energy level (0.0 to 1.0)
  double get energy;
  @override

  /// Current threshold value
  double get threshold;
  @override

  /// Timestamp when analysis was performed
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$VadResultImplCopyWith<_$VadResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
