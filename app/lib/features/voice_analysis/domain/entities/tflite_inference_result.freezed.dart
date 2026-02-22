// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tflite_inference_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TFLiteInferenceResult {

/// Raw output tensor from model (e.g., [0.8, 0.2] for safe/fraud probabilities)
 List<double> get output;/// Time taken for inference in milliseconds (must be <100ms)
 int get inferenceTimeMs;/// When inference was performed
 DateTime get timestamp;
/// Create a copy of TFLiteInferenceResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TFLiteInferenceResultCopyWith<TFLiteInferenceResult> get copyWith => _$TFLiteInferenceResultCopyWithImpl<TFLiteInferenceResult>(this as TFLiteInferenceResult, _$identity);

  /// Serializes this TFLiteInferenceResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TFLiteInferenceResult&&const DeepCollectionEquality().equals(other.output, output)&&(identical(other.inferenceTimeMs, inferenceTimeMs) || other.inferenceTimeMs == inferenceTimeMs)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(output),inferenceTimeMs,timestamp);

@override
String toString() {
  return 'TFLiteInferenceResult(output: $output, inferenceTimeMs: $inferenceTimeMs, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $TFLiteInferenceResultCopyWith<$Res>  {
  factory $TFLiteInferenceResultCopyWith(TFLiteInferenceResult value, $Res Function(TFLiteInferenceResult) _then) = _$TFLiteInferenceResultCopyWithImpl;
@useResult
$Res call({
 List<double> output, int inferenceTimeMs, DateTime timestamp
});




}
/// @nodoc
class _$TFLiteInferenceResultCopyWithImpl<$Res>
    implements $TFLiteInferenceResultCopyWith<$Res> {
  _$TFLiteInferenceResultCopyWithImpl(this._self, this._then);

  final TFLiteInferenceResult _self;
  final $Res Function(TFLiteInferenceResult) _then;

/// Create a copy of TFLiteInferenceResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? output = null,Object? inferenceTimeMs = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as List<double>,inferenceTimeMs: null == inferenceTimeMs ? _self.inferenceTimeMs : inferenceTimeMs // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TFLiteInferenceResult].
extension TFLiteInferenceResultPatterns on TFLiteInferenceResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TFLiteInferenceResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TFLiteInferenceResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TFLiteInferenceResult value)  $default,){
final _that = this;
switch (_that) {
case _TFLiteInferenceResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TFLiteInferenceResult value)?  $default,){
final _that = this;
switch (_that) {
case _TFLiteInferenceResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<double> output,  int inferenceTimeMs,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TFLiteInferenceResult() when $default != null:
return $default(_that.output,_that.inferenceTimeMs,_that.timestamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<double> output,  int inferenceTimeMs,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _TFLiteInferenceResult():
return $default(_that.output,_that.inferenceTimeMs,_that.timestamp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<double> output,  int inferenceTimeMs,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _TFLiteInferenceResult() when $default != null:
return $default(_that.output,_that.inferenceTimeMs,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TFLiteInferenceResult implements TFLiteInferenceResult {
  const _TFLiteInferenceResult({required final  List<double> output, required this.inferenceTimeMs, required this.timestamp}): _output = output;
  factory _TFLiteInferenceResult.fromJson(Map<String, dynamic> json) => _$TFLiteInferenceResultFromJson(json);

/// Raw output tensor from model (e.g., [0.8, 0.2] for safe/fraud probabilities)
 final  List<double> _output;
/// Raw output tensor from model (e.g., [0.8, 0.2] for safe/fraud probabilities)
@override List<double> get output {
  if (_output is EqualUnmodifiableListView) return _output;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_output);
}

/// Time taken for inference in milliseconds (must be <100ms)
@override final  int inferenceTimeMs;
/// When inference was performed
@override final  DateTime timestamp;

/// Create a copy of TFLiteInferenceResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TFLiteInferenceResultCopyWith<_TFLiteInferenceResult> get copyWith => __$TFLiteInferenceResultCopyWithImpl<_TFLiteInferenceResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TFLiteInferenceResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TFLiteInferenceResult&&const DeepCollectionEquality().equals(other._output, _output)&&(identical(other.inferenceTimeMs, inferenceTimeMs) || other.inferenceTimeMs == inferenceTimeMs)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_output),inferenceTimeMs,timestamp);

@override
String toString() {
  return 'TFLiteInferenceResult(output: $output, inferenceTimeMs: $inferenceTimeMs, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$TFLiteInferenceResultCopyWith<$Res> implements $TFLiteInferenceResultCopyWith<$Res> {
  factory _$TFLiteInferenceResultCopyWith(_TFLiteInferenceResult value, $Res Function(_TFLiteInferenceResult) _then) = __$TFLiteInferenceResultCopyWithImpl;
@override @useResult
$Res call({
 List<double> output, int inferenceTimeMs, DateTime timestamp
});




}
/// @nodoc
class __$TFLiteInferenceResultCopyWithImpl<$Res>
    implements _$TFLiteInferenceResultCopyWith<$Res> {
  __$TFLiteInferenceResultCopyWithImpl(this._self, this._then);

  final _TFLiteInferenceResult _self;
  final $Res Function(_TFLiteInferenceResult) _then;

/// Create a copy of TFLiteInferenceResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? output = null,Object? inferenceTimeMs = null,Object? timestamp = null,}) {
  return _then(_TFLiteInferenceResult(
output: null == output ? _self._output : output // ignore: cast_nullable_to_non_nullable
as List<double>,inferenceTimeMs: null == inferenceTimeMs ? _self.inferenceTimeMs : inferenceTimeMs // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
