import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/config/api_config.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import '../../domain/entities/detection_history.dart';
import '../../domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final Dio _dio;

  HistoryRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, List<DetectionHistory>>> fetchHistory() async {
    try {
      final response = await _dio.get(ApiConfig.detectionHistory);
      final List<dynamic> data = response.data;
      return Right(data.map((e) => DetectionHistory.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Fetch History Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetectionHistory>> addHistory(DetectionHistory entry) async {
    try {
      final response = await _dio.post(
        ApiConfig.detectionHistory,
        data: entry.toJson(),
      );
      return Right(DetectionHistory.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Sync History Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
