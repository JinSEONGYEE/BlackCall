// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistorySyncService)
final historySyncServiceProvider = HistorySyncServiceProvider._();

final class HistorySyncServiceProvider
    extends $NotifierProvider<HistorySyncService, void> {
  HistorySyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historySyncServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historySyncServiceHash();

  @$internal
  @override
  HistorySyncService create() => HistorySyncService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$historySyncServiceHash() =>
    r'bd7984c86dd1b817f5790449abf06e148f5a4d85';

abstract class _$HistorySyncService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
