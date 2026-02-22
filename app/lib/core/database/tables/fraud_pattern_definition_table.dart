import 'package:drift/drift.dart';

/// Table to store dynamic fraud pattern definitions
class FraudPatternDefinitionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  /// Type of fraud pattern (e.g., 'Kidnapping', 'Authority Impersonation')
  TextColumn get patternType => text().unique()();
  
  /// Comma-separated list of keywords that trigger this pattern
  TextColumn get keywords => text()();
  
  /// When this definition was last updated
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
