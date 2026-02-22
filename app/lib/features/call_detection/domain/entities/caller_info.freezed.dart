// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caller_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallerInfo {

/// Raw phone number from the call event
 String get phoneNumber;/// Formatted phone number for display (e.g., +82-10-1234-5678)
 String get formattedNumber;/// Whether the caller ID is private/blocked
 bool get isPrivate;/// Whether the number is Korean
 bool get isKorean;/// Whether the number is international
 bool get isInternational;/// Whether the number has spoofing risk patterns (070, international)
 bool get isSpoofingRisk;
/// Create a copy of CallerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallerInfoCopyWith<CallerInfo> get copyWith => _$CallerInfoCopyWithImpl<CallerInfo>(this as CallerInfo, _$identity);

  /// Serializes this CallerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallerInfo&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.formattedNumber, formattedNumber) || other.formattedNumber == formattedNumber)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isKorean, isKorean) || other.isKorean == isKorean)&&(identical(other.isInternational, isInternational) || other.isInternational == isInternational)&&(identical(other.isSpoofingRisk, isSpoofingRisk) || other.isSpoofingRisk == isSpoofingRisk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,formattedNumber,isPrivate,isKorean,isInternational,isSpoofingRisk);

@override
String toString() {
  return 'CallerInfo(phoneNumber: $phoneNumber, formattedNumber: $formattedNumber, isPrivate: $isPrivate, isKorean: $isKorean, isInternational: $isInternational, isSpoofingRisk: $isSpoofingRisk)';
}


}

/// @nodoc
abstract mixin class $CallerInfoCopyWith<$Res>  {
  factory $CallerInfoCopyWith(CallerInfo value, $Res Function(CallerInfo) _then) = _$CallerInfoCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String formattedNumber, bool isPrivate, bool isKorean, bool isInternational, bool isSpoofingRisk
});




}
/// @nodoc
class _$CallerInfoCopyWithImpl<$Res>
    implements $CallerInfoCopyWith<$Res> {
  _$CallerInfoCopyWithImpl(this._self, this._then);

  final CallerInfo _self;
  final $Res Function(CallerInfo) _then;

/// Create a copy of CallerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? formattedNumber = null,Object? isPrivate = null,Object? isKorean = null,Object? isInternational = null,Object? isSpoofingRisk = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,formattedNumber: null == formattedNumber ? _self.formattedNumber : formattedNumber // ignore: cast_nullable_to_non_nullable
as String,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isKorean: null == isKorean ? _self.isKorean : isKorean // ignore: cast_nullable_to_non_nullable
as bool,isInternational: null == isInternational ? _self.isInternational : isInternational // ignore: cast_nullable_to_non_nullable
as bool,isSpoofingRisk: null == isSpoofingRisk ? _self.isSpoofingRisk : isSpoofingRisk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CallerInfo].
extension CallerInfoPatterns on CallerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallerInfo value)  $default,){
final _that = this;
switch (_that) {
case _CallerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CallerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String formattedNumber,  bool isPrivate,  bool isKorean,  bool isInternational,  bool isSpoofingRisk)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallerInfo() when $default != null:
return $default(_that.phoneNumber,_that.formattedNumber,_that.isPrivate,_that.isKorean,_that.isInternational,_that.isSpoofingRisk);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String formattedNumber,  bool isPrivate,  bool isKorean,  bool isInternational,  bool isSpoofingRisk)  $default,) {final _that = this;
switch (_that) {
case _CallerInfo():
return $default(_that.phoneNumber,_that.formattedNumber,_that.isPrivate,_that.isKorean,_that.isInternational,_that.isSpoofingRisk);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String formattedNumber,  bool isPrivate,  bool isKorean,  bool isInternational,  bool isSpoofingRisk)?  $default,) {final _that = this;
switch (_that) {
case _CallerInfo() when $default != null:
return $default(_that.phoneNumber,_that.formattedNumber,_that.isPrivate,_that.isKorean,_that.isInternational,_that.isSpoofingRisk);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallerInfo implements CallerInfo {
  const _CallerInfo({required this.phoneNumber, required this.formattedNumber, required this.isPrivate, this.isKorean = false, this.isInternational = false, this.isSpoofingRisk = false});
  factory _CallerInfo.fromJson(Map<String, dynamic> json) => _$CallerInfoFromJson(json);

/// Raw phone number from the call event
@override final  String phoneNumber;
/// Formatted phone number for display (e.g., +82-10-1234-5678)
@override final  String formattedNumber;
/// Whether the caller ID is private/blocked
@override final  bool isPrivate;
/// Whether the number is Korean
@override@JsonKey() final  bool isKorean;
/// Whether the number is international
@override@JsonKey() final  bool isInternational;
/// Whether the number has spoofing risk patterns (070, international)
@override@JsonKey() final  bool isSpoofingRisk;

/// Create a copy of CallerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallerInfoCopyWith<_CallerInfo> get copyWith => __$CallerInfoCopyWithImpl<_CallerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallerInfo&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.formattedNumber, formattedNumber) || other.formattedNumber == formattedNumber)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isKorean, isKorean) || other.isKorean == isKorean)&&(identical(other.isInternational, isInternational) || other.isInternational == isInternational)&&(identical(other.isSpoofingRisk, isSpoofingRisk) || other.isSpoofingRisk == isSpoofingRisk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,formattedNumber,isPrivate,isKorean,isInternational,isSpoofingRisk);

@override
String toString() {
  return 'CallerInfo(phoneNumber: $phoneNumber, formattedNumber: $formattedNumber, isPrivate: $isPrivate, isKorean: $isKorean, isInternational: $isInternational, isSpoofingRisk: $isSpoofingRisk)';
}


}

/// @nodoc
abstract mixin class _$CallerInfoCopyWith<$Res> implements $CallerInfoCopyWith<$Res> {
  factory _$CallerInfoCopyWith(_CallerInfo value, $Res Function(_CallerInfo) _then) = __$CallerInfoCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String formattedNumber, bool isPrivate, bool isKorean, bool isInternational, bool isSpoofingRisk
});




}
/// @nodoc
class __$CallerInfoCopyWithImpl<$Res>
    implements _$CallerInfoCopyWith<$Res> {
  __$CallerInfoCopyWithImpl(this._self, this._then);

  final _CallerInfo _self;
  final $Res Function(_CallerInfo) _then;

/// Create a copy of CallerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? formattedNumber = null,Object? isPrivate = null,Object? isKorean = null,Object? isInternational = null,Object? isSpoofingRisk = null,}) {
  return _then(_CallerInfo(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,formattedNumber: null == formattedNumber ? _self.formattedNumber : formattedNumber // ignore: cast_nullable_to_non_nullable
as String,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isKorean: null == isKorean ? _self.isKorean : isKorean // ignore: cast_nullable_to_non_nullable
as bool,isInternational: null == isInternational ? _self.isInternational : isInternational // ignore: cast_nullable_to_non_nullable
as bool,isSpoofingRisk: null == isSpoofingRisk ? _self.isSpoofingRisk : isSpoofingRisk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
