import 'package:voice_phishing_app/features/voice_analysis/data/datasources/call_control_platform_channel.dart';

/// Service to manage call control actions
class CallControlService {
  /// Terminate the active call
  Future<bool> terminateCall() async {
    return await CallControlPlatformChannel.terminateCall();
  }

  /// Terminate current call and call 112
  Future<bool> reportEmergency() async {
    return await CallControlPlatformChannel.reportEmergency();
  }
}
