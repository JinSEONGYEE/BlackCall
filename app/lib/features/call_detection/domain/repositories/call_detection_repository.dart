import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';

/// Abstract repository interface for call detection
///
/// This interface defines the contract for accessing call detection data.
/// Implementations must handle platform-specific details and error mapping.
abstract class CallDetectionRepository {
  /// Stream of call events
  ///
  /// Returns a stream that emits [CallEvent] objects whenever a call state
  /// changes. Errors are mapped to [Failure] objects.
  ///
  /// Returns [Either<Failure, CallEvent>] where:
  /// - Left: [Failure] if an error occurs (e.g., permission denied, platform error)
  /// - Right: [CallEvent] for successful call state changes
  Stream<Either<Failure, CallEvent>> watchCallEvents();
  
  /// Check if phone permissions are granted
  ///
  /// Returns [Either<Failure, bool>] where:
  /// - Left: [Failure] if permission check fails
  /// - Right: true if permissions are granted, false otherwise
  Future<Either<Failure, bool>> hasPhonePermissions();
  
  /// Request phone permissions
  ///
  /// Returns [Either<Failure, bool>] where:
  /// - Left: [Failure] if permission request fails
  /// - Right: true if permissions were granted, false if denied
  Future<Either<Failure, bool>> requestPhonePermissions();
}
