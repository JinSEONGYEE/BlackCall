// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(detectionHistory)
final detectionHistoryProvider = DetectionHistoryProvider._();

final class DetectionHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DetectionHistoryItem>>,
          List<DetectionHistoryItem>,
          FutureOr<List<DetectionHistoryItem>>
        >
    with
        $FutureModifier<List<DetectionHistoryItem>>,
        $FutureProvider<List<DetectionHistoryItem>> {
  DetectionHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'detectionHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$detectionHistoryHash();

  @$internal
  @override
  $FutureProviderElement<List<DetectionHistoryItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DetectionHistoryItem>> create(Ref ref) {
    return detectionHistory(ref);
  }
}

String _$detectionHistoryHash() => r'373c1ef2f1427629a3092d4263a194da826920f1';
