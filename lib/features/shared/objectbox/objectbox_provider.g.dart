// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for ObjectBox store instance

@ProviderFor(store)
const storeProvider = StoreProvider._();

/// Provider for ObjectBox store instance

final class StoreProvider extends $FunctionalProvider<Store, Store, Store>
    with $Provider<Store> {
  /// Provider for ObjectBox store instance
  const StoreProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'storeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$storeHash();

  @$internal
  @override
  $ProviderElement<Store> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Store create(Ref ref) {
    return store(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Store value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Store>(value),
    );
  }
}

String _$storeHash() => r'cf6146bdfb772aa94452a97ff5c5ee0063b062f6';
