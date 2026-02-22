// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whitelist_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WhitelistSync)
final whitelistSyncProvider = WhitelistSyncProvider._();

final class WhitelistSyncProvider
    extends $NotifierProvider<WhitelistSync, AsyncValue<void>> {
  WhitelistSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'whitelistSyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whitelistSyncHash();

  @$internal
  @override
  WhitelistSync create() => WhitelistSync();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$whitelistSyncHash() => r'344ad33c8d3a380f4e86b1c031c10aafb6b96fea';

abstract class _$WhitelistSync extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
