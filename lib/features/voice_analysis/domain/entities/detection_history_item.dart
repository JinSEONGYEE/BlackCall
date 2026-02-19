/// Domain entity for a saved fraud detection event linked with call info
class DetectionHistoryItem {
  final int id;
  final String patternType;
  final String detectedKeywords;
  final double confidence;
  final DateTime timestamp;
  final String phoneNumber;
  final String formattedNumber;

  DetectionHistoryItem({
    required this.id,
    required this.patternType,
    required this.detectedKeywords,
    required this.confidence,
    required this.timestamp,
    required this.phoneNumber,
    required this.formattedNumber,
  });
}
