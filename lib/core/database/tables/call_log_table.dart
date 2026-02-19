import 'package:drift/drift.dart';

/// Drift table for logging incoming call history
///
/// Stores comprehensive metadata about each incoming call including
/// caller information, spoofing risk flags, whitelist status, and timestamps.
class CallLogTable extends Table {
  /// Auto-incrementing primary key
  IntColumn get id => integer().autoIncrement()();
  
  // Call identification
  /// Raw phone number from the call event
  TextColumn get phoneNumber => text()();
  
  /// Formatted phone number for display
  TextColumn get formattedNumber => text()();
  
  // Call metadata
  /// Whether the caller ID is private/blocked
  BoolColumn get isPrivate => boolean()();
  
  /// Whether the number is Korean
  BoolColumn get isKorean => boolean().withDefault(const Constant(false))();
  
  /// Whether the number is international
  BoolColumn get isInternational => boolean().withDefault(const Constant(false))();
  
  /// Whether the number has spoofing risk patterns (070, international)
  BoolColumn get isSpoofingRisk => boolean().withDefault(const Constant(false))();
  
  /// Whether the number is in the whitelist (contacts)
  BoolColumn get isWhitelisted => boolean().withDefault(const Constant(false))();
  
  // Call state
  /// Current state of the call ('idle', 'ringing', 'offhook', 'disconnected', 'unknown')
  TextColumn get callState => text()();
  
  // Timestamps
  /// When the call was received (started ringing)
  DateTimeColumn get receivedAt => dateTime()();
  
  /// When the call was answered (nullable, only set if answered)
  DateTimeColumn get answeredAt => dateTime().nullable()();
  
  /// When the call ended (nullable, only set when disconnected)
  DateTimeColumn get endedAt => dateTime().nullable()();
  
  // Duration
  /// Call duration in seconds (nullable, calculated when call ends)
  IntColumn get durationSeconds => integer().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
