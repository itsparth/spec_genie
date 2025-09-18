// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modes_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Load existing modes from Isar on build.
///  - Insert a default (non-editable) mode if database empty.
///  - CRUD operations for editable modes only.
///  - (Selection removed per current requirements)

@ProviderFor(ModesBloc)
const modesBlocProvider = ModesBlocProvider._();

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Load existing modes from Isar on build.
///  - Insert a default (non-editable) mode if database empty.
///  - CRUD operations for editable modes only.
///  - (Selection removed per current requirements)
final class ModesBlocProvider extends $NotifierProvider<ModesBloc, ModeState> {
  /// Bloc responsible for managing modes list & persistence.
  /// Capabilities:
  ///  - Load existing modes from Isar on build.
  ///  - Insert a default (non-editable) mode if database empty.
  ///  - CRUD operations for editable modes only.
  ///  - (Selection removed per current requirements)
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

String _$modesBlocHash() => r'55eb92ae0ae2c3e6e85b2a818725371005c2904a';

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Load existing modes from Isar on build.
///  - Insert a default (non-editable) mode if database empty.
///  - CRUD operations for editable modes only.
///  - (Selection removed per current requirements)

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
