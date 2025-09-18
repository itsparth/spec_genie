// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modes_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(modesRepository)
const modesRepositoryProvider = ModesRepositoryProvider._();

final class ModesRepositoryProvider extends $FunctionalProvider<ModesRepository,
    ModesRepository, ModesRepository> with $Provider<ModesRepository> {
  const ModesRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'modesRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$modesRepositoryHash();

  @$internal
  @override
  $ProviderElement<ModesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ModesRepository create(Ref ref) {
    return modesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModesRepository>(value),
    );
  }
}

String _$modesRepositoryHash() => r'c98192d5eda9767f0505f7259f754fa1920b0f9d';
