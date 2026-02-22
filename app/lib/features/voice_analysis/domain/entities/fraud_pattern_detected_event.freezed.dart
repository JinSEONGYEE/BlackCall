// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fraud_pattern_detected_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FraudPatternDetectedEvent {

/// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
 String get patternType;/// Aggregate confidence score (0.0 to 1.0)
 double get confidence;/// When the pattern was detected
 DateTime get timestamp;/// List of keywords that contributed to this detection
 List<String> get contributingKeywords;
/// Create a copy of FraudPatternDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FraudPatternDetectedEventCopyWith<FraudPatternDetectedEvent> get copyWith => _$FraudPatternDetectedEventCopyWithImpl<FraudPatternDetectedEvent>(this as FraudPatternDetectedEvent, _$identity);

  /// Serializes this FraudPatternDetectedEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FraudPatternDetectedEvent&&(identical(other.patternType, patternType) || other.patternType == patternType)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.contributingKeywords, contributingKeywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patternType,confidence,timestamp,const DeepCollectionEquality().hash(contributingKeywords));

@override
String toString() {
  return 'FraudPatternDetectedEvent(patternType: $patternType, confidence: $confidence, timestamp: $timestamp, contributingKeywords: $contributingKeywords)';
}


}

/// @nodoc
abstract mixin class $FraudPatternDetectedEventCopyWith<$Res>  {
  factory $FraudPatternDetectedEventCopyWith(FraudPatternDetectedEvent value, $Res Function(FraudPatternDetectedEvent) _then) = _$FraudPatternDetectedEventCopyWithImpl;
@useResult
$Res call({
 String patternType, double confidence, DateTime timestamp, List<String> contributingKeywords
});




}
/// @nodoc
class _$FraudPatternDetectedEventCopyWithImpl<$Res>
    implements $FraudPatternDetectedEventCopyWith<$Res> {
  _$FraudPatternDetectedEventCopyWithImpl(this._self, this._then);

  final FraudPatternDetectedEvent _self;
  final $Res Function(FraudPatternDetectedEvent) _then;

/// Create a copy of FraudPatternDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patternType = null,Object? confidence = null,Object? timestamp = null,Object? contributingKeywords = null,}) {
  return _then(_self.copyWith(
patternType: null == patternType ? _self.patternType : patternType // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,contributingKeywords: null == contributingKeywords ? _self.contributingKeywords : contributingKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FraudPatternDetectedEvent].
extension FraudPatternDetectedEventPatterns on FraudPatternDetectedEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FraudPatternDetectedEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FraudPatternDetectedEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FraudPatternDetectedEvent value)  $default,){
final _that = this;
switch (_that) {
case _FraudPatternDetectedEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FraudPatternDetectedEvent value)?  $default,){
final _that = this;
switch (_that) {
case _FraudPatternDetectedEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String patternType,  double confidence,  DateTime timestamp,  List<String> contributingKeywords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FraudPatternDetectedEvent() when $default != null:
return $default(_that.patternType,_that.confidence,_that.timestamp,_that.contributingKeywords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String patternType,  double confidence,  DateTime timestamp,  List<String> contributingKeywords)  $default,) {final _that = this;
switch (_that) {
case _FraudPatternDetectedEvent():
return $default(_that.patternType,_that.confidence,_that.timestamp,_that.contributingKeywords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String patternType,  double confidence,  DateTime timestamp,  List<String> contributingKeywords)?  $default,) {final _that = this;
switch (_that) {
case _FraudPatternDetectedEvent() when $default != null:
return $default(_that.patternType,_that.confidence,_that.timestamp,_that.contributingKeywords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FraudPatternDetectedEvent implements FraudPatternDetectedEvent {
  const _FraudPatternDetectedEvent({required this.patternType, required this.confidence, required this.timestamp, required final  List<String> contributingKeywords}): _contributingKeywords = contributingKeywords;
  factory _FraudPatternDetectedEvent.fromJson(Map<String, dynamic> json) => _$FraudPatternDetectedEventFromJson(json);

/// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
@override final  String patternType;
/// Aggregate confidence score (0.0 to 1.0)
@override final  double confidence;
/// When the pattern was detected
@override final  DateTime timestamp;
/// List of keywords that contributed to this detection
 final  List<String> _contributingKeywords;
/// List of keywords that contributed to this detection
@override List<String> get contributingKeywords {
  if (_contributingKeywords is EqualUnmodifiableListView) return _contributingKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contributingKeywords);
}


/// Create a copy of FraudPatternDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FraudPatternDetectedEventCopyWith<_FraudPatternDetectedEvent> get copyWith => __$FraudPatternDetectedEventCopyWithImpl<_FraudPatternDetectedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FraudPatternDetectedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FraudPatternDetectedEvent&&(identical(other.patternType, patternType) || other.patternType == patternType)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._contributingKeywords, _contributingKeywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,patternType,confidence,timestamp,const DeepCollectionEquality().hash(_contributingKeywords));

@override
String toString() {
  return 'FraudPatternDetectedEvent(patternType: $patternType, confidence: $confidence, timestamp: $timestamp, contributingKeywords: $contributingKeywords)';
}


}

/// @nodoc
abstract mixin class _$FraudPatternDetectedEventCopyWith<$Res> implements $FraudPatternDetectedEventCopyWith<$Res> {
  factory _$FraudPatternDetectedEventCopyWith(_FraudPatternDetectedEvent value, $Res Function(_FraudPatternDetectedEvent) _then) = __$FraudPatternDetectedEventCopyWithImpl;
@override @useResult
$Res call({
 String patternType, double confidence, DateTime timestamp, List<String> contributingKeywords
});




}
/// @nodoc
class __$FraudPatternDetectedEventCopyWithImpl<$Res>
    implements _$FraudPatternDetectedEventCopyWith<$Res> {
  __$FraudPatternDetectedEventCopyWithImpl(this._self, this._then);

  final _FraudPatternDetectedEvent _self;
  final $Res Function(_FraudPatternDetectedEvent) _then;

/// Create a copy of FraudPatternDetectedEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patternType = null,Object? confidence = null,Object? timestamp = null,Object? contributingKeywords = null,}) {
  return _then(_FraudPatternDetectedEvent(
patternType: null == patternType ? _self.patternType : patternType // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,contributingKeywords: null == contributingKeywords ? _self._contributingKeywords : contributingKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
