// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_capture_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioCaptureServiceHash() =>
    r'8f3c4a5b6e7d8c9a0b1c2d3e4f5a6b7c8d9e0f1a';

/// Provides AudioCaptureService instance
///
/// Service is initialized on first access and disposed when provider is disposed.
/// Automatically stops audio capture on disposal to prevent resource leaks.
///
/// Copied from [audioCaptureService].
@ProviderFor(audioCaptureService)
final audioCaptureServiceProvider =
    AutoDisposeProvider<AudioCaptureService>.internal(
  audioCaptureService,
  name: r'audioCaptureServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioCaptureServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioCaptureServiceRef = AutoDisposeProviderRef<AudioCaptureService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
