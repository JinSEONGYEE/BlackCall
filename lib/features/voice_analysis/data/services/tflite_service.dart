import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/tflite_inference_result.dart';

/// Service to handle TFLite model loading and inference
///
/// Provides methods for loading TFLite models from assets,
/// running inference on audio data, and managing model lifecycle.
class TFLiteService {
  Interpreter? _interpreter;
  bool _isModelLoaded = false;
  
  /// Load model from assets
  ///
  /// [modelPath] - Path to the .tflite model file in assets
  /// Throws Exception if model loading fails
  Future<void> loadModel(String modelPath) async {
    try {
      print('📦 Loading TFLite model from: $modelPath');
      
      // Configure interpreter options
      final options = InterpreterOptions()
        ..threads = 4  // Use 4 threads for inference
        ..useNnApiForAndroid = true;  // Use NNAPI on Android
      
      // Load model
      _interpreter = await Interpreter.fromAsset(
        modelPath,
        options: options,
      );
      
      _isModelLoaded = true;
      
      // Print model info
      print('✅ TFLite model loaded successfully');
      print('   Input tensors: ${_interpreter!.getInputTensors().length}');
      print('   Output tensors: ${_interpreter!.getOutputTensors().length}');
      
      // Print input tensor details
      final inputTensor = _interpreter!.getInputTensor(0);
      print('   Input shape: ${inputTensor.shape}');
      print('   Input type: ${inputTensor.type}');
      
      // Print output tensor details
      final outputTensor = _interpreter!.getOutputTensor(0);
      print('   Output shape: ${outputTensor.shape}');
      print('   Output type: ${outputTensor.type}');
    } catch (e) {
      print('❌ Failed to load TFLite model: $e');
      _isModelLoaded = false;
      rethrow;
    }
  }
  
  /// Run inference on audio data
  ///
  /// [audioData] - Input audio data (e.g., 16000 samples for 1 second @ 16kHz)
  /// Returns TFLiteInferenceResult with output tensor and inference time
  /// Throws Exception if model is not loaded or inference fails
  Future<TFLiteInferenceResult> runInference(List<double> audioData) async {
    if (!_isModelLoaded || _interpreter == null) {
      throw Exception('Model not loaded. Call loadModel() first.');
    }
    
    try {
      final startTime = DateTime.now();
      
      // Prepare input tensor
      // Shape: [1, 16000] for 1 second of audio at 16kHz
      final input = [audioData];
      
      // Prepare output tensor
      // Get output shape from interpreter
      final outputTensor = _interpreter!.getOutputTensor(0);
      final outputShape = outputTensor.shape;
      
      // Create output buffer with correct shape
      // For [1, 2] output: [[0.0, 0.0]]
      final output = List.generate(
        outputShape[0],
        (_) => List.filled(outputShape[1], 0.0),
      );
      
      // Run inference
      _interpreter!.run(input, output);
      
      final endTime = DateTime.now();
      final inferenceTimeMs = endTime.difference(startTime).inMilliseconds;
      
      print('⚡ Inference completed in ${inferenceTimeMs}ms');
      print('   Output: ${output[0]}');
      
      return TFLiteInferenceResult(
        output: output[0].cast<double>(),
        inferenceTimeMs: inferenceTimeMs,
        timestamp: endTime,
      );
    } catch (e) {
      print('❌ Inference failed: $e');
      rethrow;
    }
  }
  
  /// Check if model is loaded
  ///
  /// Returns true if model is loaded and ready for inference
  bool isModelLoaded() => _isModelLoaded;
  
  /// Dispose model and free resources
  ///
  /// Closes the interpreter and frees allocated memory
  Future<void> disposeModel() async {
    try {
      _interpreter?.close();
      _interpreter = null;
      _isModelLoaded = false;
      print('🗑️ TFLite model disposed');
    } catch (e) {
      print('❌ Failed to dispose model: $e');
      rethrow;
    }
  }
}
