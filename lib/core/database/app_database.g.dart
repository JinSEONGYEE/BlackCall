// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
}

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  
  @override
  int get schemaVersion => 1;
  
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => const [];
}
