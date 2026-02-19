// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keyword_detected_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease use `MyClass` instead.');

KeywordDetectedEvent _$KeywordDetectedEventFromJson(Map<String, dynamic> json) {
  return _KeywordDetectedEvent.fromJson(json);
}

/// @nodoc
mixin _$KeywordDetectedEvent {
  /// Detected keyword (e.g., "납치", "입금", "지금")
  String get keyword => throw _privateConstructorUsedError;

  /// When keyword was detected
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Confidence score (0.0 to 1.0)
  /// Higher values indicate more confident detection
  double get confidence => throw _privateConstructorUsedError;

  /// Audio data containing the keyword
  AudioData get audioData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeywordDetectedEventCopyWith<KeywordDetectedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeywordDetectedEventCopyWith<$Res> {
  factory $KeywordDetectedEventCopyWith(KeywordDetectedEvent value,
          $Res Function(KeywordDetectedEvent) then) =
      _$KeywordDetectedEventCopyWithImpl<$Res, KeywordDetectedEvent>;
  @useResult
  $Res call(
      {String keyword,
      DateTime timestamp,
      double confidence,
      AudioData audioData});

  $AudioDataCopyWith<$Res> get audioData;
}

/// @nodoc
class _$KeywordDetectedEventCopyWithImpl<$Res,
        $Val extends KeywordDetectedEvent>
    implements $KeywordDetectedEventCopyWith<$Res> {
  _$KeywordDetectedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? timestamp = null,
    Object? confidence = null,
    Object? audioData = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      audioData: null == audioData
          ? _value.audioData
          : audioData // ignore: cast_nullable_to_non_nullable
              as AudioData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioDataCopyWith<$Res> get audioData {
    return $AudioDataCopyWith<$Res>(_value.audioData, (value) {
      return _then(_value.copyWith(audioData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KeywordDetectedEventImplCopyWith<$Res>
    implements $KeywordDetectedEventCopyWith<$Res> {
  factory _$$KeywordDetectedEventImplCopyWith(
          _$KeywordDetectedEventImpl value,
          $Res Function(_$KeywordDetectedEventImpl) then) =
      __$$KeywordDetectedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String keyword,
      DateTime timestamp,
      double confidence,
      AudioData audioData});

  @override
  $AudioDataCopyWith<$Res> get audioData;
}

/// @nodoc
class __$$KeywordDetectedEventImplCopyWithImpl<$Res>
    extends _$KeywordDetectedEventCopyWithImpl<$Res,
        _$KeywordDetectedEventImpl>
    implements _$$KeywordDetectedEventImplCopyWith<$Res> {
  __$$KeywordDetectedEventImplCopyWithImpl(_$KeywordDetectedEventImpl _value,
      $Res Function(_$KeywordDetectedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? timestamp = null,
    Object? confidence = null,
    Object? audioData = null,
  }) {
    return _then(_$KeywordDetectedEventImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      audioData: null == audioData
          ? _value.audioData
          : audioData // ignore: cast_nullable_to_non_nullable
              as AudioData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeywordDetectedEventImpl implements _KeywordDetectedEvent {
  const _$KeywordDetectedEventImpl(
      {required this.keyword,
      required this.timestamp,
      required this.confidence,
      required this.audioData});

  factory _$KeywordDetectedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeywordDetectedEventImplFromJson(json);

  /// Detected keyword (e.g., "납치", "입금", "지금")
  @override
  final String keyword;

  /// When keyword was detected
  @override
  final DateTime timestamp;

  /// Confidence score (0.0 to 1.0)
  /// Higher values indicate more confident detection
  @override
  final double confidence;

  /// Audio data containing the keyword
  @override
  final AudioData audioData;

  @override
  String toString() {
    return 'KeywordDetectedEvent(keyword: $keyword, timestamp: $timestamp, confidence: $confidence, audioData: $audioData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeywordDetectedEventImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.audioData, audioData) ||
                other.audioData == audioData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, keyword, timestamp, confidence, audioData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeywordDetectedEventImplCopyWith<_$KeywordDetectedEventImpl>
      get copyWith => __$$KeywordDetectedEventImplCopyWithImpl<
          _$KeywordDetectedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeywordDetectedEventImplToJson(
      this,
    );
  }
}

abstract class _KeywordDetectedEvent implements KeywordDetectedEvent {
  const factory _KeywordDetectedEvent(
      {required final String keyword,
      required final DateTime timestamp,
      required final double confidence,
      required final AudioData audioData}) = _$KeywordDetectedEventImpl;

  factory _KeywordDetectedEvent.fromJson(Map<String, dynamic> json) =
      _$KeywordDetectedEventImpl.fromJson;

  @override

  /// Detected keyword (e.g., "납치", "입금", "지금")
  String get keyword;
  @override

  /// When keyword was detected
  DateTime get timestamp;
  @override

  /// Confidence score (0.0 to 1.0)
  /// Higher values indicate more confident detection
  double get confidence;
  @override

  /// Audio data containing the keyword
  AudioData get audioData;
  @override
  @JsonKey(ignore: true)
  _$$KeywordDetectedEventImplCopyWith<_$KeywordDetectedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
