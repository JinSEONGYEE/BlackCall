import 'package:drift/drift.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/fraud_pattern_detected_event.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/detection_history_item.dart';

/// Repository to manage fraud pattern detection history
class FraudPatternRepository {
  final AppDatabase _db;

  FraudPatternRepository(this._db);

  /// Save a detected fraud pattern
  Future<int> savePattern(FraudPatternDetectedEvent event, int? callLogId) async {
    return await _db.into(_db.fraudPatternTable).insert(
      FraudPatternTableCompanion.insert(
        patternType: event.patternType,
        detectedKeywords: event.contributingKeywords.join(', '),
        confidence: event.confidence,
        timestamp: event.timestamp,
        callLogId: callLogId != null ? Value(callLogId) : const Value.absent(),
      ),
    );
  }

  /// Get all fraud detection events linked with call log information
  Future<List<DetectionHistoryItem>> getDetectionHistory() async {
    final query = _db.select(_db.fraudPatternTable).join([
      leftOuterJoin(
        _db.callLogTable,
        _db.callLogTable.id.equalsExp(_db.fraudPatternTable.callLogId),
      ),
    ]);

    final results = await query.get();

    return results.map((row) {
      final pattern = row.readTable(_db.fraudPatternTable);
      final callLog = row.readTableOrNull(_db.callLogTable);

      return DetectionHistoryItem(
        id: pattern.id,
        patternType: pattern.patternType,
        detectedKeywords: pattern.detectedKeywords,
        confidence: pattern.confidence,
        timestamp: pattern.timestamp,
        phoneNumber: callLog?.phoneNumber ?? 'Unknown',
        formattedNumber: callLog?.formattedNumber ?? 'Unknown',
      );
    }).toList();
  }
}
