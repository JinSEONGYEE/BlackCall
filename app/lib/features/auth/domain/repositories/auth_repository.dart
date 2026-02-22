import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> loginWithKakao(String kakaoAccessToken);
  Future<void> logout();
  Future<bool> isAuthenticated();
}
