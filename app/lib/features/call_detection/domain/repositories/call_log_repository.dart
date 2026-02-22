import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';

/// Abstract repository interface for call log operations
///
/// Provides methods for logging calls, updating call state, and querying call history.
abstract class CallLogRepository {
  /// Log a new incoming call
  ///
  /// Creates a new call log entry with the provided caller information and state.
  /// Returns the created CallLog or a Failure if the operation fails.
  Future<Either<Failure, CallLog>> logCall({
    required CallerInfo callerInfo,
    required String callState,
    required DateTime receivedAt,
    bool isWhitelisted = false,
  });
  
  /// Update call state for an existing call log entry
  ///
  /// Updates the call state (e.g., from 'ringing' to 'offhook' to 'disconnected').
  /// Automatically calculates duration when state changes to 'disconnected'.
  /// Returns the updated CallLog or a Failure if the operation fails.
  Future<Either<Failure, CallLog>> updateCallState({
    required int callLogId,
    required String callState,
    DateTime? timestamp,
  });
  
  /// Get all call logs ordered by most recent first
  ///
  /// Returns a list of all call logs or a Failure if the operation fails.
  Future<Either<Failure, List<CallLog>>> getAllCallLogs();
  
  /// Get call logs filtered by spoofing risk
  ///
  /// Returns only calls that have been flagged as spoofing risks.
  Future<Either<Failure, List<CallLog>>> getSpoofingRiskCalls();
  
  /// Get call logs for a specific phone number
  ///
  /// Returns all calls from the specified phone number.
  Future<Either<Failure, List<CallLog>>> getCallLogsByNumber(String phoneNumber);
  
  /// Delete old call logs (older than specified days)
  ///
  /// Removes call logs older than the specified number of days.
  /// Returns the number of deleted entries or a Failure if the operation fails.
  Future<Either<Failure, int>> deleteOldLogs(int daysToKeep);
}
