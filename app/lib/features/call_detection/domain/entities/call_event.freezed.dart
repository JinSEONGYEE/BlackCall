// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallEvent {

/// Phone number of the caller (may be empty for private/blocked calls)
 String get phoneNumber;/// Current state of the call
 CallState get callState;/// Timestamp when the event occurred (milliseconds since epoch)
 int get timestamp;
/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallEventCopyWith<CallEvent> get copyWith => _$CallEventCopyWithImpl<CallEvent>(this as CallEvent, _$identity);

  /// Serializes this CallEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallEvent&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.callState, callState) || other.callState == callState)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,callState,timestamp);

@override
String toString() {
  return 'CallEvent(phoneNumber: $phoneNumber, callState: $callState, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $CallEventCopyWith<$Res>  {
  factory $CallEventCopyWith(CallEvent value, $Res Function(CallEvent) _then) = _$CallEventCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, CallState callState, int timestamp
});




}
/// @nodoc
class _$CallEventCopyWithImpl<$Res>
    implements $CallEventCopyWith<$Res> {
  _$CallEventCopyWithImpl(this._self, this._then);

  final CallEvent _self;
  final $Res Function(CallEvent) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? callState = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,callState: null == callState ? _self.callState : callState // ignore: cast_nullable_to_non_nullable
as CallState,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CallEvent].
extension CallEventPatterns on CallEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallEvent value)  $default,){
final _that = this;
switch (_that) {
case _CallEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallEvent value)?  $default,){
final _that = this;
switch (_that) {
case _CallEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  CallState callState,  int timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallEvent() when $default != null:
return $default(_that.phoneNumber,_that.callState,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  CallState callState,  int timestamp)  $default,) {final _that = this;
switch (_that) {
case _CallEvent():
return $default(_that.phoneNumber,_that.callState,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  CallState callState,  int timestamp)?  $default,) {final _that = this;
switch (_that) {
case _CallEvent() when $default != null:
return $default(_that.phoneNumber,_that.callState,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallEvent implements CallEvent {
  const _CallEvent({required this.phoneNumber, required this.callState, required this.timestamp});
  factory _CallEvent.fromJson(Map<String, dynamic> json) => _$CallEventFromJson(json);

/// Phone number of the caller (may be empty for private/blocked calls)
@override final  String phoneNumber;
/// Current state of the call
@override final  CallState callState;
/// Timestamp when the event occurred (milliseconds since epoch)
@override final  int timestamp;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallEventCopyWith<_CallEvent> get copyWith => __$CallEventCopyWithImpl<_CallEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallEvent&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.callState, callState) || other.callState == callState)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,callState,timestamp);

@override
String toString() {
  return 'CallEvent(phoneNumber: $phoneNumber, callState: $callState, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$CallEventCopyWith<$Res> implements $CallEventCopyWith<$Res> {
  factory _$CallEventCopyWith(_CallEvent value, $Res Function(_CallEvent) _then) = __$CallEventCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, CallState callState, int timestamp
});




}
/// @nodoc
class __$CallEventCopyWithImpl<$Res>
    implements _$CallEventCopyWith<$Res> {
  __$CallEventCopyWithImpl(this._self, this._then);

  final _CallEvent _self;
  final $Res Function(_CallEvent) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? callState = null,Object? timestamp = null,}) {
  return _then(_CallEvent(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,callState: null == callState ? _self.callState : callState // ignore: cast_nullable_to_non_nullable
as CallState,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
