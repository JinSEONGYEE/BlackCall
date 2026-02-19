// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallLog _$CallLogFromJson(Map<String, dynamic> json) {
  return _CallLog.fromJson(json);
}

/// @nodoc
mixin _$CallLog {
  int get id => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get formattedNumber => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  bool get isKorean => throw _privateConstructorUsedError;
  bool get isInternational => throw _privateConstructorUsedError;
  bool get isSpoofingRisk => throw _privateConstructorUsedError;
  bool get isWhitelisted => throw _privateConstructorUsedError;
  String get callState => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  DateTime? get answeredAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallLogCopyWith<CallLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogCopyWith<$Res> {
  factory $CallLogCopyWith(CallLog value, $Res Function(CallLog) then) =
      _$CallLogCopyWithImpl<$Res, CallLog>;
  @useResult
  $Res call(
      {int id,
      String phoneNumber,
      String formattedNumber,
      bool isPrivate,
      bool isKorean,
      bool isInternational,
      bool isSpoofingRisk,
      bool isWhitelisted,
      String callState,
      DateTime receivedAt,
      DateTime? answeredAt,
      DateTime? endedAt,
      int? durationSeconds});
}

/// @nodoc
class _$CallLogCopyWithImpl<$Res, $Val extends CallLog>
    implements $CallLogCopyWith<$Res> {
  _$CallLogCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? formattedNumber = null,
    Object? isPrivate = null,
    Object? isKorean = null,
    Object? isInternational = null,
    Object? isSpoofingRisk = null,
    Object? isWhitelisted = null,
    Object? callState = null,
    Object? receivedAt = null,
    Object? answeredAt = freezed,
    Object? endedAt = freezed,
    Object? durationSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber as String,
      formattedNumber: null == formattedNumber
          ? _value.formattedNumber
          : formattedNumber as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate as bool,
      isKorean: null == isKorean
          ? _value.isKorean
          : isKorean as bool,
      isInternational: null == isInternational
          ? _value.isInternational
          : isInternational as bool,
      isSpoofingRisk: null == isSpoofingRisk
          ? _value.isSpoofingRisk
          : isSpoofingRisk as bool,
      isWhitelisted: null == isWhitelisted
          ? _value.isWhitelisted
          : isWhitelisted as bool,
      callState: null == callState
          ? _value.callState
          : callState as String,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt as DateTime,
      answeredAt: freezed == answeredAt
          ? _value.answeredAt
          : answeredAt as DateTime?,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt as DateTime?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallLogImplCopyWith<$Res> implements $CallLogCopyWith<$Res> {
  factory _$$CallLogImplCopyWith(
          _$CallLogImpl value, $Res Function(_$CallLogImpl) then) =
      __$$CallLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String phoneNumber,
      String formattedNumber,
      bool isPrivate,
      bool isKorean,
      bool isInternational,
      bool isSpoofingRisk,
      bool isWhitelisted,
      String callState,
      DateTime receivedAt,
      DateTime? answeredAt,
      DateTime? endedAt,
      int? durationSeconds});
}

/// @nodoc
class __$$CallLogImplCopyWithImpl<$Res>
    extends _$CallLogCopyWithImpl<$Res, _$CallLogImpl>
    implements _$$CallLogImplCopyWith<$Res> {
  __$$CallLogImplCopyWithImpl(
      _$CallLogImpl _value, $Res Function(_$CallLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? formattedNumber = null,
    Object? isPrivate = null,
    Object? isKorean = null,
    Object? isInternational = null,
    Object? isSpoofingRisk = null,
    Object? isWhitelisted = null,
    Object? callState = null,
    Object? receivedAt = null,
    Object? answeredAt = freezed,
    Object? endedAt = freezed,
    Object? durationSeconds = freezed,
  }) {
    return _then(_$CallLogImpl(
      id: null == id
          ? _value.id
          : id as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber as String,
      formattedNumber: null == formattedNumber
          ? _value.formattedNumber
          : formattedNumber as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate as bool,
      isKorean: null == isKorean
          ? _value.isKorean
          : isKorean as bool,
      isInternational: null == isInternational
          ? _value.isInternational
          : isInternational as bool,
      isSpoofingRisk: null == isSpoofingRisk
          ? _value.isSpoofingRisk
          : isSpoofingRisk as bool,
      isWhitelisted: null == isWhitelisted
          ? _value.isWhitelisted
          : isWhitelisted as bool,
      callState: null == callState
          ? _value.callState
          : callState as String,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt as DateTime,
      answeredAt: freezed == answeredAt
          ? _value.answeredAt
          : answeredAt as DateTime?,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt as DateTime?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogImpl implements _CallLog {
  const _$CallLogImpl(
      {required this.id,
      required this.phoneNumber,
      required this.formattedNumber,
      required this.isPrivate,
      required this.isKorean,
      required this.isInternational,
      required this.isSpoofingRisk,
      required this.isWhitelisted,
      required this.callState,
      required this.receivedAt,
      this.answeredAt,
      this.endedAt,
      this.durationSeconds});

  factory _$CallLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogImplFromJson(json);

  @override
  final int id;
  @override
  final String phoneNumber;
  @override
  final String formattedNumber;
  @override
  final bool isPrivate;
  @override
  final bool isKorean;
  @override
  final bool isInternational;
  @override
  final bool isSpoofingRisk;
  @override
  final bool isWhitelisted;
  @override
  final String callState;
  @override
  final DateTime receivedAt;
  @override
  final DateTime? answeredAt;
  @override
  final DateTime? endedAt;
  @override
  final int? durationSeconds;

  @override
  String toString() {
    return 'CallLog(id: $id, phoneNumber: $phoneNumber, formattedNumber: $formattedNumber, isPrivate: $isPrivate, isKorean: $isKorean, isInternational: $isInternational, isSpoofingRisk: $isSpoofingRisk, isWhitelisted: $isWhitelisted, callState: $callState, receivedAt: $receivedAt, answeredAt: $answeredAt, endedAt: $endedAt, durationSeconds: $durationSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.formattedNumber, formattedNumber) ||
                other.formattedNumber == formattedNumber) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.isKorean, isKorean) ||
                other.isKorean == isKorean) &&
            (identical(other.isInternational, isInternational) ||
                other.isInternational == isInternational) &&
            (identical(other.isSpoofingRisk, isSpoofingRisk) ||
                other.isSpoofingRisk == isSpoofingRisk) &&
            (identical(other.isWhitelisted, isWhitelisted) ||
                other.isWhitelisted == isWhitelisted) &&
            (identical(other.callState, callState) ||
                other.callState == callState) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phoneNumber,
      formattedNumber,
      isPrivate,
      isKorean,
      isInternational,
      isSpoofingRisk,
      isWhitelisted,
      callState,
      receivedAt,
      answeredAt,
      endedAt,
      durationSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogImplCopyWith<_$CallLogImpl> get copyWith =>
      __$$CallLogImplCopyWithImpl<_$CallLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogImplToJson(
      this,
    );
  }
}

abstract class _CallLog implements CallLog {
  const factory _CallLog(
      {required final int id,
      required final String phoneNumber,
      required final String formattedNumber,
      required final bool isPrivate,
      required final bool isKorean,
      required final bool isInternational,
      required final bool isSpoofingRisk,
      required final bool isWhitelisted,
      required final String callState,
      required final DateTime receivedAt,
      final DateTime? answeredAt,
      final DateTime? endedAt,
      final int? durationSeconds}) = _$CallLogImpl;

  factory _CallLog.fromJson(Map<String, dynamic> json) = _$CallLogImpl.fromJson;

  @override
  int get id;
  @override
  String get phoneNumber;
  @override
  String get formattedNumber;
  @override
  bool get isPrivate;
  @override
  bool get isKorean;
  @override
  bool get isInternational;
  @override
  bool get isSpoofingRisk;
  @override
  bool get isWhitelisted;
  @override
  String get callState;
  @override
  DateTime get receivedAt;
  @override
  DateTime? get answeredAt;
  @override
  DateTime? get endedAt;
  @override
  int? get durationSeconds;
  @override
  @JsonKey(ignore: true)
  _$$CallLogImplCopyWith<_$CallLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
