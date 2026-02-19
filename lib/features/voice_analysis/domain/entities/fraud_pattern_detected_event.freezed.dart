// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fraud_pattern_detected_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease use `MyClass` instead.');

FraudPatternDetectedEvent _$FraudPatternDetectedEventFromJson(
    Map<String, dynamic> json) {
  return _FraudPatternDetectedEvent.fromJson(json);
}

/// @nodoc
mixin _$FraudPatternDetectedEvent {
  /// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
  String get patternType => throw _privateConstructorUsedError;

  /// Aggregate confidence score (0.0 to 1.0)
  double get confidence => throw _privateConstructorUsedError;

  /// When the pattern was detected
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// List of keywords that contributed to this detection
  List<String> get contributingKeywords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FraudPatternDetectedEventCopyWith<FraudPatternDetectedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FraudPatternDetectedEventCopyWith<$Res> {
  factory $FraudPatternDetectedEventCopyWith(FraudPatternDetectedEvent value,
          $Res Function(FraudPatternDetectedEvent) then) =
      _$FraudPatternDetectedEventCopyWithImpl<$Res, FraudPatternDetectedEvent>;
  @useResult
  $Res call(
      {String patternType,
      double confidence,
      DateTime timestamp,
      List<String> contributingKeywords});
}

/// @nodoc
class _$FraudPatternDetectedEventCopyWithImpl<$Res,
        $Val extends FraudPatternDetectedEvent>
    implements $FraudPatternDetectedEventCopyWith<$Res> {
  _$FraudPatternDetectedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patternType = null,
    Object? confidence = null,
    Object? timestamp = null,
    Object? contributingKeywords = null,
  }) {
    return _then(_value.copyWith(
      patternType: null == patternType
          ? _value.patternType
          : patternType // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contributingKeywords: null == contributingKeywords
          ? _value.contributingKeywords
          : contributingKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FraudPatternDetectedEventImplCopyWith<$Res>
    implements $FraudPatternDetectedEventCopyWith<$Res> {
  factory _$$FraudPatternDetectedEventImplCopyWith(
          _$FraudPatternDetectedEventImpl value,
          $Res Function(_$FraudPatternDetectedEventImpl) then) =
      __$$FraudPatternDetectedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String patternType,
      double confidence,
      DateTime timestamp,
      List<String> contributingKeywords});
}

/// @nodoc
class __$$FraudPatternDetectedEventImplCopyWithImpl<$Res>
    extends _$FraudPatternDetectedEventCopyWithImpl<$Res,
        _$FraudPatternDetectedEventImpl>
    implements _$$FraudPatternDetectedEventImplCopyWith<$Res> {
  __$$FraudPatternDetectedEventImplCopyWithImpl(
      _$FraudPatternDetectedEventImpl _value,
      $Res Function(_$FraudPatternDetectedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patternType = null,
    Object? confidence = null,
    Object? timestamp = null,
    Object? contributingKeywords = null,
  }) {
    return _then(_$FraudPatternDetectedEventImpl(
      patternType: null == patternType
          ? _value.patternType
          : patternType // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contributingKeywords: null == contributingKeywords
          ? _value.contributingKeywords
          : contributingKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FraudPatternDetectedEventImpl implements _FraudPatternDetectedEvent {
  const _$FraudPatternDetectedEventImpl(
      {required this.patternType,
      required this.confidence,
      required this.timestamp,
      required final List<String> contributingKeywords})
      : _contributingKeywords = contributingKeywords;

  factory _$FraudPatternDetectedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$FraudPatternDetectedEventImplFromJson(json);

  /// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
  @override
  final String patternType;

  /// Aggregate confidence score (0.0 to 1.0)
  @override
  final double confidence;

  /// When the pattern was detected
  @override
  final DateTime timestamp;

  /// List of keywords that contributed to this detection
  final List<String> _contributingKeywords;

  /// List of keywords that contributed to this detection
  @override
  List<String> get contributingKeywords {
    if (_contributingKeywords is EqualUnmodifiableListView)
      return _contributingKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributingKeywords);
  }

  @override
  String toString() {
    return 'FraudPatternDetectedEvent(patternType: $patternType, confidence: $confidence, timestamp: $timestamp, contributingKeywords: $contributingKeywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FraudPatternDetectedEventImpl &&
            (identical(other.patternType, patternType) ||
                other.patternType == patternType) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._contributingKeywords, _contributingKeywords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, patternType, confidence,
      timestamp, const DeepCollectionEquality().hash(_contributingKeywords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FraudPatternDetectedEventImplCopyWith<_$FraudPatternDetectedEventImpl>
      get copyWith => __$$FraudPatternDetectedEventImplCopyWithImpl<
          _$FraudPatternDetectedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FraudPatternDetectedEventImplToJson(
      this,
    );
  }
}

abstract class _FraudPatternDetectedEvent implements FraudPatternDetectedEvent {
  const factory _FraudPatternDetectedEvent(
          {required final String patternType,
          required final double confidence,
          required final DateTime timestamp,
          required final List<String> contributingKeywords}) =
      _$FraudPatternDetectedEventImpl;

  factory _FraudPatternDetectedEvent.fromJson(Map<String, dynamic> json) =
      _$FraudPatternDetectedEventImpl.fromJson;

  @override

  /// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
  String get patternType;
  @override

  /// Aggregate confidence score (0.0 to 1.0)
  double get confidence;
  @override

  /// When the pattern was detected
  DateTime get timestamp;
  @override

  /// List of keywords that contributed to this detection
  List<String> get contributingKeywords;
  @override
  @JsonKey(ignore: true)
  _$$FraudPatternDetectedEventImplCopyWith<_$FraudPatternDetectedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
