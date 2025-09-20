// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modes_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Provides CRUD operations for editable modes.
///  - List state derives from watchAllModesProvider stream; no manual seeding here.

@ProviderFor(ModesBloc)
const modesBlocProvider = ModesBlocProvider._();

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Provides CRUD operations for editable modes.
///  - List state derives from watchAllModesProvider stream; no manual seeding here.
final class ModesBlocProvider extends $NotifierProvider<ModesBloc, ModeState> {
  /// Bloc responsible for managing modes list & persistence.
  /// Capabilities:
  ///  - Provides CRUD operations for editable modes.
  ///  - List state derives from watchAllModesProvider stream; no manual seeding here.
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
  Override overrideWithValue(ModeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeState>(value),
    );
  }
}

String _$modesBlocHash() => r'60120023378522efb7e3bbff6f10a934df5e851b';

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Provides CRUD operations for editable modes.
///  - List state derives from watchAllModesProvider stream; no manual seeding here.

abstract class _$ModesBloc extends $Notifier<ModeState> {
  ModeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ModeState, ModeState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ModeState, ModeState>, ModeState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
