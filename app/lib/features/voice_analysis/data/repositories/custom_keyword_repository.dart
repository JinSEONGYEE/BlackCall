import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/custom_keyword.dart';
import 'package:drift/drift.dart';

class CustomKeywordRepository {
  final AppDatabase _db;

  CustomKeywordRepository(this._db);

  /// Get all custom keywords
  Future<List<CustomKeyword>> getAllKeywords() async {
    final entries = await _db.select(_db.customKeywordsTable).get();
    return entries.map((e) => CustomKeyword(
      id: e.id,
      keyword: e.keyword,
      addedAt: e.addedAt,
    )).toList();
  }

  /// Add a new custom keyword
  Future<int> addKeyword(String keyword) async {
    return await _db.into(_db.customKeywordsTable).insert(
      CustomKeywordsTableCompanion.insert(keyword: keyword),
    );
  }

  /// Delete a custom keyword by ID
  Future<int> deleteKeyword(int id) async {
    return await (_db.delete(_db.customKeywordsTable)
      ..where((t) => t.id.equals(id))).go();
  }

  /// Delete a custom keyword by text
  Future<int> deleteByKeyword(String keyword) async {
    return await (_db.delete(_db.customKeywordsTable)
      ..where((t) => t.keyword.equals(keyword))).go();
  }
}
