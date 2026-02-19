// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whitelist_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease use `MyClass()` instead.');

/// @nodoc
mixin _$WhitelistEntry {
  int get id => throw _privateConstructorUsedError;
  String get phoneNumberHash => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;
  String? get contactName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhitelistEntryCopyWith<WhitelistEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhitelistEntryCopyWith<$Res> {
  factory $WhitelistEntryCopyWith(
          WhitelistEntry value, $Res Function(WhitelistEntry) then) =
      _$WhitelistEntryCopyWithImpl<$Res, WhitelistEntry>;
  @useResult
  $Res call(
      {int id, String phoneNumberHash, String? contactName, DateTime addedAt});
}

/// @nodoc
class _$WhitelistEntryCopyWithImpl<$Res, $Val extends WhitelistEntry>
    implements $WhitelistEntryCopyWith<$Res> {
  _$WhitelistEntryCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumberHash = null,
    Object? contactName = freezed,
    Object? addedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id as int,
      phoneNumberHash: null == phoneNumberHash
          ? _value.phoneNumberHash
          : phoneNumberHash as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt as DateTime,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhitelistEntryImplCopyWith<$Res>
    implements $WhitelistEntryCopyWith<$Res> {
  factory _$$WhitelistEntryImplCopyWith(_$WhitelistEntryImpl value,
          $Res Function(_$WhitelistEntryImpl) then) =
      __$$WhitelistEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String phoneNumberHash, String? contactName, DateTime addedAt});
}

/// @nodoc
class __$$WhitelistEntryImplCopyWithImpl<$Res>
    extends _$WhitelistEntryCopyWithImpl<$Res, _$WhitelistEntryImpl>
    implements _$$WhitelistEntryImplCopyWith<$Res> {
  __$$WhitelistEntryImplCopyWithImpl(
      _$WhitelistEntryImpl _value, $Res Function(_$WhitelistEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumberHash = null,
    Object? contactName = freezed,
    Object? addedAt = null,
  }) {
    return _then(_$WhitelistEntryImpl(
      id: null == id ? _value.id : id as int,
      phoneNumberHash: null == phoneNumberHash
          ? _value.phoneNumberHash
          : phoneNumberHash as String,
      addedAt: null == addedAt ? _value.addedAt : addedAt as DateTime,
      contactName:
          freezed == contactName ? _value.contactName : contactName as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhitelistEntryImpl implements _WhitelistEntry {
  const _$WhitelistEntryImpl(
      {required this.id,
      required this.phoneNumberHash,
      required this.addedAt,
      this.contactName});

  factory _$WhitelistEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhitelistEntryImplFromJson(json);

  @override
  final int id;
  @override
  final String phoneNumberHash;
  @override
  final DateTime addedAt;
  @override
  final String? contactName;

  @override
  String toString() {
    return 'WhitelistEntry(id: $id, phoneNumberHash: $phoneNumberHash, addedAt: $addedAt, contactName: $contactName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhitelistEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumberHash, phoneNumberHash) ||
                other.phoneNumberHash == phoneNumberHash) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, phoneNumberHash, addedAt, contactName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhitelistEntryImplCopyWith<_$WhitelistEntryImpl> get copyWith =>
      __$$WhitelistEntryImplCopyWithImpl<_$WhitelistEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WhitelistEntryImplToJson(
      this,
    );
  }
}

abstract class _WhitelistEntry implements WhitelistEntry {
  const factory _WhitelistEntry(
      {required final int id,
      required final String phoneNumberHash,
      required final DateTime addedAt,
      final String? contactName}) = _$WhitelistEntryImpl;

  factory _WhitelistEntry.fromJson(Map<String, dynamic> json) =
      _$WhitelistEntryImpl.fromJson;

  @override
  int get id;
  @override
  String get phoneNumberHash;
  @override
  DateTime get addedAt;
  @override
  String? get contactName;
  @override
  @JsonKey(ignore: true)
  _$$WhitelistEntryImplCopyWith<_$WhitelistEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
