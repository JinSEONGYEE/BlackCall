// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caller_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallerInfo _$CallerInfoFromJson(Map<String, dynamic> json) {
  return _CallerInfo.fromJson(json);
}

/// @nodoc
mixin _$CallerInfo {
  /// Raw phone number from the call event
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Formatted phone number for display (e.g., +82-10-1234-5678)
  String get formattedNumber => throw _privateConstructorUsedError;

  /// Whether the caller ID is private/blocked
  bool get isPrivate => throw _privateConstructorUsedError;

  /// Whether the number is Korean
  bool get isKorean => throw _privateConstructorUsedError;

  /// Whether the number is international
  bool get isInternational => throw _privateConstructorUsedError;

  /// Whether the number has spoofing risk patterns (070, international)
  bool get isSpoofingRisk => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallerInfoCopyWith<CallerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallerInfoCopyWith<$Res> {
  factory $CallerInfoCopyWith(
          CallerInfo value, $Res Function(CallerInfo) then) =
      _$CallerInfoCopyWithImpl<$Res, CallerInfo>;
  @useResult
  $Res call(
      {String phoneNumber,
      String formattedNumber,
      bool isPrivate,
      bool isKorean,
      bool isInternational,
      bool isSpoofingRisk});
}

/// @nodoc
class _$CallerInfoCopyWithImpl<$Res, $Val extends CallerInfo>
    implements $CallerInfoCopyWith<$Res> {
  _$CallerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? formattedNumber = null,
    Object? isPrivate = null,
    Object? isKorean = null,
    Object? isInternational = null,
    Object? isSpoofingRisk = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallerInfoImplCopyWith<$Res>
    implements $CallerInfoCopyWith<$Res> {
  factory _$$CallerInfoImplCopyWith(
          _$CallerInfoImpl value, $Res Function(_$CallerInfoImpl) then) =
      __$$CallerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String formattedNumber,
      bool isPrivate,
      bool isKorean,
      bool isInternational,
      bool isSpoofingRisk});
}

/// @nodoc
class __$$CallerInfoImplCopyWithImpl<$Res>
    extends _$CallerInfoCopyWithImpl<$Res, _$CallerInfoImpl>
    implements _$$CallerInfoImplCopyWith<$Res> {
  __$$CallerInfoImplCopyWithImpl(
      _$CallerInfoImpl _value, $Res Function(_$CallerInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? formattedNumber = null,
    Object? isPrivate = null,
    Object? isKorean = null,
    Object? isInternational = null,
    Object? isSpoofingRisk = null,
  }) {
    return _then(_$CallerInfoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallerInfoImpl implements _CallerInfo {
  const _$CallerInfoImpl(
      {required this.phoneNumber,
      required this.formattedNumber,
      required this.isPrivate,
      this.isKorean = false,
      this.isInternational = false,
      this.isSpoofingRisk = false});

  factory _$CallerInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallerInfoImplFromJson(json);

  /// Raw phone number from the call event
  @override
  final String phoneNumber;

  /// Formatted phone number for display (e.g., +82-10-1234-5678)
  @override
  final String formattedNumber;

  /// Whether the caller ID is private/blocked
  @override
  final bool isPrivate;

  /// Whether the number is Korean
  @override
  @JsonKey()
  final bool isKorean;

  /// Whether the number is international
  @override
  @JsonKey()
  final bool isInternational;

  /// Whether the number has spoofing risk patterns (070, international)
  @override
  @JsonKey()
  final bool isSpoofingRisk;

  @override
  String toString() {
    return 'CallerInfo(phoneNumber: $phoneNumber, formattedNumber: $formattedNumber, isPrivate: $isPrivate, isKorean: $isKorean, isInternational: $isInternational, isSpoofingRisk: $isSpoofingRisk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallerInfoImpl &&
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
                other.isSpoofingRisk == isSpoofingRisk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, formattedNumber,
      isPrivate, isKorean, isInternational, isSpoofingRisk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallerInfoImplCopyWith<_$CallerInfoImpl> get copyWith =>
      __$$CallerInfoImplCopyWithImpl<_$CallerInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallerInfoImplToJson(
      this,
    );
  }
}

abstract class _CallerInfo implements CallerInfo {
  const factory _CallerInfo(
      {required final String phoneNumber,
      required final String formattedNumber,
      required final bool isPrivate,
      final bool isKorean,
      final bool isInternational,
      final bool isSpoofingRisk}) = _$CallerInfoImpl;

  factory _CallerInfo.fromJson(Map<String, dynamic> json) =
      _$CallerInfoImpl.fromJson;

  @override

  /// Raw phone number from the call event
  String get phoneNumber;
  @override

  /// Formatted phone number for display (e.g., +82-10-1234-5678)
  String get formattedNumber;
  @override

  /// Whether the caller ID is private/blocked
  bool get isPrivate;
  @override

  /// Whether the number is Korean
  bool get isKorean;
  @override

  /// Whether the number is international
  bool get isInternational;
  @override

  /// Whether the number has spoofing risk patterns (070, international)
  bool get isSpoofingRisk;
  @override
  @JsonKey(ignore: true)
  _$$CallerInfoImplCopyWith<_$CallerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
