import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import '../../../../core/config/api_config.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;

  AuthRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, String>> loginWithKakao(String kakaoAccessToken) async {
    try {
      final response = await _dio.post(
        ApiConfig.loginKakao,
        data: {'kakaoAccessToken': kakaoAccessToken},
      );

      final token = response.data['access_token'] as String;
      
      // Store token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      return Right(token);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  @override
  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_token');
  }
}
