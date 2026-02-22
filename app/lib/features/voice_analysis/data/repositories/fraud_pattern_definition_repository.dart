import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';

part 'fraud_pattern_definition_repository.g.dart';

@riverpod
FraudPatternDefinitionRepository fraudPatternDefinitionRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return FraudPatternDefinitionRepository(db);
}

/// Repository to manage fraud pattern definitions
class FraudPatternDefinitionRepository {
  final AppDatabase _db;

  FraudPatternDefinitionRepository(this._db);

  /// Get all defined patterns
  Future<List<FraudPatternDefinitionTableData>> getAllPatterns() async {
    return await _db.select(_db.fraudPatternDefinitionTable).get();
  }

  /// Update or insert pattern definitions
  Future<void> updatePatterns(List<FraudPatternDefinitionTableCompanion> patterns) async {
    await _db.batch((batch) {
      for (final pattern in patterns) {
        batch.insert(
          _db.fraudPatternDefinitionTable,
          pattern,
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }
}
