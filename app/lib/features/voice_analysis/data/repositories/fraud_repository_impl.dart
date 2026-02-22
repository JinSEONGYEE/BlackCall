import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import '../../../../core/config/api_config.dart';
import '../../domain/repositories/fraud_repository.dart';

class FraudRepositoryImpl implements FraudRepository {
  final Dio _dio;

  FraudRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchFraudPatterns() async {
    try {
      final response = await _dio.get(ApiConfig.fraudPatterns);
      final List<dynamic> data = response.data;
      return Right(data.map((e) => e as Map<String, dynamic>).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Fetch Patterns Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchLatestModelMetadata() async {
    try {
      final response = await _dio.get(ApiConfig.tfliteModelLatest);
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Fetch Model Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
