// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modes_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModesBloc)
const modesBlocProvider = ModesBlocProvider._();

final class ModesBlocProvider extends $NotifierProvider<ModesBloc, List<Mode>> {
  const ModesBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'modesBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$modesBlocHash();

  @$internal
  @override
  ModesBloc create() => ModesBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Mode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Mode>>(value),
    );
  }
}

String _$modesBlocHash() => r'26c8e745dff2e7df00183a18dccaff4c407ee6f8';

abstract class _$ModesBloc extends $Notifier<List<Mode>> {
  List<Mode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Mode>, List<Mode>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Mode>, List<Mode>>, List<Mode>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
