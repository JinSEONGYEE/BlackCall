import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:voice_phishing_app/core/database/tables/call_log_table.dart';
import 'package:voice_phishing_app/core/database/tables/custom_keyword_table.dart';
import 'package:voice_phishing_app/core/database/tables/fraud_pattern_table.dart';
import 'package:voice_phishing_app/core/database/tables/whitelist_table.dart';
import 'package:voice_phishing_app/core/database/tables/fraud_pattern_definition_table.dart';

part 'app_database.g.dart';

/// Main application database using Drift
///
/// Schema version 4: Added FraudPatternTable for storing fraud analysis results
@DriftDatabase(tables: [WhitelistTable, CallLogTable, FraudPatternTable, CustomKeywordsTable, FraudPatternDefinitionTable])
class AppDatabase extends _$AppDatabase {
  /// Creates the database instance
  AppDatabase() : super(_openConnection());

  /// Creates a database instance for testing with in-memory storage
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration from v1 to v2: Add WhitelistTable
          await m.createTable(whitelistTable);
        }
        if (from < 3) {
          // Migration from v2 to v3: Add CallLogTable
          await m.createTable(callLogTable);
        }
        if (from < 4) {
          // Migration from v3 to v4: Add FraudPatternTable
          await m.createTable(fraudPatternTable);
        }
        if (from < 5) {
          // Migration from v4 to v5: Add CustomKeywordsTable
          await m.createTable(customKeywordsTable);
        }
        if (from < 6) {
          // Migration from v5 to v6: Add callLogId to FraudPatternTable
          await m.addColumn(fraudPatternTable, fraudPatternTable.callLogId);
        }
        if (from < 7) {
          // Migration from v6 to v7: Add FraudPatternDefinitionTable
          await m.createTable(fraudPatternDefinitionTable);
        }
      },
    );
  }
}

/// Opens a connection to the database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
