// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keyword_detected_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KeywordDetectedEvent {

/// Detected keyword (e.g., "납치", "입금", "지금")
 String get keyword;/// When keyword was detected
 DateTime get timestamp;/// Confidence score (0.0 to 1.0)
/// Higher values indicate more confident detection
 double get confidence;/// Audio data containing the keyword
 AudioData get audioData;
/// Create a copy of KeywordDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeywordDetectedEventCopyWith<KeywordDetectedEvent> get copyWith => _$KeywordDetectedEventCopyWithImpl<KeywordDetectedEvent>(this as KeywordDetectedEvent, _$identity);

  /// Serializes this KeywordDetectedEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeywordDetectedEvent&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.audioData, audioData) || other.audioData == audioData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyword,timestamp,confidence,audioData);

@override
String toString() {
  return 'KeywordDetectedEvent(keyword: $keyword, timestamp: $timestamp, confidence: $confidence, audioData: $audioData)';
}


}

/// @nodoc
abstract mixin class $KeywordDetectedEventCopyWith<$Res>  {
  factory $KeywordDetectedEventCopyWith(KeywordDetectedEvent value, $Res Function(KeywordDetectedEvent) _then) = _$KeywordDetectedEventCopyWithImpl;
@useResult
$Res call({
 String keyword, DateTime timestamp, double confidence, AudioData audioData
});


$AudioDataCopyWith<$Res> get audioData;

}
/// @nodoc
class _$KeywordDetectedEventCopyWithImpl<$Res>
    implements $KeywordDetectedEventCopyWith<$Res> {
  _$KeywordDetectedEventCopyWithImpl(this._self, this._then);

  final KeywordDetectedEvent _self;
  final $Res Function(KeywordDetectedEvent) _then;

/// Create a copy of KeywordDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = null,Object? timestamp = null,Object? confidence = null,Object? audioData = null,}) {
  return _then(_self.copyWith(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,audioData: null == audioData ? _self.audioData : audioData // ignore: cast_nullable_to_non_nullable
as AudioData,
  ));
}
/// Create a copy of KeywordDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioDataCopyWith<$Res> get audioData {
  
  return $AudioDataCopyWith<$Res>(_self.audioData, (value) {
    return _then(_self.copyWith(audioData: value));
  });
}
}


/// Adds pattern-matching-related methods to [KeywordDetectedEvent].
extension KeywordDetectedEventPatterns on KeywordDetectedEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeywordDetectedEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeywordDetectedEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeywordDetectedEvent value)  $default,){
final _that = this;
switch (_that) {
case _KeywordDetectedEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeywordDetectedEvent value)?  $default,){
final _that = this;
switch (_that) {
case _KeywordDetectedEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String keyword,  DateTime timestamp,  double confidence,  AudioData audioData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeywordDetectedEvent() when $default != null:
return $default(_that.keyword,_that.timestamp,_that.confidence,_that.audioData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String keyword,  DateTime timestamp,  double confidence,  AudioData audioData)  $default,) {final _that = this;
switch (_that) {
case _KeywordDetectedEvent():
return $default(_that.keyword,_that.timestamp,_that.confidence,_that.audioData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String keyword,  DateTime timestamp,  double confidence,  AudioData audioData)?  $default,) {final _that = this;
switch (_that) {
case _KeywordDetectedEvent() when $default != null:
return $default(_that.keyword,_that.timestamp,_that.confidence,_that.audioData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeywordDetectedEvent implements KeywordDetectedEvent {
  const _KeywordDetectedEvent({required this.keyword, required this.timestamp, required this.confidence, required this.audioData});
  factory _KeywordDetectedEvent.fromJson(Map<String, dynamic> json) => _$KeywordDetectedEventFromJson(json);

/// Detected keyword (e.g., "납치", "입금", "지금")
@override final  String keyword;
/// When keyword was detected
@override final  DateTime timestamp;
/// Confidence score (0.0 to 1.0)
/// Higher values indicate more confident detection
@override final  double confidence;
/// Audio data containing the keyword
@override final  AudioData audioData;

/// Create a copy of KeywordDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeywordDetectedEventCopyWith<_KeywordDetectedEvent> get copyWith => __$KeywordDetectedEventCopyWithImpl<_KeywordDetectedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeywordDetectedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeywordDetectedEvent&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.audioData, audioData) || other.audioData == audioData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyword,timestamp,confidence,audioData);

@override
String toString() {
  return 'KeywordDetectedEvent(keyword: $keyword, timestamp: $timestamp, confidence: $confidence, audioData: $audioData)';
}


}

/// @nodoc
abstract mixin class _$KeywordDetectedEventCopyWith<$Res> implements $KeywordDetectedEventCopyWith<$Res> {
  factory _$KeywordDetectedEventCopyWith(_KeywordDetectedEvent value, $Res Function(_KeywordDetectedEvent) _then) = __$KeywordDetectedEventCopyWithImpl;
@override @useResult
$Res call({
 String keyword, DateTime timestamp, double confidence, AudioData audioData
});


@override $AudioDataCopyWith<$Res> get audioData;

}
/// @nodoc
class __$KeywordDetectedEventCopyWithImpl<$Res>
    implements _$KeywordDetectedEventCopyWith<$Res> {
  __$KeywordDetectedEventCopyWithImpl(this._self, this._then);

  final _KeywordDetectedEvent _self;
  final $Res Function(_KeywordDetectedEvent) _then;

/// Create a copy of KeywordDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = null,Object? timestamp = null,Object? confidence = null,Object? audioData = null,}) {
  return _then(_KeywordDetectedEvent(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,audioData: null == audioData ? _self.audioData : audioData // ignore: cast_nullable_to_non_nullable
as AudioData,
  ));
}

/// Create a copy of KeywordDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioDataCopyWith<$Res> get audioData {
  
  return $AudioDataCopyWith<$Res>(_self.audioData, (value) {
    return _then(_self.copyWith(audioData: value));
  });
}
}

// dart format on
