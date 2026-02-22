import 'dart:math';
import 'dart:typed_data';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/vad_result.dart';

/// Service to perform Voice Activity Detection (VAD)
///
/// Uses energy-based algorithm with RMS calculation and adaptive thresholding.
/// Detects speech vs silence to minimize battery consumption.
class VadService {
  // Configuration
  static const double _initialThresholdMultiplier = 2.0;  // Threshold = noise * multiplier
  static const double _thresholdAdaptationRate = 0.1;     // How fast threshold adapts
  static const int _hangoverFrames = 5;                   // Frames to keep active after speech
  static const int _initialSilenceFrames = 10;            // Frames to estimate initial noise
  
  // State
  double _threshold = 0.01;                               // Current threshold
  double _noiseEstimate = 0.01;                           // Estimated background noise
  int _hangoverCounter = 0;                               // Hangover counter
  int _frameCount = 0;                                    // Total frames processed
  bool _isInitialized = false;                            // Whether initial noise estimated
  
  /// Analyze audio frame for voice activity
  ///
  /// Returns VadResult indicating whether speech is detected.
  VadResult analyze(Uint8List audioData, int sampleRate) {
    // Calculate RMS energy
    final energy = _calculateRMS(audioData);
    
    // Initialize threshold from first few frames (assumed silence)
    if (!_isInitialized) {
      _initializeThreshold(energy);
    }
    
    // Detect speech
    bool isSpeech = energy > _threshold;
    
    // Apply hangover period
    if (isSpeech) {
      _hangoverCounter = _hangoverFrames;
    } else if (_hangoverCounter > 0) {
      _hangoverCounter--;
      isSpeech = true;  // Keep active during hangover
    }
    
    // Update threshold during silence
    if (!isSpeech) {
      _updateThreshold(energy);
    }
    
    _frameCount++;
    
    return VadResult(
      isSpeech: isSpeech,
      energy: energy,
      threshold: _threshold,
      timestamp: DateTime.now(),
    );
  }
  
  /// Calculate RMS (Root Mean Square) energy
  ///
  /// Converts bytes to 16-bit PCM samples and calculates RMS.
  /// Returns normalized energy value (0.0 to 1.0).
  double _calculateRMS(Uint8List audioData) {
    if (audioData.isEmpty) return 0.0;
    
    // Convert bytes to 16-bit PCM samples
    final samples = <int>[];
    for (int i = 0; i < audioData.length - 1; i += 2) {
      // Little-endian 16-bit PCM
      final sample = (audioData[i + 1] << 8) | audioData[i];
      // Convert to signed
      final signedSample = sample > 32767 ? sample - 65536 : sample;
      samples.add(signedSample);
    }
    
    if (samples.isEmpty) return 0.0;
    
    // Calculate RMS
    double sumSquares = 0.0;
    for (final sample in samples) {
      sumSquares += sample * sample;
    }
    
    final rms = sqrt(sumSquares / samples.length);
    
    // Normalize to 0-1 range (16-bit PCM max = 32768)
    return rms / 32768.0;
  }
  
  /// Initialize threshold from first few frames
  ///
  /// Assumes first frames are silence and estimates background noise.
  void _initializeThreshold(double energy) {
    if (_frameCount < _initialSilenceFrames) {
      // Accumulate noise estimate
      _noiseEstimate = (_noiseEstimate * _frameCount + energy) / (_frameCount + 1);
    } else {
      // Set initial threshold
      _threshold = _noiseEstimate * _initialThresholdMultiplier;
      _isInitialized = true;
      print('✅ VAD initialized: noise=${_noiseEstimate.toStringAsFixed(4)}, threshold=${_threshold.toStringAsFixed(4)}');
    }
  }
  
  /// Update threshold adaptively during silence
  ///
  /// Slowly adapts to changing background noise levels.
  void _updateThreshold(double energy) {
    if (!_isInitialized) return;
    
    // Update noise estimate (slow adaptation)
    _noiseEstimate = _noiseEstimate * (1 - _thresholdAdaptationRate) +
                     energy * _thresholdAdaptationRate;
    
    // Update threshold
    _threshold = _noiseEstimate * _initialThresholdMultiplier;
  }
  
  /// Reset VAD state
  ///
  /// Clears all state and prepares for new audio stream.
  void reset() {
    _threshold = 0.01;
    _noiseEstimate = 0.01;
    _hangoverCounter = 0;
    _frameCount = 0;
    _isInitialized = false;
    print('🔄 VAD state reset');
  }
  
  /// Get current statistics
  ///
  /// Returns map with VAD statistics for debugging.
  Map<String, dynamic> getStatistics() {
    return {
      'frameCount': _frameCount,
      'threshold': _threshold,
      'noiseEstimate': _noiseEstimate,
      'isInitialized': _isInitialized,
      'hangoverCounter': _hangoverCounter,
    };
  }
}
