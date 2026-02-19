// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tflite_inference_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease use `MyClass()` instead.');

/// @nodoc
mixin _$TFLiteInferenceResult {
  /// Raw output tensor from model (e.g., [0.8, 0.2] for safe/fraud probabilities)
  List<double> get output => throw _privateConstructorUsedError;

  /// Time taken for inference in milliseconds (must be <100ms)
  int get inferenceTimeMs => throw _privateConstructorUsedError;

  /// When inference was performed
  DateTime get timestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TFLiteInferenceResultCopyWith<TFLiteInferenceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TFLiteInferenceResultCopyWith<$Res> {
  factory $TFLiteInferenceResultCopyWith(TFLiteInferenceResult value,
          $Res Function(TFLiteInferenceResult) then) =
      _$TFLiteInferenceResultCopyWithImpl<$Res, TFLiteInferenceResult>;
  @useResult
  $Res call({List<double> output, int inferenceTimeMs, DateTime timestamp});
}

/// @nodoc
class _$TFLiteInferenceResultCopyWithImpl<$Res,
        $Val extends TFLiteInferenceResult>
    implements $TFLiteInferenceResultCopyWith<$Res> {
  _$TFLiteInferenceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = null,
    Object? inferenceTimeMs = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<double>,
      inferenceTimeMs: null == inferenceTimeMs
          ? _value.inferenceTimeMs
          : inferenceTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TFLiteInferenceResultImplCopyWith<$Res>
    implements $TFLiteInferenceResultCopyWith<$Res> {
  factory _$$TFLiteInferenceResultImplCopyWith(
          _$TFLiteInferenceResultImpl value,
          $Res Function(_$TFLiteInferenceResultImpl) then) =
      __$$TFLiteInferenceResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> output, int inferenceTimeMs, DateTime timestamp});
}

/// @nodoc
class __$$TFLiteInferenceResultImplCopyWithImpl<$Res>
    extends _$TFLiteInferenceResultCopyWithImpl<$Res,
        _$TFLiteInferenceResultImpl>
    implements _$$TFLiteInferenceResultImplCopyWith<$Res> {
  __$$TFLiteInferenceResultImplCopyWithImpl(
      _$TFLiteInferenceResultImpl _value,
      $Res Function(_$TFLiteInferenceResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = null,
    Object? inferenceTimeMs = null,
    Object? timestamp = null,
  }) {
    return _then(_$TFLiteInferenceResultImpl(
      output: null == output
          ? _value._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<double>,
      inferenceTimeMs: null == inferenceTimeMs
          ? _value.inferenceTimeMs
          : inferenceTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TFLiteInferenceResultImpl implements _TFLiteInferenceResult {
  const _$TFLiteInferenceResultImpl(
      {required final List<double> output,
      required this.inferenceTimeMs,
      required this.timestamp})
      : _output = output;

  final List<double> _output;
  @override
  List<double> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  @override
  final int inferenceTimeMs;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'TFLiteInferenceResult(output: $output, inferenceTimeMs: $inferenceTimeMs, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TFLiteInferenceResultImpl &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            (identical(other.inferenceTimeMs, inferenceTimeMs) ||
                other.inferenceTimeMs == inferenceTimeMs) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_output), inferenceTimeMs, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TFLiteInferenceResultImplCopyWith<_$TFLiteInferenceResultImpl>
      get copyWith => __$$TFLiteInferenceResultImplCopyWithImpl<
          _$TFLiteInferenceResultImpl>(this, _$identity);
}

abstract class _TFLiteInferenceResult implements TFLiteInferenceResult {
  const factory _TFLiteInferenceResult(
      {required final List<double> output,
      required final int inferenceTimeMs,
      required final DateTime timestamp}) = _$TFLiteInferenceResultImpl;

  @override
  List<double> get output;
  @override
  int get inferenceTimeMs;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$TFLiteInferenceResultImplCopyWith<_$TFLiteInferenceResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
