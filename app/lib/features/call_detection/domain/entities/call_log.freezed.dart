// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallLog {

/// Unique identifier for this call log entry
 int get id;/// Raw phone number from the call event
 String get phoneNumber;/// Formatted phone number for display
 String get formattedNumber;/// Whether the caller ID is private/blocked
 bool get isPrivate;/// Whether the number is Korean
 bool get isKorean;/// Whether the number is international
 bool get isInternational;/// Whether the number has spoofing risk patterns (070, international)
 bool get isSpoofingRisk;/// Whether the number is in the whitelist (contacts)
 bool get isWhitelisted;/// Current state of the call ('idle', 'ringing', 'offhook', 'disconnected', 'unknown')
 String get callState;/// When the call was received (started ringing)
 DateTime get receivedAt;/// When the call was answered (nullable, only set if answered)
 DateTime? get answeredAt;/// When the call ended (nullable, only set when disconnected)
 DateTime? get endedAt;/// Call duration in seconds (nullable, calculated when call ends)
 int? get durationSeconds;
/// Create a copy of CallLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallLogCopyWith<CallLog> get copyWith => _$CallLogCopyWithImpl<CallLog>(this as CallLog, _$identity);

  /// Serializes this CallLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallLog&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.formattedNumber, formattedNumber) || other.formattedNumber == formattedNumber)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isKorean, isKorean) || other.isKorean == isKorean)&&(identical(other.isInternational, isInternational) || other.isInternational == isInternational)&&(identical(other.isSpoofingRisk, isSpoofingRisk) || other.isSpoofingRisk == isSpoofingRisk)&&(identical(other.isWhitelisted, isWhitelisted) || other.isWhitelisted == isWhitelisted)&&(identical(other.callState, callState) || other.callState == callState)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneNumber,formattedNumber,isPrivate,isKorean,isInternational,isSpoofingRisk,isWhitelisted,callState,receivedAt,answeredAt,endedAt,durationSeconds);

@override
String toString() {
  return 'CallLog(id: $id, phoneNumber: $phoneNumber, formattedNumber: $formattedNumber, isPrivate: $isPrivate, isKorean: $isKorean, isInternational: $isInternational, isSpoofingRisk: $isSpoofingRisk, isWhitelisted: $isWhitelisted, callState: $callState, receivedAt: $receivedAt, answeredAt: $answeredAt, endedAt: $endedAt, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class $CallLogCopyWith<$Res>  {
  factory $CallLogCopyWith(CallLog value, $Res Function(CallLog) _then) = _$CallLogCopyWithImpl;
@useResult
$Res call({
 int id, String phoneNumber, String formattedNumber, bool isPrivate, bool isKorean, bool isInternational, bool isSpoofingRisk, bool isWhitelisted, String callState, DateTime receivedAt, DateTime? answeredAt, DateTime? endedAt, int? durationSeconds
});




}
/// @nodoc
class _$CallLogCopyWithImpl<$Res>
    implements $CallLogCopyWith<$Res> {
  _$CallLogCopyWithImpl(this._self, this._then);

  final CallLog _self;
  final $Res Function(CallLog) _then;

/// Create a copy of CallLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phoneNumber = null,Object? formattedNumber = null,Object? isPrivate = null,Object? isKorean = null,Object? isInternational = null,Object? isSpoofingRisk = null,Object? isWhitelisted = null,Object? callState = null,Object? receivedAt = null,Object? answeredAt = freezed,Object? endedAt = freezed,Object? durationSeconds = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,formattedNumber: null == formattedNumber ? _self.formattedNumber : formattedNumber // ignore: cast_nullable_to_non_nullable
as String,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isKorean: null == isKorean ? _self.isKorean : isKorean // ignore: cast_nullable_to_non_nullable
as bool,isInternational: null == isInternational ? _self.isInternational : isInternational // ignore: cast_nullable_to_non_nullable
as bool,isSpoofingRisk: null == isSpoofingRisk ? _self.isSpoofingRisk : isSpoofingRisk // ignore: cast_nullable_to_non_nullable
as bool,isWhitelisted: null == isWhitelisted ? _self.isWhitelisted : isWhitelisted // ignore: cast_nullable_to_non_nullable
as bool,callState: null == callState ? _self.callState : callState // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CallLog].
extension CallLogPatterns on CallLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallLog value)  $default,){
final _that = this;
switch (_that) {
case _CallLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallLog value)?  $default,){
final _that = this;
switch (_that) {
case _CallLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String phoneNumber,  String formattedNumber,  bool isPrivate,  bool isKorean,  bool isInternational,  bool isSpoofingRisk,  bool isWhitelisted,  String callState,  DateTime receivedAt,  DateTime? answeredAt,  DateTime? endedAt,  int? durationSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallLog() when $default != null:
return $default(_that.id,_that.phoneNumber,_that.formattedNumber,_that.isPrivate,_that.isKorean,_that.isInternational,_that.isSpoofingRisk,_that.isWhitelisted,_that.callState,_that.receivedAt,_that.answeredAt,_that.endedAt,_that.durationSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String phoneNumber,  String formattedNumber,  bool isPrivate,  bool isKorean,  bool isInternational,  bool isSpoofingRisk,  bool isWhitelisted,  String callState,  DateTime receivedAt,  DateTime? answeredAt,  DateTime? endedAt,  int? durationSeconds)  $default,) {final _that = this;
switch (_that) {
case _CallLog():
return $default(_that.id,_that.phoneNumber,_that.formattedNumber,_that.isPrivate,_that.isKorean,_that.isInternational,_that.isSpoofingRisk,_that.isWhitelisted,_that.callState,_that.receivedAt,_that.answeredAt,_that.endedAt,_that.durationSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String phoneNumber,  String formattedNumber,  bool isPrivate,  bool isKorean,  bool isInternational,  bool isSpoofingRisk,  bool isWhitelisted,  String callState,  DateTime receivedAt,  DateTime? answeredAt,  DateTime? endedAt,  int? durationSeconds)?  $default,) {final _that = this;
switch (_that) {
case _CallLog() when $default != null:
return $default(_that.id,_that.phoneNumber,_that.formattedNumber,_that.isPrivate,_that.isKorean,_that.isInternational,_that.isSpoofingRisk,_that.isWhitelisted,_that.callState,_that.receivedAt,_that.answeredAt,_that.endedAt,_that.durationSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallLog implements CallLog {
  const _CallLog({required this.id, required this.phoneNumber, required this.formattedNumber, required this.isPrivate, required this.isKorean, required this.isInternational, required this.isSpoofingRisk, required this.isWhitelisted, required this.callState, required this.receivedAt, this.answeredAt, this.endedAt, this.durationSeconds});
  factory _CallLog.fromJson(Map<String, dynamic> json) => _$CallLogFromJson(json);

/// Unique identifier for this call log entry
@override final  int id;
/// Raw phone number from the call event
@override final  String phoneNumber;
/// Formatted phone number for display
@override final  String formattedNumber;
/// Whether the caller ID is private/blocked
@override final  bool isPrivate;
/// Whether the number is Korean
@override final  bool isKorean;
/// Whether the number is international
@override final  bool isInternational;
/// Whether the number has spoofing risk patterns (070, international)
@override final  bool isSpoofingRisk;
/// Whether the number is in the whitelist (contacts)
@override final  bool isWhitelisted;
/// Current state of the call ('idle', 'ringing', 'offhook', 'disconnected', 'unknown')
@override final  String callState;
/// When the call was received (started ringing)
@override final  DateTime receivedAt;
/// When the call was answered (nullable, only set if answered)
@override final  DateTime? answeredAt;
/// When the call ended (nullable, only set when disconnected)
@override final  DateTime? endedAt;
/// Call duration in seconds (nullable, calculated when call ends)
@override final  int? durationSeconds;

/// Create a copy of CallLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallLogCopyWith<_CallLog> get copyWith => __$CallLogCopyWithImpl<_CallLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallLog&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.formattedNumber, formattedNumber) || other.formattedNumber == formattedNumber)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isKorean, isKorean) || other.isKorean == isKorean)&&(identical(other.isInternational, isInternational) || other.isInternational == isInternational)&&(identical(other.isSpoofingRisk, isSpoofingRisk) || other.isSpoofingRisk == isSpoofingRisk)&&(identical(other.isWhitelisted, isWhitelisted) || other.isWhitelisted == isWhitelisted)&&(identical(other.callState, callState) || other.callState == callState)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneNumber,formattedNumber,isPrivate,isKorean,isInternational,isSpoofingRisk,isWhitelisted,callState,receivedAt,answeredAt,endedAt,durationSeconds);

@override
String toString() {
  return 'CallLog(id: $id, phoneNumber: $phoneNumber, formattedNumber: $formattedNumber, isPrivate: $isPrivate, isKorean: $isKorean, isInternational: $isInternational, isSpoofingRisk: $isSpoofingRisk, isWhitelisted: $isWhitelisted, callState: $callState, receivedAt: $receivedAt, answeredAt: $answeredAt, endedAt: $endedAt, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class _$CallLogCopyWith<$Res> implements $CallLogCopyWith<$Res> {
  factory _$CallLogCopyWith(_CallLog value, $Res Function(_CallLog) _then) = __$CallLogCopyWithImpl;
@override @useResult
$Res call({
 int id, String phoneNumber, String formattedNumber, bool isPrivate, bool isKorean, bool isInternational, bool isSpoofingRisk, bool isWhitelisted, String callState, DateTime receivedAt, DateTime? answeredAt, DateTime? endedAt, int? durationSeconds
});




}
/// @nodoc
class __$CallLogCopyWithImpl<$Res>
    implements _$CallLogCopyWith<$Res> {
  __$CallLogCopyWithImpl(this._self, this._then);

  final _CallLog _self;
  final $Res Function(_CallLog) _then;

/// Create a copy of CallLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phoneNumber = null,Object? formattedNumber = null,Object? isPrivate = null,Object? isKorean = null,Object? isInternational = null,Object? isSpoofingRisk = null,Object? isWhitelisted = null,Object? callState = null,Object? receivedAt = null,Object? answeredAt = freezed,Object? endedAt = freezed,Object? durationSeconds = freezed,}) {
  return _then(_CallLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,formattedNumber: null == formattedNumber ? _self.formattedNumber : formattedNumber // ignore: cast_nullable_to_non_nullable
as String,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isKorean: null == isKorean ? _self.isKorean : isKorean // ignore: cast_nullable_to_non_nullable
as bool,isInternational: null == isInternational ? _self.isInternational : isInternational // ignore: cast_nullable_to_non_nullable
as bool,isSpoofingRisk: null == isSpoofingRisk ? _self.isSpoofingRisk : isSpoofingRisk // ignore: cast_nullable_to_non_nullable
as bool,isWhitelisted: null == isWhitelisted ? _self.isWhitelisted : isWhitelisted // ignore: cast_nullable_to_non_nullable
as bool,callState: null == callState ? _self.callState : callState // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
