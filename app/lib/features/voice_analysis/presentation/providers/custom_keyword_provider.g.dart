// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_keyword_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customKeywordRepository)
final customKeywordRepositoryProvider = CustomKeywordRepositoryProvider._();

final class CustomKeywordRepositoryProvider
    extends
        $FunctionalProvider<
          CustomKeywordRepository,
          CustomKeywordRepository,
          CustomKeywordRepository
        >
    with $Provider<CustomKeywordRepository> {
  CustomKeywordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customKeywordRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customKeywordRepositoryHash();

  @$internal
  @override
  $ProviderElement<CustomKeywordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CustomKeywordRepository create(Ref ref) {
    return customKeywordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomKeywordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomKeywordRepository>(value),
    );
  }
}

String _$customKeywordRepositoryHash() =>
    r'85d11fc52f910086a6f0f39f8bc8576fa808cd17';

@ProviderFor(CustomKeywordsNotifier)
final customKeywordsProvider = CustomKeywordsNotifierProvider._();

final class CustomKeywordsNotifierProvider
    extends
        $AsyncNotifierProvider<CustomKeywordsNotifier, List<CustomKeyword>> {
  CustomKeywordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customKeywordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customKeywordsNotifierHash();

  @$internal
  @override
  CustomKeywordsNotifier create() => CustomKeywordsNotifier();
}

String _$customKeywordsNotifierHash() =>
    r'6514e9b0e1c74aa8fddcb23d32f4ebc43b2f0ea8';

abstract class _$CustomKeywordsNotifier
    extends $AsyncNotifier<List<CustomKeyword>> {
  FutureOr<List<CustomKeyword>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<CustomKeyword>>, List<CustomKeyword>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CustomKeyword>>, List<CustomKeyword>>,
              AsyncValue<List<CustomKeyword>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
