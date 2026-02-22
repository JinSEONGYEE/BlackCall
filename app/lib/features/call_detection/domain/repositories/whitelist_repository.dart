import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';

abstract class WhitelistRepository {
  Future<Either<Failure, bool>> isWhitelisted(String phoneNumberHash);
  Future<Either<Failure, void>> syncWhitelist(List<Map<String, String>> contacts);
  Future<Either<Failure, List<String>>> fetchHashedWhitelist();
}
