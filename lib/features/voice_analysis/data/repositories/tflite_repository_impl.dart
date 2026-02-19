import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/tflite_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/tflite_inference_result.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/repositories/tflite_repository.dart';

/// Implementation of TFLiteRepository using TFLiteService
///
/// Wraps TFLiteService methods with Either<Failure, T> error handling
class TFLiteRepositoryImpl implements TFLiteRepository {
  final TFLiteService _service;
  
  TFLiteRepositoryImpl(this._service);
  
  @override
  Future<Either<Failure, void>> loadModel(String modelPath) async {
    try {
      await _service.loadModel(modelPath);
      return const Right(null);
    } catch (e) {
      return Left(TFLiteFailure('Failed to load model: $e'));
    }
  }
  
  @override
  Future<Either<Failure, TFLiteInferenceResult>> runInference(
    List<double> audioData,
  ) async {
    try {
      final result = await _service.runInference(audioData);
      return Right(result);
    } catch (e) {
      return Left(TFLiteFailure('Inference failed: $e'));
    }
  }
  
  @override
  bool isModelLoaded() => _service.isModelLoaded();
  
  @override
  Future<Either<Failure, void>> disposeModel() async {
    try {
      await _service.disposeModel();
      return const Right(null);
    } catch (e) {
      return Left(TFLiteFailure('Failed to dispose model: $e'));
    }
  }
}
