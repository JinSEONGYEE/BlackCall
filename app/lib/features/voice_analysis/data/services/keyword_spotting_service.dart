import 'dart:typed_data';
import 'dart:math';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/audio_data.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/keyword_detected_event.dart';

/// Service to detect fraud keywords in audio
///
/// NOTE: This is a proof-of-concept implementation using pattern matching.
/// Real keyword spotting requires ASR (Automatic Speech Recognition) model.
/// This implementation establishes infrastructure for future ASR integration.
///
/// Future Enhancement: Replace with ASR model (Whisper, Wav2Vec, or custom KWS)
class KeywordSpottingService {
  // Default fraud keywords (Korean)
  final List<String> _defaultKeywords = [
    '납치',  // Kidnapping
    '입금',  // Deposit
    '지금',  // Now
    '돈',    // Money
    '계좌',  // Account
    '송금',  // Transfer
    '긴급',  // Emergency
    '경찰',  // Police
    '검사',  // Prosecutor
    '보안',  // Security
    '확인',  // Verify
    '피해',  // Damage/Victim
  ];
  
  // Custom keywords from user
  List<String> _customKeywords = [];
  
  // Combined list of keywords being checked
  List<String> get _allKeywords => [..._defaultKeywords, ..._customKeywords];
  
  /// Update custom keywords for detection
  void setCustomKeywords(List<String> keywords) {
    _customKeywords = keywords;
    print('🔄 Custom keywords updated: ${keywords.join(', ')}');
  }
  
  // Callback for keyword detection
  Function(KeywordDetectedEvent)? onKeywordDetected;
  
  // Detection state
  final List<AudioData> _audioBuffer = [];
  static const int _bufferSize = 10;  // Keep last 10 audio frames (~200ms)
  
  // Statistics
  int _totalFrames = 0;
  int _detectionCount = 0;
  
  /// Analyze audio for fraud keywords
  ///
  /// NOTE: This is a placeholder implementation for infrastructure testing.
  /// Real implementation requires ASR model to convert audio to text.
  ///
  /// Current approach:
  /// 1. Calculate audio energy
  /// 2. Use energy-based heuristic to simulate detection
  /// 3. Emit event with random keyword (for testing)
  ///
  /// Future approach (with ASR):
  /// 1. Convert audio to text using ASR
  /// 2. Search for keywords in text
  /// 3. Emit event if keyword found with real confidence score
  void analyze(AudioData audioData) {
    _totalFrames++;
    
    // Add to buffer
    _audioBuffer.add(audioData);
    if (_audioBuffer.length > _bufferSize) {
      _audioBuffer.removeAt(0);
    }
    
    // Pattern-based detection (proof-of-concept)
    // This is NOT real keyword detection, just infrastructure demo
    final energy = _calculateEnergy(audioData.data);
    
    // Simulate keyword detection with low probability
    // In real app, this would be replaced with ASR
    // Detection probability: ~1% of high-energy frames
    if (energy > 0.15 && _shouldTriggerDetection()) {
      _emitDetectionEvent(audioData, energy);
    }
  }
  
  /// Determine if detection should be triggered (simulated)
  bool _shouldTriggerDetection() {
    // Trigger detection ~1% of the time for high-energy frames
    // This simulates occasional keyword detection for testing
    return Random().nextInt(100) == 0;
  }
  
  /// Emit keyword detection event
  void _emitDetectionEvent(AudioData audioData, double energy) {
    // Select random keyword for simulation from the combined list
    final keyword = _allKeywords[Random().nextInt(_allKeywords.length)];
    
    // Calculate simulated confidence based on energy
    // Higher energy = higher confidence (in this simulation)
    final confidence = (energy * 2.0).clamp(0.0, 1.0);
    
    final event = KeywordDetectedEvent(
      keyword: keyword,
      timestamp: DateTime.now(),
      confidence: confidence,
      audioData: audioData,
    );
    
    _detectionCount++;
    
    print('⚠️ Keyword detected: $keyword (confidence: ${confidence.toStringAsFixed(2)})');
    onKeywordDetected?.call(event);
  }
  
  /// Calculate audio energy (helper for pattern matching)
  double _calculateEnergy(Uint8List audioData) {
    if (audioData.isEmpty) return 0.0;
    
    // Convert bytes to 16-bit PCM samples and calculate average absolute value
    double sum = 0.0;
    int sampleCount = 0;
    
    for (int i = 0; i < audioData.length - 1; i += 2) {
      final sample = (audioData[i + 1] << 8) | audioData[i];
      final signedSample = sample > 32767 ? sample - 65536 : sample;
      sum += signedSample.abs();
      sampleCount++;
    }
    
    if (sampleCount == 0) return 0.0;
    
    // Normalize to 0-1 range (16-bit PCM max = 32768)
    return sum / sampleCount / 32768.0;
  }
  
  /// Reset detection state
  void reset() {
    _audioBuffer.clear();
    _totalFrames = 0;
    _detectionCount = 0;
    print('🔄 Keyword spotting state reset');
  }
  
  /// Get fraud keywords list (default + custom)
  List<String> getFraudKeywords() => List.unmodifiable(_allKeywords);
  
  /// Get detection statistics
  Map<String, dynamic> getStatistics() {
    return {
      'totalFrames': _totalFrames,
      'detectionCount': _detectionCount,
      'detectionRate': _totalFrames > 0 
          ? (_detectionCount / _totalFrames * 100).toStringAsFixed(2) + '%'
          : '0%',
    };
  }
}
