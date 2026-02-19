/// Base class for all failures in the application
///
/// Failures represent errors that occur in the domain and data layers.
/// They should never be thrown as exceptions, but instead returned as
/// part of an `Either<Failure, T>` result.
abstract class Failure {
  const Failure(this.message);
  
  final String message;
  
  @override
  String toString() => message;
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.message == message;
  }
  
  @override
  int get hashCode => message.hashCode;
}

/// Failure related to platform-specific operations
class PlatformFailure extends Failure {
  const PlatformFailure(super.message);
}

/// Failure related to permission requests or checks
class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

/// Failure related to network operations
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Failure related to cache operations
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Failure related to server responses
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure related to validation
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Failure related to database operations
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

/// Failure related to TFLite operations
class TFLiteFailure extends Failure {
  const TFLiteFailure(super.message);
}
