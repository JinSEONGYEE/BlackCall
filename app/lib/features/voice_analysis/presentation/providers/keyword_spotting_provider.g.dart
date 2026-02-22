// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_spotting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides KeywordSpottingService instance
///
/// Service is initialized on first access and disposed when provider is disposed.

@ProviderFor(keywordSpottingService)
final keywordSpottingServiceProvider = KeywordSpottingServiceProvider._();

/// Provides KeywordSpottingService instance
///
/// Service is initialized on first access and disposed when provider is disposed.

final class KeywordSpottingServiceProvider
    extends
        $FunctionalProvider<
          KeywordSpottingService,
          KeywordSpottingService,
          KeywordSpottingService
        >
    with $Provider<KeywordSpottingService> {
  /// Provides KeywordSpottingService instance
  ///
  /// Service is initialized on first access and disposed when provider is disposed.
  KeywordSpottingServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keywordSpottingServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keywordSpottingServiceHash();

  @$internal
  @override
  $ProviderElement<KeywordSpottingService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  KeywordSpottingService create(Ref ref) {
    return keywordSpottingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeywordSpottingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeywordSpottingService>(value),
    );
  }
}

String _$keywordSpottingServiceHash() =>
    r'9cd742f9f82bad88c7f1ed639dc0de8bd38e2439';
