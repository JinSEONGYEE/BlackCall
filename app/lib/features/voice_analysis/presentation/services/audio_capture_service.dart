import 'package:voice_phishing_app/features/voice_analysis/data/datasources/audio_capture_platform_channel.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/vad_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/keyword_spotting_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/pattern_recognition_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/audio_data.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/vad_result.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/keyword_detected_event.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/fraud_pattern_detected_event.dart';

import 'package:voice_phishing_app/features/voice_analysis/data/repositories/custom_keyword_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_definition_repository.dart';

/// Service to manage audio capture during calls
class AudioCaptureService {
  final CustomKeywordRepository _customKeywordRepository;
  final FraudPatternRepository _fraudPatternRepository;
  final FraudPatternDefinitionRepository _fraudPatternDefinitionRepository;
  bool _isInitialized = false;
  
  // VAD service
  final VadService _vadService = VadService();
  
  // Keyword spotting service
  final KeywordSpottingService _keywordSpottingService = KeywordSpottingService();
  
  // Pattern recognition service
  final PatternRecognitionService _patternRecognitionService = PatternRecognitionService();

  AudioCaptureService(
    this._customKeywordRepository,
    this._fraudPatternRepository,
    this._fraudPatternDefinitionRepository,
  );
  
  /// Callback invoked when audio data is received from native side (speech only)
  Function(AudioData)? onAudioDataReceived;
  
  /// Callback invoked when VAD result is available
  Function(VadResult)? onVadResult;
  
  /// Callback invoked when keyword is detected
  Function(KeywordDetectedEvent)? onKeywordDetected;
  
  /// Callback invoked when a fraud pattern is detected
  Function(FraudPatternDetectedEvent)? onPatternDetected;
  
  // Statistics
  int _totalFrames = 0;
  int _speechFrames = 0;
  
  // State
  int? _currentCallLogId;
  
  /// Callback invoked when audio data is received from native side (speech only)
// ... (initialize method unchanged)
  void initialize() {
    if (_isInitialized) {
      print('⚠️ AudioCaptureService already initialized');
      return;
    }
    
    AudioCapturePlatformChannel.initialize();
    
    // Set callback for audio data
    AudioCapturePlatformChannel.onAudioData = _handleAudioData;
    
    // Set keyword detection callback
    _keywordSpottingService.onKeywordDetected = _handleKeywordDetected;
    
    // Set pattern detection callback
    _patternRecognitionService.onPatternDetected = _handlePatternDetected;
    
    _isInitialized = true;
    print('✅ AudioCaptureService initialized with VAD, Keyword Spotting, and Pattern Recognition');
  }
  
  /// Handle audio data from platform channel
// ... (omitted methods)

  void _handleAudioData(Map<String, dynamic> data) {
    final audioData = AudioData(
      data: data['data'],
      length: data['length'],
      sampleRate: data['sampleRate'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(data['timestamp']),
    );
    
    // Perform VAD analysis
    final vadResult = _vadService.analyze(audioData.data, audioData.sampleRate);
    
    // Update statistics
    _totalFrames++;
    if (vadResult.isSpeech) {
      _speechFrames++;
    }
    
    // Forward VAD result
    onVadResult?.call(vadResult);
    
    // Only forward audio data if speech detected (battery optimization)
    if (vadResult.isSpeech) {
      onAudioDataReceived?.call(audioData);
      
      // Analyze for fraud keywords (only during speech)
      _keywordSpottingService.analyze(audioData);
    }
    
    // Log statistics every 100 frames
    if (_totalFrames % 100 == 0) {
      final speechRatio = (_speechFrames / _totalFrames * 100).toStringAsFixed(1);
      print('📊 VAD Stats: $speechRatio% speech ($_speechFrames/$_totalFrames frames)');
    }
  }
  
  /// Handle keyword detection event
  void _handleKeywordDetected(KeywordDetectedEvent event) {
    // Forward to callback
    onKeywordDetected?.call(event);
    
    // Log detection
    print('⚠️ FRAUD KEYWORD DETECTED: ${event.keyword} at ${event.timestamp} (confidence: ${event.confidence.toStringAsFixed(2)})');
    
    // Forward to pattern recognition
    _patternRecognitionService.analyze(event);
  }
  
  /// Handle fraud pattern detection event
  void _handlePatternDetected(FraudPatternDetectedEvent event) {
    // Forward to callback
    onPatternDetected?.call(event);
    
    // Log detection
    print('🚨 FRAUD PATTERN DETECTED: ${event.patternType} (confidence: ${event.confidence.toStringAsFixed(2)})');
    print('Contributing keywords: ${event.contributingKeywords.join(', ')}');
    
    // Save to history
    _fraudPatternRepository.savePattern(event, _currentCallLogId);
  }

  /// Start audio capture
  ///
  /// Requests native side to start capturing audio from microphone.
  /// Returns true if capture started successfully, false otherwise.
  /// Throws exception if service not initialized or permission denied.
  Future<bool> startCapture({int? callLogId}) async {
    if (!_isInitialized) {
      print('❌ AudioCaptureService not initialized');
      throw StateError('AudioCaptureService not initialized. Call initialize() first.');
    }
    
    _currentCallLogId = callLogId;
    
    // 1. Load and set custom keywords for spotting
    final customKeywords = await _customKeywordRepository.getAllKeywords();
    _keywordSpottingService.setCustomKeywords(
      customKeywords.map((k) => k.keyword).toList(),
    );
    
    // 2. Load dynamic fraud patterns for recognition
    final patternDefinitions = await _fraudPatternDefinitionRepository.getAllPatterns();
    final patternsMap = {
      for (var p in patternDefinitions) p.patternType: p.keywords.split(',').map((s) => s.trim()).toList()
    };
    
    // If no patterns in DB, use some defaults initially or wait for update
    if (patternsMap.isEmpty) {
      print('⚠️ No fraud patterns found in database. Using defaults.');
      patternsMap['Kidnapping'] = ['납치', '돈', '지금'];
      patternsMap['Authority Impersonation'] = ['검사', '경찰', '계좌', '보안'];
      patternsMap['Financial Urgency'] = ['입금', '지금', '송금'];
    }
    
    _patternRecognitionService.setPatterns(patternsMap);
    
    // Reset services state and statistics
    _vadService.reset();
    _keywordSpottingService.reset();
    _patternRecognitionService.reset();
    _totalFrames = 0;
    _speechFrames = 0;
    
    print('🎤 Starting audio capture (callLogId: $callLogId) with ${patternsMap.length} dynamic patterns...');
    return await AudioCapturePlatformChannel.startCapture();
  }
  
  /// Stop audio capture
  ///
  /// Requests native side to stop capturing audio and release resources.
  /// Returns true if capture stopped successfully, false otherwise.
  Future<bool> stopCapture() async {
    if (!_isInitialized) {
      return false;
    }
    
    // Log final statistics
    if (_totalFrames > 0) {
      final speechRatio = (_speechFrames / _totalFrames * 100).toStringAsFixed(1);
      print('📊 Final VAD Stats: $speechRatio% speech ($_speechFrames/$_totalFrames frames)');
    }
    
    print('🛑 Stopping audio capture...');
    return await AudioCapturePlatformChannel.stopCapture();
  }
  
  /// Check if capturing
  ///
  /// Returns true if native side is currently capturing audio, false otherwise.
  Future<bool> isCapturing() async {
    if (!_isInitialized) {
      return false;
    }
    
    return await AudioCapturePlatformChannel.isCapturing();
  }
  
  /// Get VAD and keyword spotting statistics
  ///
  /// Returns map with VAD and keyword detection statistics for debugging.
  Map<String, dynamic> getStatistics() {
    return {
      'vad': {
        'totalFrames': _totalFrames,
        'speechFrames': _speechFrames,
        'speechRatio': _totalFrames > 0 ? _speechFrames / _totalFrames : 0.0,
        ..._vadService.getStatistics(),
      },
      'keywordSpotting': _keywordSpottingService.getStatistics(),
    };
  }
}
