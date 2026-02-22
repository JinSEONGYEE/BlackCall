// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whitelist_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WhitelistEntry {

/// Unique identifier for this whitelist entry
 int get id;/// SHA-256 hash of the normalized phone number
///
/// Phone numbers are hashed for privacy. The hash is 64 characters long.
 String get phoneNumberHash;/// Timestamp when this entry was added to the whitelist
 DateTime get addedAt;/// Contact name from address book (optional)
///
/// May be null if the contact has no name.
 String? get contactName;
/// Create a copy of WhitelistEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WhitelistEntryCopyWith<WhitelistEntry> get copyWith => _$WhitelistEntryCopyWithImpl<WhitelistEntry>(this as WhitelistEntry, _$identity);

  /// Serializes this WhitelistEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WhitelistEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneNumberHash, phoneNumberHash) || other.phoneNumberHash == phoneNumberHash)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.contactName, contactName) || other.contactName == contactName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneNumberHash,addedAt,contactName);

@override
String toString() {
  return 'WhitelistEntry(id: $id, phoneNumberHash: $phoneNumberHash, addedAt: $addedAt, contactName: $contactName)';
}


}

/// @nodoc
abstract mixin class $WhitelistEntryCopyWith<$Res>  {
  factory $WhitelistEntryCopyWith(WhitelistEntry value, $Res Function(WhitelistEntry) _then) = _$WhitelistEntryCopyWithImpl;
@useResult
$Res call({
 int id, String phoneNumberHash, DateTime addedAt, String? contactName
});




}
/// @nodoc
class _$WhitelistEntryCopyWithImpl<$Res>
    implements $WhitelistEntryCopyWith<$Res> {
  _$WhitelistEntryCopyWithImpl(this._self, this._then);

  final WhitelistEntry _self;
  final $Res Function(WhitelistEntry) _then;

/// Create a copy of WhitelistEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phoneNumberHash = null,Object? addedAt = null,Object? contactName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phoneNumberHash: null == phoneNumberHash ? _self.phoneNumberHash : phoneNumberHash // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WhitelistEntry].
extension WhitelistEntryPatterns on WhitelistEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WhitelistEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WhitelistEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WhitelistEntry value)  $default,){
final _that = this;
switch (_that) {
case _WhitelistEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WhitelistEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WhitelistEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String phoneNumberHash,  DateTime addedAt,  String? contactName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WhitelistEntry() when $default != null:
return $default(_that.id,_that.phoneNumberHash,_that.addedAt,_that.contactName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String phoneNumberHash,  DateTime addedAt,  String? contactName)  $default,) {final _that = this;
switch (_that) {
case _WhitelistEntry():
return $default(_that.id,_that.phoneNumberHash,_that.addedAt,_that.contactName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String phoneNumberHash,  DateTime addedAt,  String? contactName)?  $default,) {final _that = this;
switch (_that) {
case _WhitelistEntry() when $default != null:
return $default(_that.id,_that.phoneNumberHash,_that.addedAt,_that.contactName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WhitelistEntry implements WhitelistEntry {
  const _WhitelistEntry({required this.id, required this.phoneNumberHash, required this.addedAt, this.contactName});
  factory _WhitelistEntry.fromJson(Map<String, dynamic> json) => _$WhitelistEntryFromJson(json);

/// Unique identifier for this whitelist entry
@override final  int id;
/// SHA-256 hash of the normalized phone number
///
/// Phone numbers are hashed for privacy. The hash is 64 characters long.
@override final  String phoneNumberHash;
/// Timestamp when this entry was added to the whitelist
@override final  DateTime addedAt;
/// Contact name from address book (optional)
///
/// May be null if the contact has no name.
@override final  String? contactName;

/// Create a copy of WhitelistEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WhitelistEntryCopyWith<_WhitelistEntry> get copyWith => __$WhitelistEntryCopyWithImpl<_WhitelistEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WhitelistEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WhitelistEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneNumberHash, phoneNumberHash) || other.phoneNumberHash == phoneNumberHash)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.contactName, contactName) || other.contactName == contactName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneNumberHash,addedAt,contactName);

@override
String toString() {
  return 'WhitelistEntry(id: $id, phoneNumberHash: $phoneNumberHash, addedAt: $addedAt, contactName: $contactName)';
}


}

/// @nodoc
abstract mixin class _$WhitelistEntryCopyWith<$Res> implements $WhitelistEntryCopyWith<$Res> {
  factory _$WhitelistEntryCopyWith(_WhitelistEntry value, $Res Function(_WhitelistEntry) _then) = __$WhitelistEntryCopyWithImpl;
@override @useResult
$Res call({
 int id, String phoneNumberHash, DateTime addedAt, String? contactName
});




}
/// @nodoc
class __$WhitelistEntryCopyWithImpl<$Res>
    implements _$WhitelistEntryCopyWith<$Res> {
  __$WhitelistEntryCopyWithImpl(this._self, this._then);

  final _WhitelistEntry _self;
  final $Res Function(_WhitelistEntry) _then;

/// Create a copy of WhitelistEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phoneNumberHash = null,Object? addedAt = null,Object? contactName = freezed,}) {
  return _then(_WhitelistEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phoneNumberHash: null == phoneNumberHash ? _self.phoneNumberHash : phoneNumberHash // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
