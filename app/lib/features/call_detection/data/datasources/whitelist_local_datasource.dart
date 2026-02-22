import 'package:drift/drift.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';

/// Local data source for whitelist operations using Drift
///
/// Provides low-level database operations for the whitelist table.
class WhitelistLocalDataSource {
  final AppDatabase _database;

  WhitelistLocalDataSource(this._database);

  /// Checks if a phone number hash exists in the whitelist
  ///
  /// Returns true if the hash exists, false otherwise.
  Future<bool> isWhitelisted(String phoneNumberHash) async {
    final query = _database.select(_database.whitelistTable)
      ..where((tbl) => tbl.phoneNumberHash.equals(phoneNumberHash))
      ..limit(1);

    final result = await query.getSingleOrNull();
    return result != null;
  }

  /// Adds a phone number hash to the whitelist
  ///
  /// Returns the created WhitelistTableData.
  /// Throws if the hash already exists (unique constraint violation).
  Future<WhitelistTableData> addToWhitelist({
    required String phoneNumberHash,
    String? contactName,
  }) async {
    final companion = WhitelistTableCompanion.insert(
      phoneNumberHash: phoneNumberHash,
      addedAt: DateTime.now(),
      contactName: Value(contactName),
    );

    final id = await _database.into(_database.whitelistTable).insert(companion);

    // Return the created entry
    return WhitelistTableData(
      id: id,
      phoneNumberHash: phoneNumberHash,
      contactName: contactName,
      addedAt: DateTime.now(),
    );
  }

  /// Removes a phone number hash from the whitelist
  ///
  /// Returns the number of rows deleted (0 or 1).
  Future<int> removeFromWhitelist(String phoneNumberHash) async {
    final query = _database.delete(_database.whitelistTable)
      ..where((tbl) => tbl.phoneNumberHash.equals(phoneNumberHash));

    return await query.go();
  }

  /// Gets all whitelist entries
  ///
  /// Returns a list of all WhitelistTableData entries.
  Future<List<WhitelistTableData>> getAllWhitelistEntries() async {
    return await _database.select(_database.whitelistTable).get();
  }

  /// Clears all whitelist entries
  ///
  /// Returns the number of rows deleted.
  Future<int> clearWhitelist() async {
    return await _database.delete(_database.whitelistTable).go();
  }

  /// Batch inserts multiple whitelist entries
  ///
  /// Uses a transaction for atomicity. Ignores duplicates (on conflict do nothing).
  /// Returns the number of successfully inserted entries.
  Future<int> batchInsert(List<WhitelistTableCompanion> entries) async {
    return await _database.transaction(() async {
      int count = 0;
      for (final entry in entries) {
        try {
          await _database.into(_database.whitelistTable).insert(
                entry,
                mode: InsertMode.insertOrIgnore, // Ignore duplicates
              );
          count++;
        } catch (e) {
          // Continue on error (e.g., constraint violation)
          continue;
        }
      }
      return count;
    });
  }
}
