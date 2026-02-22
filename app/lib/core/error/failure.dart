abstract class Failure {
  final String message;
  const Failure(this.message);
  
  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

class PlatformFailure extends Failure {
  const PlatformFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

class TFLiteFailure extends Failure {
  const TFLiteFailure(super.message);
}
