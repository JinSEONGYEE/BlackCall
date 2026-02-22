// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_capture_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides AudioCaptureService instance

@ProviderFor(audioCaptureService)
final audioCaptureServiceProvider = AudioCaptureServiceProvider._();

/// Provides AudioCaptureService instance

final class AudioCaptureServiceProvider
    extends
        $FunctionalProvider<
          AudioCaptureService,
          AudioCaptureService,
          AudioCaptureService
        >
    with $Provider<AudioCaptureService> {
  /// Provides AudioCaptureService instance
  AudioCaptureServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioCaptureServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioCaptureServiceHash();

  @$internal
  @override
  $ProviderElement<AudioCaptureService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AudioCaptureService create(Ref ref) {
    return audioCaptureService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioCaptureService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioCaptureService>(value),
    );
  }
}

String _$audioCaptureServiceHash() =>
    r'460b21b5d4415f6d356924d013e7be9c11202e63';
