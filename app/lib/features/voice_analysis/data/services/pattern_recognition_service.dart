import 'package:voice_phishing_app/features/voice_analysis/domain/entities/keyword_detected_event.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/fraud_pattern_detected_event.dart';

/// Service to recognize complex fraud patterns from detected keywords
class PatternRecognitionService {
  /// Window size for pattern recognition (30 seconds as per Story 3.5)
  static const Duration _windowSize = Duration(seconds: 30);
  
  /// Buffer to store detected keywords within the window
  final List<KeywordDetectedEvent> _keywordBuffer = [];
  
  /// Callback when a fraud pattern is detected
  Function(FraudPatternDetectedEvent)? onPatternDetected;
  
  /// Dynamic fraud scenarios loaded from database
  Map<String, List<String>> _fraudScenarios = {};
  
  /// Set dynamic patterns for recognition
  void setPatterns(Map<String, List<String>> patterns) {
    _fraudScenarios = patterns;
    print('🧠 PatternRecognitionService: Updated with ${patterns.length} dynamic patterns');
  }
  
  /// Analyze a new keyword event
  void analyze(KeywordDetectedEvent event) {
    if (_fraudScenarios.isEmpty) {
      // Don't analyze if no patterns are loaded (wait for startCapture to load them)
      return;
    }
    _keywordBuffer.add(event);
    _cleanupBuffer();
    
    _checkForPatterns();
  }
  
  /// Remove events older than the window size
  void _cleanupBuffer() {
    final now = DateTime.now();
    _keywordBuffer.removeWhere((event) => 
      now.difference(event.timestamp) > _windowSize
    );
  }
  
  /// Check if the buffered keywords match any known fraud scenarios
  void _checkForPatterns() {
    final bufferedKeywords = _keywordBuffer.map((e) => e.keyword).toSet();
    
    for (final entry in _fraudScenarios.entries) {
      final scenarioName = entry.key;
      final requiredKeywords = entry.value;
      
      // Check how many required keywords are present
      final presentKeywords = requiredKeywords.where(
        (k) => bufferedKeywords.contains(k)
      ).toList();
      
      // If we have at least 2 keywords from a scenario, consider it a potential pattern
      // If all are present, high confidence
      if (presentKeywords.length >= 2) {
        final confidence = presentKeywords.length / requiredKeywords.length;
        
        final patternEvent = FraudPatternDetectedEvent(
          patternType: scenarioName,
          confidence: confidence,
          timestamp: DateTime.now(),
          contributingKeywords: presentKeywords,
        );
        
        onPatternDetected?.call(patternEvent);
      }
    }
  }
  
  /// Reset the service state
  void reset() {
    _keywordBuffer.clear();
  }
}
