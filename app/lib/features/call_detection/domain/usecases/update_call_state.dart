import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/call_log_repository.dart';

/// Use case for updating call state
///
/// Updates the state of an existing call log entry (e.g., answered, ended).
class UpdateCallStateUseCase {
  final CallLogRepository _repository;

  UpdateCallStateUseCase(this._repository);

  /// Execute the use case
  ///
  /// Updates the call state for the specified call log entry.
  /// Automatically calculates duration when state changes to 'disconnected'.
  /// Returns the updated CallLog or a Failure if the operation fails.
  Future<Either<Failure, CallLog>> execute({
    required int callLogId,
    required String callState,
    DateTime? timestamp,
  }) async {
    return await _repository.updateCallState(
      callLogId: callLogId,
      callState: callState,
      timestamp: timestamp,
    );
  }
}
