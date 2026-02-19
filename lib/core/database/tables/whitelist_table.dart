import 'package:drift/drift.dart';

/// Whitelist table for caching trusted contact phone numbers
///
/// Stores hashed phone numbers from the user's address book to identify
/// trusted contacts and skip fraud analysis for their calls.
class WhitelistTable extends Table {
  /// Auto-incrementing primary key
  IntColumn get id => integer().autoIncrement()();

  /// SHA-256 hash of normalized phone number
  ///
  /// Phone numbers are normalized to +XX-XXX-XXX-XXXX format before hashing
  /// to ensure consistent matching across different number formats.
  TextColumn get phoneNumberHash =>
      text().withLength(min: 64, max: 64)();

  /// Contact name from address book (optional)
  ///
  /// Stored for display purposes only. May be null if contact has no name.
  TextColumn get contactName => text().nullable()();

  /// Timestamp when this entry was added to whitelist
  DateTimeColumn get addedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {phoneNumberHash}, // Prevent duplicate entries
  ];
}
