import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/call_log_repository.dart';

/// Use case for logging a new incoming call
///
/// Creates a call log entry with caller information and initial state.
class LogCallUseCase {
  final CallLogRepository _repository;

  LogCallUseCase(this._repository);

  /// Execute the use case
  ///
  /// Logs a new call with the provided caller information and state.
  /// Returns the created CallLog or a Failure if the operation fails.
  Future<Either<Failure, CallLog>> execute({
    required CallerInfo callerInfo,
    required String callState,
    required DateTime receivedAt,
    bool isWhitelisted = false,
  }) async {
    return await _repository.logCall(
      callerInfo: callerInfo,
      callState: callState,
      receivedAt: receivedAt,
      isWhitelisted: isWhitelisted,
    );
  }
}
