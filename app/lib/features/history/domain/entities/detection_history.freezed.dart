// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetectionHistory {

 int? get id; String? get phoneNumberHash; DateTime get detectedAt;@JsonKey(name: 'type') String get detectionType; double? get confidence; String? get details;
/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectionHistoryCopyWith<DetectionHistory> get copyWith => _$DetectionHistoryCopyWithImpl<DetectionHistory>(this as DetectionHistory, _$identity);

  /// Serializes this DetectionHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectionHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneNumberHash, phoneNumberHash) || other.phoneNumberHash == phoneNumberHash)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt)&&(identical(other.detectionType, detectionType) || other.detectionType == detectionType)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneNumberHash,detectedAt,detectionType,confidence,details);

@override
String toString() {
  return 'DetectionHistory(id: $id, phoneNumberHash: $phoneNumberHash, detectedAt: $detectedAt, detectionType: $detectionType, confidence: $confidence, details: $details)';
}


}

/// @nodoc
abstract mixin class $DetectionHistoryCopyWith<$Res>  {
  factory $DetectionHistoryCopyWith(DetectionHistory value, $Res Function(DetectionHistory) _then) = _$DetectionHistoryCopyWithImpl;
@useResult
$Res call({
 int? id, String? phoneNumberHash, DateTime detectedAt,@JsonKey(name: 'type') String detectionType, double? confidence, String? details
});




}
/// @nodoc
class _$DetectionHistoryCopyWithImpl<$Res>
    implements $DetectionHistoryCopyWith<$Res> {
  _$DetectionHistoryCopyWithImpl(this._self, this._then);

  final DetectionHistory _self;
  final $Res Function(DetectionHistory) _then;

/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? phoneNumberHash = freezed,Object? detectedAt = null,Object? detectionType = null,Object? confidence = freezed,Object? details = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,phoneNumberHash: freezed == phoneNumberHash ? _self.phoneNumberHash : phoneNumberHash // ignore: cast_nullable_to_non_nullable
as String?,detectedAt: null == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,detectionType: null == detectionType ? _self.detectionType : detectionType // ignore: cast_nullable_to_non_nullable
as String,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetectionHistory].
extension DetectionHistoryPatterns on DetectionHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetectionHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetectionHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetectionHistory value)  $default,){
final _that = this;
switch (_that) {
case _DetectionHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetectionHistory value)?  $default,){
final _that = this;
switch (_that) {
case _DetectionHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? phoneNumberHash,  DateTime detectedAt, @JsonKey(name: 'type')  String detectionType,  double? confidence,  String? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetectionHistory() when $default != null:
return $default(_that.id,_that.phoneNumberHash,_that.detectedAt,_that.detectionType,_that.confidence,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? phoneNumberHash,  DateTime detectedAt, @JsonKey(name: 'type')  String detectionType,  double? confidence,  String? details)  $default,) {final _that = this;
switch (_that) {
case _DetectionHistory():
return $default(_that.id,_that.phoneNumberHash,_that.detectedAt,_that.detectionType,_that.confidence,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? phoneNumberHash,  DateTime detectedAt, @JsonKey(name: 'type')  String detectionType,  double? confidence,  String? details)?  $default,) {final _that = this;
switch (_that) {
case _DetectionHistory() when $default != null:
return $default(_that.id,_that.phoneNumberHash,_that.detectedAt,_that.detectionType,_that.confidence,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetectionHistory implements DetectionHistory {
  const _DetectionHistory({this.id, this.phoneNumberHash, required this.detectedAt, @JsonKey(name: 'type') required this.detectionType, this.confidence, this.details});
  factory _DetectionHistory.fromJson(Map<String, dynamic> json) => _$DetectionHistoryFromJson(json);

@override final  int? id;
@override final  String? phoneNumberHash;
@override final  DateTime detectedAt;
@override@JsonKey(name: 'type') final  String detectionType;
@override final  double? confidence;
@override final  String? details;

/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetectionHistoryCopyWith<_DetectionHistory> get copyWith => __$DetectionHistoryCopyWithImpl<_DetectionHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetectionHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetectionHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneNumberHash, phoneNumberHash) || other.phoneNumberHash == phoneNumberHash)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt)&&(identical(other.detectionType, detectionType) || other.detectionType == detectionType)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneNumberHash,detectedAt,detectionType,confidence,details);

@override
String toString() {
  return 'DetectionHistory(id: $id, phoneNumberHash: $phoneNumberHash, detectedAt: $detectedAt, detectionType: $detectionType, confidence: $confidence, details: $details)';
}


}

/// @nodoc
abstract mixin class _$DetectionHistoryCopyWith<$Res> implements $DetectionHistoryCopyWith<$Res> {
  factory _$DetectionHistoryCopyWith(_DetectionHistory value, $Res Function(_DetectionHistory) _then) = __$DetectionHistoryCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? phoneNumberHash, DateTime detectedAt,@JsonKey(name: 'type') String detectionType, double? confidence, String? details
});




}
/// @nodoc
class __$DetectionHistoryCopyWithImpl<$Res>
    implements _$DetectionHistoryCopyWith<$Res> {
  __$DetectionHistoryCopyWithImpl(this._self, this._then);

  final _DetectionHistory _self;
  final $Res Function(_DetectionHistory) _then;

/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? phoneNumberHash = freezed,Object? detectedAt = null,Object? detectionType = null,Object? confidence = freezed,Object? details = freezed,}) {
  return _then(_DetectionHistory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,phoneNumberHash: freezed == phoneNumberHash ? _self.phoneNumberHash : phoneNumberHash // ignore: cast_nullable_to_non_nullable
as String?,detectedAt: null == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,detectionType: null == detectionType ? _self.detectionType : detectionType // ignore: cast_nullable_to_non_nullable
as String,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
