// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WhitelistTableTable extends WhitelistTable
    with TableInfo<$WhitelistTableTable, WhitelistTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WhitelistTableTable(this.attachedDatabase, [this._alias]);
  
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  
  static const VerificationMeta _phoneNumberHashMeta =
      const VerificationMeta('phoneNumberHash');
  @override
  late final GeneratedColumn<String> phoneNumberHash = GeneratedColumn<String>(
      'phone_number_hash', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 64, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  
  static const VerificationMeta _contactNameMeta =
      const VerificationMeta('contactName');
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
      'contact_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  
  @override
  List<GeneratedColumn> get $columns =>
      [id, phoneNumberHash, contactName, addedAt];
  
  @override
  String get aliasedName => _alias ?? actualTableName;
  
  @override
  String get actualTableName => $name;
  static const String $name = 'whitelist_table';
  
  @override
  VerificationContext validateIntegrity(Insertable<WhitelistTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('phone_number_hash')) {
      context.handle(
          _phoneNumberHashMeta,
          phoneNumberHash.isAcceptableOrUnknown(
              data['phone_number_hash']!, _phoneNumberHashMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberHashMeta);
    }
    if (data.containsKey('contact_name')) {
      context.handle(
          _contactNameMeta,
          contactName.isAcceptableOrUnknown(
              data['contact_name']!, _contactNameMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {phoneNumberHash},
      ];
  
  @override
  WhitelistTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WhitelistTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      phoneNumberHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number_hash'])!,
      contactName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_name']),
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $WhitelistTableTable createAlias(String alias) {
    return $WhitelistTableTable(attachedDatabase, alias);
  }
}

class WhitelistTableData extends DataClass
    implements Insertable<WhitelistTableData> {
  final int id;
  final String phoneNumberHash;
  final String? contactName;
  final DateTime addedAt;
  
  const WhitelistTableData({
    required this.id,
    required this.phoneNumberHash,
    this.contactName,
    required this.addedAt,
  });
  
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['phone_number_hash'] = Variable<String>(phoneNumberHash);
    if (!nullToAbsent || contactName != null) {
      map['contact_name'] = Variable<String>(contactName);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  WhitelistTableCompanion toCompanion(bool nullToAbsent) {
    return WhitelistTableCompanion(
      id: Value(id),
      phoneNumberHash: Value(phoneNumberHash),
      contactName: contactName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactName),
      addedAt: Value(addedAt),
    );
  }

  factory WhitelistTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WhitelistTableData(
      id: serializer.fromJson<int>(json['id']),
      phoneNumberHash: serializer.fromJson<String>(json['phoneNumberHash']),
      contactName: serializer.fromJson<String?>(json['contactName']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'phoneNumberHash': serializer.toJson<String>(phoneNumberHash),
      'contactName': serializer.toJson<String?>(contactName),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  WhitelistTableData copyWith(
          {int? id,
          String? phoneNumberHash,
          Value<String?> contactName = const Value.absent(),
          DateTime? addedAt}) =>
      WhitelistTableData(
        id: id ?? this.id,
        phoneNumberHash: phoneNumberHash ?? this.phoneNumberHash,
        contactName: contactName.present ? contactName.value : this.contactName,
        addedAt: addedAt ?? this.addedAt,
      );
  
  @override
  String toString() {
    return (StringBuffer('WhitelistTableData(')
          ..write('id: $id, ')
          ..write('phoneNumberHash: $phoneNumberHash, ')
          ..write('contactName: $contactName, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, phoneNumberHash, contactName, addedAt);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WhitelistTableData &&
          other.id == this.id &&
          other.phoneNumberHash == this.phoneNumberHash &&
          other.contactName == this.contactName &&
          other.addedAt == this.addedAt);
}

class WhitelistTableCompanion extends UpdateCompanion<WhitelistTableData> {
  final Value<int> id;
  final Value<String> phoneNumberHash;
  final Value<String?> contactName;
  final Value<DateTime> addedAt;
  
  const WhitelistTableCompanion({
    this.id = const Value.absent(),
    this.phoneNumberHash = const Value.absent(),
    this.contactName = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  
  WhitelistTableCompanion.insert({
    this.id = const Value.absent(),
    required String phoneNumberHash,
    this.contactName = const Value.absent(),
    required DateTime addedAt,
  })  : phoneNumberHash = Value(phoneNumberHash),
        addedAt = Value(addedAt);
  
  static Insertable<WhitelistTableData> custom({
    Expression<int>? id,
    Expression<String>? phoneNumberHash,
    Expression<String>? contactName,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phoneNumberHash != null) 'phone_number_hash': phoneNumberHash,
      if (contactName != null) 'contact_name': contactName,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  WhitelistTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? phoneNumberHash,
      Value<String?>? contactName,
      Value<DateTime>? addedAt}) {
    return WhitelistTableCompanion(
      id: id ?? this.id,
      phoneNumberHash: phoneNumberHash ?? this.phoneNumberHash,
      contactName: contactName ?? this.contactName,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (phoneNumberHash.present) {
      map['phone_number_hash'] = Variable<String>(phoneNumberHash.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WhitelistTableCompanion(')
          ..write('id: $id, ')
          ..write('phoneNumberHash: $phoneNumberHash, ')
          ..write('contactName: $contactName, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

// CallLogTable generated code
class $CallLogTableTable extends CallLogTable
    with TableInfo<$CallLogTableTable, CallLogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CallLogTableTable(this.attachedDatabase, [this._alias]);
  
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  
  static const VerificationMeta _formattedNumberMeta =
      const VerificationMeta('formattedNumber');
  @override
  late final GeneratedColumn<String> formattedNumber = GeneratedColumn<String>(
      'formatted_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  
  static const VerificationMeta _isPrivateMeta =
      const VerificationMeta('isPrivate');
  @override
  late final GeneratedColumn<bool> isPrivate = GeneratedColumn<bool>(
      'is_private', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_private" IN (0, 1))'));
  
  static const VerificationMeta _isKoreanMeta =
      const VerificationMeta('isKorean');
  @override
  late final GeneratedColumn<bool> isKorean = GeneratedColumn<bool>(
      'is_korean', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_korean" IN (0, 1)) DEFAULT 0'),
      defaultValue: const Constant(false));
  
  static const VerificationMeta _isInternationalMeta =
      const VerificationMeta('isInternational');
  @override
  late final GeneratedColumn<bool> isInternational = GeneratedColumn<bool>(
      'is_international', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_international" IN (0, 1)) DEFAULT 0'),
      defaultValue: const Constant(false));
  
  static const VerificationMeta _isSpoofingRiskMeta =
      const VerificationMeta('isSpoofingRisk');
  @override
  late final GeneratedColumn<bool> isSpoofingRisk = GeneratedColumn<bool>(
      'is_spoofing_risk', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_spoofing_risk" IN (0, 1)) DEFAULT 0'),
      defaultValue: const Constant(false));
  
  static const VerificationMeta _isWhitelistedMeta =
      const VerificationMeta('isWhitelisted');
  @override
  late final GeneratedColumn<bool> isWhitelisted = GeneratedColumn<bool>(
      'is_whitelisted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_whitelisted" IN (0, 1)) DEFAULT 0'),
      defaultValue: const Constant(false));
  
  static const VerificationMeta _callStateMeta =
      const VerificationMeta('callState');
  @override
  late final GeneratedColumn<String> callState = GeneratedColumn<String>(
      'call_state', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  
  static const VerificationMeta _receivedAtMeta =
      const VerificationMeta('receivedAt');
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
      'received_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true);
  
  static const VerificationMeta _answeredAtMeta =
      const VerificationMeta('answeredAt');
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
      'answered_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false);
  
  static const VerificationMeta _endedAtMeta =
      const VerificationMeta('endedAt');
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
      'ended_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false);
  
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false);
  
  @override
  List<GeneratedColumn> get $columns => [
        id,
        phoneNumber,
        formattedNumber,
        isPrivate,
        isKorean,
        isInternational,
        isSpoofingRisk,
        isWhitelisted,
        callState,
        receivedAt,
        answeredAt,
        endedAt,
        durationSeconds,
      ];
  
  @override
  String get aliasedName => _alias ?? actualTableName;
  
  @override
  String get actualTableName => $name;
  static const String $name = 'call_log_table';
  
  @override
  VerificationContext validateIntegrity(Insertable<CallLogTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('formatted_number')) {
      context.handle(
          _formattedNumberMeta,
          formattedNumber.isAcceptableOrUnknown(
              data['formatted_number']!, _formattedNumberMeta));
    } else if (isInserting) {
      context.missing(_formattedNumberMeta);
    }
    if (data.containsKey('is_private')) {
      context.handle(_isPrivateMeta,
          isPrivate.isAcceptableOrUnknown(data['is_private']!, _isPrivateMeta));
    } else if (isInserting) {
      context.missing(_isPrivateMeta);
    }
    if (data.containsKey('is_korean')) {
      context.handle(_isKoreanMeta,
          isKorean.isAcceptableOrUnknown(data['is_korean']!, _isKoreanMeta));
    }
    if (data.containsKey('is_international')) {
      context.handle(
          _isInternationalMeta,
          isInternational.isAcceptableOrUnknown(
              data['is_international']!, _isInternationalMeta));
    }
    if (data.containsKey('is_spoofing_risk')) {
      context.handle(
          _isSpoofingRiskMeta,
          isSpoofingRisk.isAcceptableOrUnknown(
              data['is_spoofing_risk']!, _isSpoofingRiskMeta));
    }
    if (data.containsKey('is_whitelisted')) {
      context.handle(
          _isWhitelistedMeta,
          isWhitelisted.isAcceptableOrUnknown(
              data['is_whitelisted']!, _isWhitelistedMeta));
    }
    if (data.containsKey('call_state')) {
      context.handle(_callStateMeta,
          callState.isAcceptableOrUnknown(data['call_state']!, _callStateMeta));
    } else if (isInserting) {
      context.missing(_callStateMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
          _receivedAtMeta,
          receivedAt.isAcceptableOrUnknown(
              data['received_at']!, _receivedAtMeta));
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('answered_at')) {
      context.handle(
          _answeredAtMeta,
          answeredAt.isAcceptableOrUnknown(
              data['answered_at']!, _answeredAtMeta));
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta,
          endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  
  @override
  CallLogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CallLogTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      formattedNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}formatted_number'])!,
      isPrivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_private'])!,
      isKorean: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_korean'])!,
      isInternational: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_international'])!,
      isSpoofingRisk: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_spoofing_risk'])!,
      isWhitelisted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_whitelisted'])!,
      callState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}call_state'])!,
      receivedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}received_at'])!,
      answeredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}answered_at']),
      endedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ended_at']),
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds']),
    );
  }

  @override
  $CallLogTableTable createAlias(String alias) {
    return $CallLogTableTable(attachedDatabase, alias);
  }
}

class CallLogTableData extends DataClass
    implements Insertable<CallLogTableData> {
  final int id;
  final String phoneNumber;
  final String formattedNumber;
  final bool isPrivate;
  final bool isKorean;
  final bool isInternational;
  final bool isSpoofingRisk;
  final bool isWhitelisted;
  final String callState;
  final DateTime receivedAt;
  final DateTime? answeredAt;
  final DateTime? endedAt;
  final int? durationSeconds;
  
  const CallLogTableData({
    required this.id,
    required this.phoneNumber,
    required this.formattedNumber,
    required this.isPrivate,
    required this.isKorean,
    required this.isInternational,
    required this.isSpoofingRisk,
    required this.isWhitelisted,
    required this.callState,
    required this.receivedAt,
    this.answeredAt,
    this.endedAt,
    this.durationSeconds,
  });
  
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['formatted_number'] = Variable<String>(formattedNumber);
    map['is_private'] = Variable<bool>(isPrivate);
    map['is_korean'] = Variable<bool>(isKorean);
    map['is_international'] = Variable<bool>(isInternational);
    map['is_spoofing_risk'] = Variable<bool>(isSpoofingRisk);
    map['is_whitelisted'] = Variable<bool>(isWhitelisted);
    map['call_state'] = Variable<String>(callState);
    map['received_at'] = Variable<DateTime>(receivedAt);
    if (!nullToAbsent || answeredAt != null) {
      map['answered_at'] = Variable<DateTime>(answeredAt);
    }
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    return map;
  }

  CallLogTableCompanion toCompanion(bool nullToAbsent) {
    return CallLogTableCompanion(
      id: Value(id),
      phoneNumber: Value(phoneNumber),
      formattedNumber: Value(formattedNumber),
      isPrivate: Value(isPrivate),
      isKorean: Value(isKorean),
      isInternational: Value(isInternational),
      isSpoofingRisk: Value(isSpoofingRisk),
      isWhitelisted: Value(isWhitelisted),
      callState: Value(callState),
      receivedAt: Value(receivedAt),
      answeredAt: answeredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(answeredAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
    );
  }

  factory CallLogTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CallLogTableData(
      id: serializer.fromJson<int>(json['id']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      formattedNumber: serializer.fromJson<String>(json['formattedNumber']),
      isPrivate: serializer.fromJson<bool>(json['isPrivate']),
      isKorean: serializer.fromJson<bool>(json['isKorean']),
      isInternational: serializer.fromJson<bool>(json['isInternational']),
      isSpoofingRisk: serializer.fromJson<bool>(json['isSpoofingRisk']),
      isWhitelisted: serializer.fromJson<bool>(json['isWhitelisted']),
      callState: serializer.fromJson<String>(json['callState']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      answeredAt: serializer.fromJson<DateTime?>(json['answeredAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
    );
  }
  
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'formattedNumber': serializer.toJson<String>(formattedNumber),
      'isPrivate': serializer.toJson<bool>(isPrivate),
      'isKorean': serializer.toJson<bool>(isKorean),
      'isInternational': serializer.toJson<bool>(isInternational),
      'isSpoofingRisk': serializer.toJson<bool>(isSpoofingRisk),
      'isWhitelisted': serializer.toJson<bool>(isWhitelisted),
      'callState': serializer.toJson<String>(callState),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'answeredAt': serializer.toJson<DateTime?>(answeredAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
    };
  }

  CallLogTableData copyWith({
    int? id,
    String? phoneNumber,
    String? formattedNumber,
    bool? isPrivate,
    bool? isKorean,
    bool? isInternational,
    bool? isSpoofingRisk,
    bool? isWhitelisted,
    String? callState,
    DateTime? receivedAt,
    Value<DateTime?> answeredAt = const Value.absent(),
    Value<DateTime?> endedAt = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
  }) =>
      CallLogTableData(
        id: id ?? this.id,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        formattedNumber: formattedNumber ?? this.formattedNumber,
        isPrivate: isPrivate ?? this.isPrivate,
        isKorean: isKorean ?? this.isKorean,
        isInternational: isInternational ?? this.isInternational,
        isSpoofingRisk: isSpoofingRisk ?? this.isSpoofingRisk,
        isWhitelisted: isWhitelisted ?? this.isWhitelisted,
        callState: callState ?? this.callState,
        receivedAt: receivedAt ?? this.receivedAt,
        answeredAt: answeredAt.present ? answeredAt.value : this.answeredAt,
        endedAt: endedAt.present ? endedAt.value : this.endedAt,
        durationSeconds: durationSeconds.present ? durationSeconds.value : this.durationSeconds,
      );
  
  @override
  String toString() {
    return (StringBuffer('CallLogTableData(')
          ..write('id: $id, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('formattedNumber: $formattedNumber, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('isKorean: $isKorean, ')
          ..write('isInternational: $isInternational, ')
          ..write('isSpoofingRisk: $isSpoofingRisk, ')
          ..write('isWhitelisted: $isWhitelisted, ')
          ..write('callState: $callState, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('answeredAt: $answeredAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
        id,
        phoneNumber,
        formattedNumber,
        isPrivate,
        isKorean,
        isInternational,
        isSpoofingRisk,
        isWhitelisted,
        callState,
        receivedAt,
        answeredAt,
        endedAt,
        durationSeconds,
      );
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CallLogTableData &&
          other.id == this.id &&
          other.phoneNumber == this.phoneNumber &&
          other.formattedNumber == this.formattedNumber &&
          other.isPrivate == this.isPrivate &&
          other.isKorean == this.isKorean &&
          other.isInternational == this.isInternational &&
          other.isSpoofingRisk == this.isSpoofingRisk &&
          other.isWhitelisted == this.isWhitelisted &&
          other.callState == this.callState &&
          other.receivedAt == this.receivedAt &&
          other.answeredAt == this.answeredAt &&
          other.endedAt == this.endedAt &&
          other.durationSeconds == this.durationSeconds);
}

class CallLogTableCompanion extends UpdateCompanion<CallLogTableData> {
  final Value<int> id;
  final Value<String> phoneNumber;
  final Value<String> formattedNumber;
  final Value<bool> isPrivate;
  final Value<bool> isKorean;
  final Value<bool> isInternational;
  final Value<bool> isSpoofingRisk;
  final Value<bool> isWhitelisted;
  final Value<String> callState;
  final Value<DateTime> receivedAt;
  final Value<DateTime?> answeredAt;
  final Value<DateTime?> endedAt;
  final Value<int?> durationSeconds;
  
  const CallLogTableCompanion({
    this.id = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.formattedNumber = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.isKorean = const Value.absent(),
    this.isInternational = const Value.absent(),
    this.isSpoofingRisk = const Value.absent(),
    this.isWhitelisted = const Value.absent(),
    this.callState = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.answeredAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
  });
  
  CallLogTableCompanion.insert({
    this.id = const Value.absent(),
    required String phoneNumber,
    required String formattedNumber,
    required bool isPrivate,
    this.isKorean = const Value.absent(),
    this.isInternational = const Value.absent(),
    this.isSpoofingRisk = const Value.absent(),
    this.isWhitelisted = const Value.absent(),
    required String callState,
    required DateTime receivedAt,
    this.answeredAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
  })  : phoneNumber = Value(phoneNumber),
        formattedNumber = Value(formattedNumber),
        isPrivate = Value(isPrivate),
        callState = Value(callState),
        receivedAt = Value(receivedAt);
  
  static Insertable<CallLogTableData> custom({
    Expression<int>? id,
    Expression<String>? phoneNumber,
    Expression<String>? formattedNumber,
    Expression<bool>? isPrivate,
    Expression<bool>? isKorean,
    Expression<bool>? isInternational,
    Expression<bool>? isSpoofingRisk,
    Expression<bool>? isWhitelisted,
    Expression<String>? callState,
    Expression<DateTime>? receivedAt,
    Expression<DateTime>? answeredAt,
    Expression<DateTime>? endedAt,
    Expression<int>? durationSeconds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (formattedNumber != null) 'formatted_number': formattedNumber,
      if (isPrivate != null) 'is_private': isPrivate,
      if (isKorean != null) 'is_korean': isKorean,
      if (isInternational != null) 'is_international': isInternational,
      if (isSpoofingRisk != null) 'is_spoofing_risk': isSpoofingRisk,
      if (isWhitelisted != null) 'is_whitelisted': isWhitelisted,
      if (callState != null) 'call_state': callState,
      if (receivedAt != null) 'received_at': receivedAt,
      if (answeredAt != null) 'answered_at': answeredAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
    });
  }

  CallLogTableCompanion copyWith({
    Value<int>? id,
    Value<String>? phoneNumber,
    Value<String>? formattedNumber,
    Value<bool>? isPrivate,
    Value<bool>? isKorean,
    Value<bool>? isInternational,
    Value<bool>? isSpoofingRisk,
    Value<bool>? isWhitelisted,
    Value<String>? callState,
    Value<DateTime>? receivedAt,
    Value<DateTime?>? answeredAt,
    Value<DateTime?>? endedAt,
    Value<int?>? durationSeconds,
  }) {
    return CallLogTableCompanion(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      formattedNumber: formattedNumber ?? this.formattedNumber,
      isPrivate: isPrivate ?? this.isPrivate,
      isKorean: isKorean ?? this.isKorean,
      isInternational: isInternational ?? this.isInternational,
      isSpoofingRisk: isSpoofingRisk ?? this.isSpoofingRisk,
      isWhitelisted: isWhitelisted ?? this.isWhitelisted,
      callState: callState ?? this.callState,
      receivedAt: receivedAt ?? this.receivedAt,
      answeredAt: answeredAt ?? this.answeredAt,
      endedAt: endedAt ?? this.endedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (formattedNumber.present) {
      map['formatted_number'] = Variable<String>(formattedNumber.value);
    }
    if (isPrivate.present) {
      map['is_private'] = Variable<bool>(isPrivate.value);
    }
    if (isKorean.present) {
      map['is_korean'] = Variable<bool>(isKorean.value);
    }
    if (isInternational.present) {
      map['is_international'] = Variable<bool>(isInternational.value);
    }
    if (isSpoofingRisk.present) {
      map['is_spoofing_risk'] = Variable<bool>(isSpoofingRisk.value);
    }
    if (isWhitelisted.present) {
      map['is_whitelisted'] = Variable<bool>(isWhitelisted.value);
    }
    if (callState.present) {
      map['call_state'] = Variable<String>(callState.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CallLogTableCompanion(')
          ..write('id: $id, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('formattedNumber: $formattedNumber, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('isKorean: $isKorean, ')
          ..write('isInternational: $isInternational, ')
          ..write('isSpoofingRisk: $isSpoofingRisk, ')
          ..write('isWhitelisted: $isWhitelisted, ')
          ..write('callState: $callState, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('answeredAt: $answeredAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }
}

class FraudPatternTableData extends DataClass implements Insertable<FraudPatternTableData> {
  final int id;
  final String patternType;
  final String detectedKeywords;
  final double confidence;
  final DateTime timestamp;
  final int? callLogId;
  const FraudPatternTableData({required this.id, required this.patternType, required this.detectedKeywords, required this.confidence, required this.timestamp, this.callLogId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pattern_type'] = Variable<String>(patternType);
    map['detected_keywords'] = Variable<String>(detectedKeywords);
    map['confidence'] = Variable<double>(confidence);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || callLogId != null) {
      map['call_log_id'] = Variable<int>(callLogId);
    }
    return map;
  }
  FraudPatternTableCompanion toCompanion(bool nullToAbsent) {
    return FraudPatternTableCompanion(
      id: Value(id),
      patternType: Value(patternType),
      detectedKeywords: Value(detectedKeywords),
      confidence: Value(confidence),
      timestamp: Value(timestamp),
      callLogId: callLogId == null && nullToAbsent ? const Value.absent() : Value(callLogId),
    );
  }
  factory FraudPatternTableData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FraudPatternTableData(
      id: serializer.fromJson<int>(json['id']),
      patternType: serializer.fromJson<String>(json['patternType']),
      detectedKeywords: serializer.fromJson<String>(json['detectedKeywords']),
      confidence: serializer.fromJson<double>(json['confidence']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      callLogId: serializer.fromJson<int?>(json['callLogId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patternType': serializer.toJson<String>(patternType),
      'detectedKeywords': serializer.toJson<String>(detectedKeywords),
      'confidence': serializer.toJson<double>(confidence),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'callLogId': serializer.toJson<int?>(callLogId),
    };
  }
  FraudPatternTableData copyWith({int? id, String? patternType, String? detectedKeywords, double? confidence, DateTime? timestamp, Value<int?> callLogId = const Value.absent()}) => FraudPatternTableData(
    id: id ?? this.id,
    patternType: patternType ?? this.patternType,
    detectedKeywords: detectedKeywords ?? this.detectedKeywords,
    confidence: confidence ?? this.confidence,
    timestamp: timestamp ?? this.timestamp,
    callLogId: callLogId.present ? callLogId.value : this.callLogId,
  );
  @override
  String toString() {
    return (StringBuffer('FraudPatternTableData(')
          ..write('id: $id, ')
          ..write('patternType: $patternType, ')
          ..write('detectedKeywords: $detectedKeywords, ')
          ..write('confidence: $confidence, ')
          ..write('timestamp: $timestamp, ')
          ..write('callLogId: $callLogId')
          ..write(')'))
        .toString();
  }
  @override
  int get hashCode => Object.hash(id, patternType, detectedKeywords, confidence, timestamp, callLogId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FraudPatternTableData &&
          other.id == this.id &&
          other.patternType == this.patternType &&
          other.detectedKeywords == this.detectedKeywords &&
          other.confidence == this.confidence &&
          other.timestamp == this.timestamp &&
          other.callLogId == this.callLogId);
}

class FraudPatternTableCompanion extends UpdateCompanion<FraudPatternTableData> {
  final Value<int> id;
  final Value<String> patternType;
  final Value<String> detectedKeywords;
  final Value<double> confidence;
  final Value<DateTime> timestamp;
  final Value<int?> callLogId;
  const FraudPatternTableCompanion({
    this.id = const Value.absent(),
    this.patternType = const Value.absent(),
    this.detectedKeywords = const Value.absent(),
    this.confidence = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.callLogId = const Value.absent(),
  });
  FraudPatternTableCompanion.insert({
    this.id = const Value.absent(),
    required String patternType,
    required String detectedKeywords,
    required double confidence,
    required DateTime timestamp,
    this.callLogId = const Value.absent(),
  }) : patternType = Value(patternType),
       detectedKeywords = Value(detectedKeywords),
       confidence = Value(confidence),
       timestamp = Value(timestamp);
  static Insertable<FraudPatternTableData> custom({
    Expression<int>? id,
    Expression<String>? patternType,
    Expression<String>? detectedKeywords,
    Expression<double>? confidence,
    Expression<DateTime>? timestamp,
    Expression<int>? callLogId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patternType != null) 'pattern_type': patternType,
      if (detectedKeywords != null) 'detected_keywords': detectedKeywords,
      if (confidence != null) 'confidence': confidence,
      if (timestamp != null) 'timestamp': timestamp,
      if (callLogId != null) 'call_log_id': callLogId,
    });
  }

  FraudPatternTableCompanion copyWith({Value<int>? id, Value<String>? patternType, Value<String>? detectedKeywords, Value<double>? confidence, Value<DateTime>? timestamp, Value<int?>? callLogId}) {
    return FraudPatternTableCompanion(
      id: id ?? this.id,
      patternType: patternType ?? this.patternType,
      detectedKeywords: detectedKeywords ?? this.detectedKeywords,
      confidence: confidence ?? this.confidence,
      timestamp: timestamp ?? this.timestamp,
      callLogId: callLogId ?? this.callLogId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patternType.present) {
      map['pattern_type'] = Variable<String>(patternType.value);
    }
    if (detectedKeywords.present) {
      map['detected_keywords'] = Variable<String>(detectedKeywords.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (callLogId.present) {
      map['call_log_id'] = Variable<int>(callLogId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FraudPatternTableCompanion(')
          ..write('id: $id, ')
          ..write('patternType: $patternType, ')
          ..write('detectedKeywords: $detectedKeywords, ')
          ..write('confidence: $confidence, ')
          ..write('timestamp: $timestamp, ')
          ..write('callLogId: $callLogId')
          ..write(')'))
        .toString();
  }
}

class $FraudPatternTableTable extends FraudPatternTable with TableInfo<$FraudPatternTableTable, FraudPatternTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FraudPatternTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patternTypeMeta = const VerificationMeta('patternType');
  @override
  late final GeneratedColumn<String> patternType = GeneratedColumn<String>('pattern_type', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detectedKeywordsMeta = const VerificationMeta('detectedKeywords');
  @override
  late final GeneratedColumn<String> detectedKeywords = GeneratedColumn<String>('detected_keywords', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _confidenceMeta = const VerificationMeta('confidence');
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>('confidence', aliasedName, false, type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>('timestamp', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _callLogIdMeta = const VerificationMeta('callLogId');
  @override
  late final GeneratedColumn<int> callLogId = GeneratedColumn<int>('call_log_id', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, patternType, detectedKeywords, confidence, timestamp, callLogId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fraud_pattern_table';
  @override
  VerificationContext validateIntegrity(Insertable<FraudPatternTableData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pattern_type')) {
      context.handle(_patternTypeMeta, patternType.isAcceptableOrUnknown(data['pattern_type']!, _patternTypeMeta));
    } else if (isInserting) {
      context.missing(_patternTypeMeta);
    }
    if (data.containsKey('detected_keywords')) {
      context.handle(_detectedKeywordsMeta, detectedKeywords.isAcceptableOrUnknown(data['detected_keywords']!, _detectedKeywordsMeta));
    } else if (isInserting) {
      context.missing(_detectedKeywordsMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(_confidenceMeta, confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta));
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta, timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('call_log_id')) {
      context.handle(_callLogIdMeta, callLogId.isAcceptableOrUnknown(data['call_log_id']!, _callLogIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FraudPatternTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FraudPatternTableData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patternType: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}pattern_type'])!,
      detectedKeywords: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}detected_keywords'])!,
      confidence: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}confidence'])!,
      timestamp: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      callLogId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}call_log_id']),
    );
  }

  @override
  $FraudPatternTableTable createAlias(String alias) {
    return $FraudPatternTableTable(attachedDatabase, alias);
  }
}

class CustomKeywordsTableData extends DataClass implements Insertable<CustomKeywordsTableData> {
  final int id;
  final String keyword;
  final DateTime addedAt;
  const CustomKeywordsTableData({required this.id, required this.keyword, required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['keyword'] = Variable<String>(keyword);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }
  CustomKeywordsTableCompanion toCompanion(bool nullToAbsent) {
    return CustomKeywordsTableCompanion(
      id: Value(id),
      keyword: Value(keyword),
      addedAt: Value(addedAt),
    );
  }
  factory CustomKeywordsTableData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomKeywordsTableData(
      id: serializer.fromJson<int>(json['id']),
      keyword: serializer.fromJson<String>(json['keyword']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'keyword': serializer.toJson<String>(keyword),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }
  CustomKeywordsTableData copyWith({int? id, String? keyword, DateTime? addedAt}) => CustomKeywordsTableData(
    id: id ?? this.id,
    keyword: keyword ?? this.keyword,
    addedAt: addedAt ?? this.addedAt,
  );
  @override
  String toString() {
    return (StringBuffer('CustomKeywordsTableData(')
          ..write('id: $id, ')
          ..write('keyword: $keyword, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
  @override
  int get hashCode => Object.hash(id, keyword, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomKeywordsTableData &&
          other.id == this.id &&
          other.keyword == this.keyword &&
          other.addedAt == this.addedAt);
}

class CustomKeywordsTableCompanion extends UpdateCompanion<CustomKeywordsTableData> {
  final Value<int> id;
  final Value<String> keyword;
  final Value<DateTime> addedAt;
  const CustomKeywordsTableCompanion({
    this.id = const Value.absent(),
    this.keyword = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  CustomKeywordsTableCompanion.insert({
    this.id = const Value.absent(),
    required String keyword,
    this.addedAt = const Value.absent(),
  }) : keyword = Value(keyword);
  static Insertable<CustomKeywordsTableData> custom({
    Expression<int>? id,
    Expression<String>? keyword,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (keyword != null) 'keyword': keyword,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  CustomKeywordsTableCompanion copyWith({Value<int>? id, Value<String>? keyword, Value<DateTime>? addedAt}) {
    return CustomKeywordsTableCompanion(
      id: id ?? this.id,
      keyword: keyword ?? this.keyword,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomKeywordsTableCompanion(')
          ..write('id: $id, ')
          ..write('keyword: $keyword, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $CustomKeywordsTableTable extends CustomKeywordsTable with TableInfo<$CustomKeywordsTableTable, CustomKeywordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomKeywordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keywordMeta = const VerificationMeta('keyword');
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>('keyword', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true, defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _addedAtMeta = const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>('added_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, keyword, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_keywords_table';
  @override
  VerificationContext validateIntegrity(Insertable<CustomKeywordsTableData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('keyword')) {
      context.handle(_keywordMeta, keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta));
    } else if (isInserting) {
      context.missing(_keywordMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta, addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomKeywordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomKeywordsTableData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      keyword: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}keyword'])!,
      addedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $CustomKeywordsTableTable createAlias(String alias) {
    return $CustomKeywordsTableTable(attachedDatabase, alias);
  }
}

class FraudPatternDefinitionTableData extends DataClass implements Insertable<FraudPatternDefinitionTableData> {
  final int id;
  final String patternType;
  final String keywords;
  final DateTime updatedAt;
  const FraudPatternDefinitionTableData({required this.id, required this.patternType, required this.keywords, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pattern_type'] = Variable<String>(patternType);
    map['keywords'] = Variable<String>(keywords);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }
  FraudPatternDefinitionTableCompanion toCompanion(bool nullToAbsent) {
    return FraudPatternDefinitionTableCompanion(
      id: Value(id),
      patternType: Value(patternType),
      keywords: Value(keywords),
      updatedAt: Value(updatedAt),
    );
  }
  factory FraudPatternDefinitionTableData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FraudPatternDefinitionTableData(
      id: serializer.fromJson<int>(json['id']),
      patternType: serializer.fromJson<String>(json['patternType']),
      keywords: serializer.fromJson<String>(json['keywords']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patternType': serializer.toJson<String>(patternType),
      'keywords': serializer.toJson<String>(keywords),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }
  FraudPatternDefinitionTableData copyWith({int? id, String? patternType, String? keywords, DateTime? updatedAt}) => FraudPatternDefinitionTableData(
    id: id ?? this.id,
    patternType: patternType ?? this.patternType,
    keywords: keywords ?? this.keywords,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  @override
  String toString() {
    return (StringBuffer('FraudPatternDefinitionTableData(')
          ..write('id: $id, ')
          ..write('patternType: $patternType, ')
          ..write('keywords: $keywords, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
  @override
  int get hashCode => Object.hash(id, patternType, keywords, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FraudPatternDefinitionTableData &&
          other.id == this.id &&
          other.patternType == this.patternType &&
          other.keywords == this.keywords &&
          other.updatedAt == this.updatedAt);
}

class FraudPatternDefinitionTableCompanion extends UpdateCompanion<FraudPatternDefinitionTableData> {
  final Value<int> id;
  final Value<String> patternType;
  final Value<String> keywords;
  final Value<DateTime> updatedAt;
  const FraudPatternDefinitionTableCompanion({
    this.id = const Value.absent(),
    this.patternType = const Value.absent(),
    this.keywords = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FraudPatternDefinitionTableCompanion.insert({
    this.id = const Value.absent(),
    required String patternType,
    required String keywords,
    this.updatedAt = const Value.absent(),
  }) : patternType = Value(patternType),
       keywords = Value(keywords);
  static Insertable<FraudPatternDefinitionTableData> custom({
    Expression<int>? id,
    Expression<String>? patternType,
    Expression<String>? keywords,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patternType != null) 'pattern_type': patternType,
      if (keywords != null) 'keywords': keywords,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FraudPatternDefinitionTableCompanion copyWith({Value<int>? id, Value<String>? patternType, Value<String>? keywords, Value<DateTime>? updatedAt}) {
    return FraudPatternDefinitionTableCompanion(
      id: id ?? this.id,
      patternType: patternType ?? this.patternType,
      keywords: keywords ?? this.keywords,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patternType.present) {
      map['pattern_type'] = Variable<String>(patternType.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(keywords.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FraudPatternDefinitionTableCompanion(')
          ..write('id: $id, ')
          ..write('patternType: $patternType, ')
          ..write('keywords: $keywords, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FraudPatternDefinitionTableTable extends FraudPatternDefinitionTable
    with TableInfo<$FraudPatternDefinitionTableTable, FraudPatternDefinitionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FraudPatternDefinitionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patternTypeMeta = const VerificationMeta('patternType');
  @override
  late final GeneratedColumn<String> patternType = GeneratedColumn<String>('pattern_type', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true, defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _keywordsMeta = const VerificationMeta('keywords');
  @override
  late final GeneratedColumn<String> keywords = GeneratedColumn<String>('keywords', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>('updated_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, patternType, keywords, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fraud_pattern_definition_table';
  @override
  VerificationContext validateIntegrity(Insertable<FraudPatternDefinitionTableData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pattern_type')) {
      context.handle(_patternTypeMeta, patternType.isAcceptableOrUnknown(data['pattern_type']!, _patternTypeMeta));
    } else if (isInserting) {
      context.missing(_patternTypeMeta);
    }
    if (data.containsKey('keywords')) {
      context.handle(_keywordsMeta, keywords.isAcceptableOrUnknown(data['keywords']!, _keywordsMeta));
    } else if (isInserting) {
      context.missing(_keywordsMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FraudPatternDefinitionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FraudPatternDefinitionTableData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patternType: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}pattern_type'])!,
      keywords: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}keywords'])!,
      updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FraudPatternDefinitionTableTable createAlias(String alias) {
    return $FraudPatternDefinitionTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $WhitelistTableTable whitelistTable = $WhitelistTableTable(this);
  late final $CallLogTableTable callLogTable = $CallLogTableTable(this);
  late final $FraudPatternTableTable fraudPatternTable = $FraudPatternTableTable(this);
  late final $CustomKeywordsTableTable customKeywordsTable = $CustomKeywordsTableTable(this);
  late final $FraudPatternDefinitionTableTable fraudPatternDefinitionTable = $FraudPatternDefinitionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [whitelistTable, callLogTable, fraudPatternTable, customKeywordsTable, fraudPatternDefinitionTable];
}
