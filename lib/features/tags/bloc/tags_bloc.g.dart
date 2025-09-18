// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bloc responsible for managing tags list & persistence.
/// Capabilities:
///  - Load existing tags from Isar on build.
///  - Insert default (non-editable) tags if database empty.
///  - CRUD operations for editable tags only.

@ProviderFor(TagsBloc)
const tagsBlocProvider = TagsBlocProvider._();

/// Bloc responsible for managing tags list & persistence.
/// Capabilities:
///  - Load existing tags from Isar on build.
///  - Insert default (non-editable) tags if database empty.
///  - CRUD operations for editable tags only.
final class TagsBlocProvider extends $NotifierProvider<TagsBloc, TagState> {
  /// Bloc responsible for managing tags list & persistence.
  /// Capabilities:
  ///  - Load existing tags from Isar on build.
  ///  - Insert default (non-editable) tags if database empty.
  ///  - CRUD operations for editable tags only.
  const TagsBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tagsBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tagsBlocHash();

  @$internal
  @override
  TagsBloc create() => TagsBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagState>(value),
    );
  }
}

String _$tagsBlocHash() => r'c577d303ca497e614459ff5767e3dd42b150e01f';

/// Bloc responsible for managing tags list & persistence.
/// Capabilities:
///  - Load existing tags from Isar on build.
///  - Insert default (non-editable) tags if database empty.
///  - CRUD operations for editable tags only.

abstract class _$TagsBloc extends $Notifier<TagState> {
  TagState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TagState, TagState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TagState, TagState>, TagState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
