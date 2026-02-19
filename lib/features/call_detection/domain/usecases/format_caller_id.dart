import 'package:voice_phishing_app/core/util/phone_number_formatter.dart';
import 'package:voice_phishing_app/core/util/spoofing_detector.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';

/// Use case for formatting caller ID from call event
///
/// This use case takes a CallEvent and creates a CallerInfo entity
/// with properly formatted phone number and spoofing risk detection.
class FormatCallerIdUseCase {
  /// Execute the use case
  ///
  /// Takes a [CallEvent] and returns a [CallerInfo] with formatted number.
  CallerInfo execute(CallEvent callEvent) {
    final phoneNumber = callEvent.phoneNumber;
    final formattedNumber = PhoneNumberFormatter.format(phoneNumber);
    final isPrivate = PhoneNumberFormatter.isPrivate(phoneNumber);
    final isKorean = PhoneNumberFormatter.isKorean(phoneNumber);
    final isInternational = PhoneNumberFormatter.isInternational(phoneNumber);
    final isSpoofingRisk = SpoofingDetector.isSpoofingRisk(phoneNumber);
    
    return CallerInfo(
      phoneNumber: phoneNumber,
      formattedNumber: formattedNumber,
      isPrivate: isPrivate,
      isKorean: isKorean,
      isInternational: isInternational,
      isSpoofingRisk: isSpoofingRisk,
    );
  }
}
