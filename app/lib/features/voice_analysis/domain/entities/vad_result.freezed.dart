// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vad_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VadResult {

/// true if speech detected, false if silence
 bool get isSpeech;/// RMS energy level (0.0 to 1.0)
 double get energy;/// Current threshold value
 double get threshold;/// Timestamp when analysis was performed
 DateTime get timestamp;
/// Create a copy of VadResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VadResultCopyWith<VadResult> get copyWith => _$VadResultCopyWithImpl<VadResult>(this as VadResult, _$identity);

  /// Serializes this VadResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VadResult&&(identical(other.isSpeech, isSpeech) || other.isSpeech == isSpeech)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSpeech,energy,threshold,timestamp);

@override
String toString() {
  return 'VadResult(isSpeech: $isSpeech, energy: $energy, threshold: $threshold, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $VadResultCopyWith<$Res>  {
  factory $VadResultCopyWith(VadResult value, $Res Function(VadResult) _then) = _$VadResultCopyWithImpl;
@useResult
$Res call({
 bool isSpeech, double energy, double threshold, DateTime timestamp
});




}
/// @nodoc
class _$VadResultCopyWithImpl<$Res>
    implements $VadResultCopyWith<$Res> {
  _$VadResultCopyWithImpl(this._self, this._then);

  final VadResult _self;
  final $Res Function(VadResult) _then;

/// Create a copy of VadResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSpeech = null,Object? energy = null,Object? threshold = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
isSpeech: null == isSpeech ? _self.isSpeech : isSpeech // ignore: cast_nullable_to_non_nullable
as bool,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [VadResult].
extension VadResultPatterns on VadResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VadResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VadResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VadResult value)  $default,){
final _that = this;
switch (_that) {
case _VadResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VadResult value)?  $default,){
final _that = this;
switch (_that) {
case _VadResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSpeech,  double energy,  double threshold,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VadResult() when $default != null:
return $default(_that.isSpeech,_that.energy,_that.threshold,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSpeech,  double energy,  double threshold,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _VadResult():
return $default(_that.isSpeech,_that.energy,_that.threshold,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSpeech,  double energy,  double threshold,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _VadResult() when $default != null:
return $default(_that.isSpeech,_that.energy,_that.threshold,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VadResult implements VadResult {
  const _VadResult({required this.isSpeech, required this.energy, required this.threshold, required this.timestamp});
  factory _VadResult.fromJson(Map<String, dynamic> json) => _$VadResultFromJson(json);

/// true if speech detected, false if silence
@override final  bool isSpeech;
/// RMS energy level (0.0 to 1.0)
@override final  double energy;
/// Current threshold value
@override final  double threshold;
/// Timestamp when analysis was performed
@override final  DateTime timestamp;

/// Create a copy of VadResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VadResultCopyWith<_VadResult> get copyWith => __$VadResultCopyWithImpl<_VadResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VadResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VadResult&&(identical(other.isSpeech, isSpeech) || other.isSpeech == isSpeech)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSpeech,energy,threshold,timestamp);

@override
String toString() {
  return 'VadResult(isSpeech: $isSpeech, energy: $energy, threshold: $threshold, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$VadResultCopyWith<$Res> implements $VadResultCopyWith<$Res> {
  factory _$VadResultCopyWith(_VadResult value, $Res Function(_VadResult) _then) = __$VadResultCopyWithImpl;
@override @useResult
$Res call({
 bool isSpeech, double energy, double threshold, DateTime timestamp
});




}
/// @nodoc
class __$VadResultCopyWithImpl<$Res>
    implements _$VadResultCopyWith<$Res> {
  __$VadResultCopyWithImpl(this._self, this._then);

  final _VadResult _self;
  final $Res Function(_VadResult) _then;

/// Create a copy of VadResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSpeech = null,Object? energy = null,Object? threshold = null,Object? timestamp = null,}) {
  return _then(_VadResult(
isSpeech: null == isSpeech ? _self.isSpeech : isSpeech // ignore: cast_nullable_to_non_nullable
as bool,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
