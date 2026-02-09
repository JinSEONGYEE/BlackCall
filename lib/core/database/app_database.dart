import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Main application database using Drift
///
/// This database is initialized with an empty schema (version 1).
/// Future stories will add tables via migrations.
@DriftDatabase(tables: [])
class AppDatabase extends _$AppDatabase {
  /// Creates the database instance
  AppDatabase() : super(_openConnection());

  /// Creates a database instance for testing with in-memory storage
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;
}

/// Opens a connection to the database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
