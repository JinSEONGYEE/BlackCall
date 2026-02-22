import 'package:freezed_annotation/freezed_annotation.dart';

part 'detection_history.freezed.dart';
part 'detection_history.g.dart';

@freezed
class DetectionHistory with _$DetectionHistory {
  const factory DetectionHistory({
    int? id,
    String? phoneNumberHash,
    required DateTime detectedAt,
    @JsonKey(name: 'type') required String detectionType,
    double? confidence,
    String? details,
  }) = _DetectionHistory;

  factory DetectionHistory.fromJson(Map<String, dynamic> json) => _$DetectionHistoryFromJson(json);
}
