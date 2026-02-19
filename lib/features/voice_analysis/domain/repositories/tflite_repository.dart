import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/tflite_inference_result.dart';

/// Repository interface for TFLite operations
///
/// Provides methods for loading TFLite models, running inference,
/// and managing model lifecycle.
abstract class TFLiteRepository {
  /// Load TFLite model from assets
  ///
  /// [modelPath] - Path to the .tflite model file in assets
  /// Returns Right(void) on success, Left(Failure) on error
  Future<Either<Failure, void>> loadModel(String modelPath);
  
  /// Run inference on audio data
  ///
  /// [audioData] - Input audio data (e.g., 16000 samples for 1 second @ 16kHz)
  /// Returns Right(TFLiteInferenceResult) on success, Left(Failure) on error
  Future<Either<Failure, TFLiteInferenceResult>> runInference(
    List<double> audioData,
  );
  
  /// Check if model is loaded
  ///
  /// Returns true if model is loaded and ready for inference
  bool isModelLoaded();
  
  /// Dispose model and free resources
  ///
  /// Returns Right(void) on success, Left(Failure) on error
  Future<Either<Failure, void>> disposeModel();
}
