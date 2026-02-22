import 'package:drift/drift.dart';

/// Table to store user-defined custom fraud keywords.
class CustomKeywordsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  /// The specific keyword the user wants to alert on
  TextColumn get keyword => text().unique()();
  
  /// When this keyword was added
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}
