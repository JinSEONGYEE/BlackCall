import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';

abstract class FraudRepository {
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchFraudPatterns();
  Future<Either<Failure, Map<String, dynamic>>> fetchLatestModelMetadata();
}
