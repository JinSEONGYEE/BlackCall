import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/call_log_local_datasource.dart';
import 'package:drift/drift.dart';

/// Helper script to add sample call log data for testing UI
///
/// Run this test to populate the database with sample data:
/// flutter test test/helpers/add_sample_call_logs.dart
void main() {
  test('Add sample call logs to database', () async {
    // Initialize Flutter binding for path_provider
    TestWidgetsFlutterBinding.ensureInitialized();
    
    final database = AppDatabase();
    final dataSource = CallLogLocalDataSource(database);

    // Sample call log 1: Normal call (whitelisted)
    await dataSource.insertCallLog(
      CallLogTableCompanion.insert(
        phoneNumber: '+82-10-1234-5678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: const Value(true),
        isInternational: const Value(false),
        isSpoofingRisk: const Value(false),
        isWhitelisted: const Value(true),
        callState: 'disconnected',
        receivedAt: DateTime.now().subtract(const Duration(hours: 2)),
        answeredAt: Value(DateTime.now().subtract(const Duration(hours: 2, minutes: -1))),
        endedAt: Value(DateTime.now().subtract(const Duration(hours: 2, minutes: -6))),
        durationSeconds: const Value(300), // 5 minutes
      ),
    );

    // Sample call log 2: Spoofing risk (070 number)
    await dataSource.insertCallLog(
      CallLogTableCompanion.insert(
        phoneNumber: '070-1234-5678',
        formattedNumber: '070-1234-5678',
        isPrivate: false,
        isKorean: const Value(true),
        isInternational: const Value(false),
        isSpoofingRisk: const Value(true),
        isWhitelisted: const Value(false),
        callState: 'disconnected',
        receivedAt: DateTime.now().subtract(const Duration(hours: 5)),
        answeredAt: Value(DateTime.now().subtract(const Duration(hours: 5, minutes: -1))),
        endedAt: Value(DateTime.now().subtract(const Duration(hours: 5, minutes: -3))),
        durationSeconds: const Value(120), // 2 minutes
      ),
    );

    // Sample call log 3: Missed call (international)
    await dataSource.insertCallLog(
      CallLogTableCompanion.insert(
        phoneNumber: '+1-555-1234',
        formattedNumber: '+1-555-1234',
        isPrivate: false,
        isKorean: const Value(false),
        isInternational: const Value(true),
        isSpoofingRisk: const Value(true),
        isWhitelisted: const Value(false),
        callState: 'disconnected',
        receivedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    );

    // Sample call log 4: Private number
    await dataSource.insertCallLog(
      CallLogTableCompanion.insert(
        phoneNumber: 'Private',
        formattedNumber: 'Private Number',
        isPrivate: true,
        isKorean: const Value(false),
        isInternational: const Value(false),
        isSpoofingRisk: const Value(false),
        isWhitelisted: const Value(false),
        callState: 'disconnected',
        receivedAt: DateTime.now().subtract(const Duration(days: 2)),
        answeredAt: Value(DateTime.now().subtract(const Duration(days: 2, minutes: -1))),
        endedAt: Value(DateTime.now().subtract(const Duration(days: 2, minutes: -2))),
        durationSeconds: const Value(60), // 1 minute
      ),
    );

    // Sample call log 5: Another spoofing risk
    await dataSource.insertCallLog(
      CallLogTableCompanion.insert(
        phoneNumber: '+44-20-1234-5678',
        formattedNumber: '+44-20-1234-5678',
        isPrivate: false,
        isKorean: const Value(false),
        isInternational: const Value(true),
        isSpoofingRisk: const Value(true),
        isWhitelisted: const Value(false),
        callState: 'disconnected',
        receivedAt: DateTime.now().subtract(const Duration(days: 3)),
        answeredAt: Value(DateTime.now().subtract(const Duration(days: 3, minutes: -1))),
        endedAt: Value(DateTime.now().subtract(const Duration(days: 3, minutes: -10))),
        durationSeconds: const Value(540), // 9 minutes
      ),
    );

    print('✅ Added 5 sample call logs to database');
    
    // Verify data was inserted
    final allLogs = await dataSource.getAllCallLogs();
    print('📊 Total call logs in database: ${allLogs.length}');
    
    await database.close();
  });
}
