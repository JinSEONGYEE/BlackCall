// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 bool get isDetectionEnabled; String get sensitivityLevel; bool get isReportingEnabled; DateTime? get updatedAt;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.isDetectionEnabled, isDetectionEnabled) || other.isDetectionEnabled == isDetectionEnabled)&&(identical(other.sensitivityLevel, sensitivityLevel) || other.sensitivityLevel == sensitivityLevel)&&(identical(other.isReportingEnabled, isReportingEnabled) || other.isReportingEnabled == isReportingEnabled)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDetectionEnabled,sensitivityLevel,isReportingEnabled,updatedAt);

@override
String toString() {
  return 'AppSettings(isDetectionEnabled: $isDetectionEnabled, sensitivityLevel: $sensitivityLevel, isReportingEnabled: $isReportingEnabled, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 bool isDetectionEnabled, String sensitivityLevel, bool isReportingEnabled, DateTime? updatedAt
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDetectionEnabled = null,Object? sensitivityLevel = null,Object? isReportingEnabled = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
isDetectionEnabled: null == isDetectionEnabled ? _self.isDetectionEnabled : isDetectionEnabled // ignore: cast_nullable_to_non_nullable
as bool,sensitivityLevel: null == sensitivityLevel ? _self.sensitivityLevel : sensitivityLevel // ignore: cast_nullable_to_non_nullable
as String,isReportingEnabled: null == isReportingEnabled ? _self.isReportingEnabled : isReportingEnabled // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDetectionEnabled,  String sensitivityLevel,  bool isReportingEnabled,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.isDetectionEnabled,_that.sensitivityLevel,_that.isReportingEnabled,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDetectionEnabled,  String sensitivityLevel,  bool isReportingEnabled,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.isDetectionEnabled,_that.sensitivityLevel,_that.isReportingEnabled,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDetectionEnabled,  String sensitivityLevel,  bool isReportingEnabled,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.isDetectionEnabled,_that.sensitivityLevel,_that.isReportingEnabled,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({required this.isDetectionEnabled, required this.sensitivityLevel, required this.isReportingEnabled, this.updatedAt});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override final  bool isDetectionEnabled;
@override final  String sensitivityLevel;
@override final  bool isReportingEnabled;
@override final  DateTime? updatedAt;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.isDetectionEnabled, isDetectionEnabled) || other.isDetectionEnabled == isDetectionEnabled)&&(identical(other.sensitivityLevel, sensitivityLevel) || other.sensitivityLevel == sensitivityLevel)&&(identical(other.isReportingEnabled, isReportingEnabled) || other.isReportingEnabled == isReportingEnabled)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDetectionEnabled,sensitivityLevel,isReportingEnabled,updatedAt);

@override
String toString() {
  return 'AppSettings(isDetectionEnabled: $isDetectionEnabled, sensitivityLevel: $sensitivityLevel, isReportingEnabled: $isReportingEnabled, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool isDetectionEnabled, String sensitivityLevel, bool isReportingEnabled, DateTime? updatedAt
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDetectionEnabled = null,Object? sensitivityLevel = null,Object? isReportingEnabled = null,Object? updatedAt = freezed,}) {
  return _then(_AppSettings(
isDetectionEnabled: null == isDetectionEnabled ? _self.isDetectionEnabled : isDetectionEnabled // ignore: cast_nullable_to_non_nullable
as bool,sensitivityLevel: null == sensitivityLevel ? _self.sensitivityLevel : sensitivityLevel // ignore: cast_nullable_to_non_nullable
as String,isReportingEnabled: null == isReportingEnabled ? _self.isReportingEnabled : isReportingEnabled // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
