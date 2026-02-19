import 'package:drift/drift.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';

/// Local data source for call log operations using Drift
///
/// Provides low-level database operations for the call log table.
class CallLogLocalDataSource {
  final AppDatabase _database;

  CallLogLocalDataSource(this._database);

  /// Inserts a new call log entry
  ///
  /// Returns the created CallLogTableData with the generated ID.
  Future<CallLogTableData> insertCallLog(CallLogTableCompanion companion) async {
    final id = await _database.into(_database.callLogTable).insert(companion);
    
    // Query the inserted entry to return complete data
    final query = _database.select(_database.callLogTable)
      ..where((tbl) => tbl.id.equals(id));
    
    return await query.getSingle();
  }

  /// Updates an existing call log entry
  ///
  /// Returns the updated CallLogTableData.
  Future<CallLogTableData> updateCallLog(int id, CallLogTableCompanion companion) async {
    final query = _database.update(_database.callLogTable)
      ..where((tbl) => tbl.id.equals(id));
    
    await query.write(companion);
    
    // Query the updated entry to return complete data
    final selectQuery = _database.select(_database.callLogTable)
      ..where((tbl) => tbl.id.equals(id));
    
    return await selectQuery.getSingle();
  }

  /// Gets all call logs ordered by receivedAt DESC (most recent first)
  ///
  /// Returns a list of all CallLogTableData entries.
  Future<List<CallLogTableData>> getAllCallLogs() async {
    final query = _database.select(_database.callLogTable)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.receivedAt)]);
    
    return await query.get();
  }

  /// Gets call logs filtered by spoofing risk
  ///
  /// Returns only calls where isSpoofingRisk is true, ordered by receivedAt DESC.
  Future<List<CallLogTableData>> getSpoofingRiskCalls() async {
    final query = _database.select(_database.callLogTable)
      ..where((tbl) => tbl.isSpoofingRisk.equals(true))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.receivedAt)]);
    
    return await query.get();
  }

  /// Gets call logs for a specific phone number
  ///
  /// Returns all calls from the specified phone number, ordered by receivedAt DESC.
  Future<List<CallLogTableData>> getCallLogsByNumber(String phoneNumber) async {
    final query = _database.select(_database.callLogTable)
      ..where((tbl) => tbl.phoneNumber.equals(phoneNumber))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.receivedAt)]);
    
    return await query.get();
  }

  /// Deletes call logs older than the specified date
  ///
  /// Returns the number of deleted entries.
  Future<int> deleteOldLogs(DateTime cutoffDate) async {
    final query = _database.delete(_database.callLogTable)
      ..where((tbl) => tbl.receivedAt.isSmallerThanValue(cutoffDate));
    
    return await query.go();
  }

  /// Gets a single call log by ID
  ///
  /// Returns the CallLogTableData or null if not found.
  Future<CallLogTableData?> getCallLogById(int id) async {
    final query = _database.select(_database.callLogTable)
      ..where((tbl) => tbl.id.equals(id));
    
    return await query.getSingleOrNull();
  }
}
