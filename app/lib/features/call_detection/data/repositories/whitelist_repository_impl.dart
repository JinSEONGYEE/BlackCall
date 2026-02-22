import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/core/config/api_config.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/whitelist_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';

class WhitelistRepositoryImpl implements WhitelistRepository {
  final Dio? _dio;
  final WhitelistLocalDataSource _localDataSource;

  WhitelistRepositoryImpl(this._localDataSource, [this._dio]);

  @override
  Future<Either<Failure, bool>> isWhitelisted(String phoneNumberHash) async {
    try {
      final result = await _localDataSource.isWhitelisted(phoneNumberHash);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> syncWhitelist(List<Map<String, String>> contacts) async {
    if (_dio == null) return const Left(ServerFailure('Network not initialized'));
    try {
      await _dio!.post(
        ApiConfig.whitelistSync,
        data: {'items': contacts},
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Sync Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchHashedWhitelist() async {
    if (_dio == null) return const Left(ServerFailure('Network not initialized'));
    try {
      final response = await _dio!.get(ApiConfig.whitelistSync);
      final List<dynamic> data = response.data;
      return Right(data.map((e) => e['phoneNumberHash'] as String).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Fetch Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
