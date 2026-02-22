// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioData {

/// Raw audio bytes (PCM 16-bit, mono)
@Uint8ListConverter() Uint8List get data;/// Length of valid data in bytes
 int get length;/// Sample rate in Hz (e.g., 16000 for 16kHz)
 int get sampleRate;/// Timestamp when audio was captured
 DateTime get timestamp;
/// Create a copy of AudioData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioDataCopyWith<AudioData> get copyWith => _$AudioDataCopyWithImpl<AudioData>(this as AudioData, _$identity);

  /// Serializes this AudioData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioData&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.length, length) || other.length == length)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),length,sampleRate,timestamp);

@override
String toString() {
  return 'AudioData(data: $data, length: $length, sampleRate: $sampleRate, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $AudioDataCopyWith<$Res>  {
  factory $AudioDataCopyWith(AudioData value, $Res Function(AudioData) _then) = _$AudioDataCopyWithImpl;
@useResult
$Res call({
@Uint8ListConverter() Uint8List data, int length, int sampleRate, DateTime timestamp
});




}
/// @nodoc
class _$AudioDataCopyWithImpl<$Res>
    implements $AudioDataCopyWith<$Res> {
  _$AudioDataCopyWithImpl(this._self, this._then);

  final AudioData _self;
  final $Res Function(AudioData) _then;

/// Create a copy of AudioData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? length = null,Object? sampleRate = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Uint8List,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioData].
extension AudioDataPatterns on AudioData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioData value)  $default,){
final _that = this;
switch (_that) {
case _AudioData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioData value)?  $default,){
final _that = this;
switch (_that) {
case _AudioData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@Uint8ListConverter()  Uint8List data,  int length,  int sampleRate,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioData() when $default != null:
return $default(_that.data,_that.length,_that.sampleRate,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@Uint8ListConverter()  Uint8List data,  int length,  int sampleRate,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _AudioData():
return $default(_that.data,_that.length,_that.sampleRate,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@Uint8ListConverter()  Uint8List data,  int length,  int sampleRate,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _AudioData() when $default != null:
return $default(_that.data,_that.length,_that.sampleRate,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioData implements AudioData {
  const _AudioData({@Uint8ListConverter() required this.data, required this.length, required this.sampleRate, required this.timestamp});
  factory _AudioData.fromJson(Map<String, dynamic> json) => _$AudioDataFromJson(json);

/// Raw audio bytes (PCM 16-bit, mono)
@override@Uint8ListConverter() final  Uint8List data;
/// Length of valid data in bytes
@override final  int length;
/// Sample rate in Hz (e.g., 16000 for 16kHz)
@override final  int sampleRate;
/// Timestamp when audio was captured
@override final  DateTime timestamp;

/// Create a copy of AudioData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioDataCopyWith<_AudioData> get copyWith => __$AudioDataCopyWithImpl<_AudioData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioData&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.length, length) || other.length == length)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),length,sampleRate,timestamp);

@override
String toString() {
  return 'AudioData(data: $data, length: $length, sampleRate: $sampleRate, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$AudioDataCopyWith<$Res> implements $AudioDataCopyWith<$Res> {
  factory _$AudioDataCopyWith(_AudioData value, $Res Function(_AudioData) _then) = __$AudioDataCopyWithImpl;
@override @useResult
$Res call({
@Uint8ListConverter() Uint8List data, int length, int sampleRate, DateTime timestamp
});




}
/// @nodoc
class __$AudioDataCopyWithImpl<$Res>
    implements _$AudioDataCopyWith<$Res> {
  __$AudioDataCopyWithImpl(this._self, this._then);

  final _AudioData _self;
  final $Res Function(_AudioData) _then;

/// Create a copy of AudioData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? length = null,Object? sampleRate = null,Object? timestamp = null,}) {
  return _then(_AudioData(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Uint8List,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
