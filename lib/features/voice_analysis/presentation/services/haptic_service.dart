import 'package:voice_phishing_app/features/voice_analysis/data/datasources/haptic_platform_channel.dart';

/// Service to manage haptic feedback (vibrations)
class HapticService {
  /// Trigger SOS Morse code vibration pattern
  Future<void> vibrateSOS() async {
    await HapticPlatformChannel.vibrateSOS();
  }
}
