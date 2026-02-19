import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/call_log_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/call_log_repository.dart';

/// Implementation of CallLogRepository
///
/// Handles call log operations with Either error handling.
class CallLogRepositoryImpl implements CallLogRepository {
  final CallLogLocalDataSource _localDataSource;

  CallLogRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, CallLog>> logCall({
    required CallerInfo callerInfo,
    required String callState,
    required DateTime receivedAt,
    bool isWhitelisted = false,
  }) async {
    try {
      final companion = CallLogTableCompanion.insert(
        phoneNumber: callerInfo.phoneNumber,
        formattedNumber: callerInfo.formattedNumber,
        isPrivate: callerInfo.isPrivate,
        isKorean: Value(callerInfo.isKorean),
        isInternational: Value(callerInfo.isInternational),
        isSpoofingRisk: Value(callerInfo.isSpoofingRisk),
        isWhitelisted: Value(isWhitelisted),
        callState: callState,
        receivedAt: receivedAt,
      );

      final data = await _localDataSource.insertCallLog(companion);
      final callLog = _mapToCallLog(data);

      return Right(callLog);
    } catch (e) {
      return Left(DatabaseFailure('Failed to log call: $e'));
    }
  }

  @override
  Future<Either<Failure, CallLog>> updateCallState({
    required int callLogId,
    required String callState,
    DateTime? timestamp,
  }) async {
    try {
      // Get the existing call log to calculate duration
      final existing = await _localDataSource.getCallLogById(callLogId);
      if (existing == null) {
        return const Left(DatabaseFailure('Call log not found'));
      }

      // Prepare update companion
      CallLogTableCompanion companion;

      if (callState == 'offhook') {
        // Call was answered
        companion = CallLogTableCompanion(
          callState: Value(callState),
          answeredAt: Value(timestamp ?? DateTime.now()),
        );
      } else if (callState == 'disconnected') {
        // Call ended - calculate duration
        final endTime = timestamp ?? DateTime.now();
        final startTime = existing.answeredAt ?? existing.receivedAt;
        final duration = endTime.difference(startTime).inSeconds;

        companion = CallLogTableCompanion(
          callState: Value(callState),
          endedAt: Value(endTime),
          durationSeconds: Value(duration),
        );
      } else {
        // Other state changes (e.g., ringing)
        companion = CallLogTableCompanion(
          callState: Value(callState),
        );
      }

      final data = await _localDataSource.updateCallLog(callLogId, companion);
      final callLog = _mapToCallLog(data);

      return Right(callLog);
    } catch (e) {
      return Left(DatabaseFailure('Failed to update call state: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CallLog>>> getAllCallLogs() async {
    try {
      final dataList = await _localDataSource.getAllCallLogs();
      final callLogs = dataList.map(_mapToCallLog).toList();
      return Right(callLogs);
    } catch (e) {
      return Left(DatabaseFailure('Failed to get call logs: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CallLog>>> getSpoofingRiskCalls() async {
    try {
      final dataList = await _localDataSource.getSpoofingRiskCalls();
      final callLogs = dataList.map(_mapToCallLog).toList();
      return Right(callLogs);
    } catch (e) {
      return Left(DatabaseFailure('Failed to get spoofing risk calls: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CallLog>>> getCallLogsByNumber(
      String phoneNumber) async {
    try {
      final dataList = await _localDataSource.getCallLogsByNumber(phoneNumber);
      final callLogs = dataList.map(_mapToCallLog).toList();
      return Right(callLogs);
    } catch (e) {
      return Left(
          DatabaseFailure('Failed to get call logs by number: $e'));
    }
  }

  @override
  Future<Either<Failure, int>> deleteOldLogs(int daysToKeep) async {
    try {
      final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));
      final count = await _localDataSource.deleteOldLogs(cutoffDate);
      return Right(count);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete old logs: $e'));
    }
  }

  /// Maps CallLogTableData to CallLog domain entity
  CallLog _mapToCallLog(CallLogTableData data) {
    return CallLog(
      id: data.id,
      phoneNumber: data.phoneNumber,
      formattedNumber: data.formattedNumber,
      isPrivate: data.isPrivate,
      isKorean: data.isKorean,
      isInternational: data.isInternational,
      isSpoofingRisk: data.isSpoofingRisk,
      isWhitelisted: data.isWhitelisted,
      callState: data.callState,
      receivedAt: data.receivedAt,
      answeredAt: data.answeredAt,
      endedAt: data.endedAt,
      durationSeconds: data.durationSeconds,
    );
  }
}
