import 'package:drift/drift.dart';

/// Table to store detected fraud patterns
class FraudPatternTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  /// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
  TextColumn get patternType => text()();
  
  /// Comma-separated list of keywords that triggered this pattern
  TextColumn get detectedKeywords => text()();
  
  /// Confidence score of the detection (0.0 to 1.0)
  RealColumn get confidence => real()();
  
  /// When the pattern was detected
  DateTimeColumn get timestamp => dateTime()();

  /// Reference to the call log entry
  IntColumn get callLogId => integer().nullable()();
}
