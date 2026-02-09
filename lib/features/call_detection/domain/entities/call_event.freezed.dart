// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallEvent _$CallEventFromJson(Map<String, dynamic> json) {
  return _CallEvent.fromJson(json);
}

/// @nodoc
mixin _$CallEvent {
  String get phoneNumber => throw _privateConstructorUsedError;
  CallState get callState => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallEventCopyWith<CallEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallEventCopyWith<$Res> {
  factory $CallEventCopyWith(CallEvent value, $Res Function(CallEvent) then) =
      _$CallEventCopyWithImpl<$Res, CallEvent>;
  @useResult
  $Res call({String phoneNumber, CallState callState, int timestamp});
}

/// @nodoc
class _$CallEventCopyWithImpl<$Res, $Val extends CallEvent>
    implements $CallEventCopyWith<$Res> {
  _$CallEventCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? callState = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber as String,
      callState: null == callState
          ? _value.callState
          : callState as CallState,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallEventImplCopyWith<$Res>
    implements $CallEventCopyWith<$Res> {
  factory _$$CallEventImplCopyWith(
          _$CallEventImpl value, $Res Function(_$CallEventImpl) then) =
      __$$CallEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, CallState callState, int timestamp});
}

/// @nodoc
class __$$CallEventImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$CallEventImpl>
    implements _$$CallEventImplCopyWith<$Res> {
  __$$CallEventImplCopyWithImpl(
      _$CallEventImpl _value, $Res Function(_$CallEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? callState = null,
    Object? timestamp = null,
  }) {
    return _then(_$CallEventImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber as String,
      callState: null == callState
          ? _value.callState
          : callState as CallState,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallEventImpl implements _CallEvent {
  const _$CallEventImpl(
      {required this.phoneNumber,
      required this.callState,
      required this.timestamp});

  factory _$CallEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallEventImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final CallState callState;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'CallEvent(phoneNumber: $phoneNumber, callState: $callState, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallEventImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.callState, callState) ||
                other.callState == callState) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, callState, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallEventImplCopyWith<_$CallEventImpl> get copyWith =>
      __$$CallEventImplCopyWithImpl<_$CallEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallEventImplToJson(
      this,
    );
  }
}

abstract class _CallEvent implements CallEvent {
  const factory _CallEvent(
      {required final String phoneNumber,
      required final CallState callState,
      required final int timestamp}) = _$CallEventImpl;

  factory _CallEvent.fromJson(Map<String, dynamic> json) =
      _$CallEventImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  CallState get callState;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$CallEventImplCopyWith<_$CallEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
