import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/config/api_config.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final Dio _dio;

  SettingsRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, AppSettings>> fetchSettings() async {
    try {
      final response = await _dio.get(ApiConfig.settings);
      return Right(AppSettings.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Fetch Settings Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppSettings>> updateSettings(AppSettings settings) async {
    try {
      final response = await _dio.patch(
        ApiConfig.settings,
        data: settings.toJson(),
      );
      return Right(AppSettings.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Update Settings Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
