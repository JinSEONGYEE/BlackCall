import 'package:flutter/material.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/fraud_pattern_detected_event.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/screens/warning_overlay_screen.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/audio_capture_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/haptic_service.dart';

/// Service that coordinates the warning overlay UI based on fraud detection events.
class WarningOverlayService {
  final AudioCaptureService _audioCaptureService;
  final HapticService _hapticService;
  final GlobalKey<NavigatorState> navigatorKey;
  
  bool _isOverlayShowing = false;

  WarningOverlayService({
    required AudioCaptureService audioCaptureService,
    required HapticService hapticService,
    required this.navigatorKey,
  }) : _audioCaptureService = audioCaptureService,
       _hapticService = hapticService;

  /// Initialize the service and start listening to fraud events.
  void initialize() {
    _audioCaptureService.onPatternDetected = _handlePatternDetected;
  }

  void _handlePatternDetected(FraudPatternDetectedEvent event) {
    // Only show if not already showing and confidence is reasonable
    if (!_isOverlayShowing && event.confidence >= 0.5) {
      // Trigger SOS vibration
      _hapticService.vibrateSOS();
      
      _showWarningOverlay(event);
    }
  }

  void _showWarningOverlay(FraudPatternDetectedEvent event) {
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint('❌ Cannot show overlay: Navigator context is null');
      return;
    }

    _isOverlayShowing = true;

    WarningOverlayScreen.show(
      context,
      patternType: event.patternType,
      keywords: event.contributingKeywords,
      confidence: event.confidence,
    ).then((_) {
      _isOverlayShowing = false;
    });
  }
}
