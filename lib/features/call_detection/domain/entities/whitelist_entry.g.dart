// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whitelist_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WhitelistEntryImpl _$$WhitelistEntryImplFromJson(Map<String, dynamic> json) =>
    _$WhitelistEntryImpl(
      id: (json['id'] as num).toInt(),
      phoneNumberHash: json['phoneNumberHash'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
      contactName: json['contactName'] as String?,
    );

Map<String, dynamic> _$$WhitelistEntryImplToJson(
        _$WhitelistEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumberHash': instance.phoneNumberHash,
      'addedAt': instance.addedAt.toIso8601String(),
      'contactName': instance.contactName,
    };
