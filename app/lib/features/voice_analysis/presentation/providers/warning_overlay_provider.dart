import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/audio_capture_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/haptic_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/warning_overlay_service.dart';

part 'warning_overlay_provider.g.dart';

/// Provider for GlobalNavigatorKey.
@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) {
  return GlobalKey<NavigatorState>();
}

/// Provider for WarningOverlayService.
@riverpod
WarningOverlayService warningOverlayService(Ref ref) {
  final audioCaptureService = ref.watch(audioCaptureServiceProvider);
  final hapticService = ref.watch(hapticServiceProvider);
  final key = ref.watch(navigatorKeyProvider);
  
  return WarningOverlayService(
    audioCaptureService: audioCaptureService,
    hapticService: hapticService,
    navigatorKey: key,
  );
}
