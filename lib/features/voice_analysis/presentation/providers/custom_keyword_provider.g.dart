// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_keyword_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customKeywordRepositoryHash() =>
    r'7e55c51d68e340dc84fe081c887b528af12345678';

/// See also [customKeywordRepository].
@ProviderFor(customKeywordRepository)
final customKeywordRepositoryProvider = Provider<CustomKeywordRepository>.internal(
  customKeywordRepository,
  name: r'customKeywordRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customKeywordRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CustomKeywordRepositoryRef = ProviderRef<CustomKeywordRepository>;
String _$customKeywordsNotifierHash() =>
    r'8f1d4fae7dec11d0a76500a0c91e6bf6';

/// See also [CustomKeywordsNotifier].
@ProviderFor(CustomKeywordsNotifier)
final customKeywordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CustomKeywordsNotifier, List<CustomKeyword>>.internal(
  CustomKeywordsNotifier.new,
  name: r'customKeywordsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customKeywordsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomKeywordsNotifier = AutoDisposeAsyncNotifier<List<CustomKeyword>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
