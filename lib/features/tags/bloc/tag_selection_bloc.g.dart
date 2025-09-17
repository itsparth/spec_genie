// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_selection_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bloc for managing selected tags in a specific context (identified by key)
/// Supports adding/removing tags with deduplication
/// Watches tags bloc to sync when tags are deleted or modified

@ProviderFor(TagSelectionBloc)
const tagSelectionBlocProvider = TagSelectionBlocFamily._();

/// Bloc for managing selected tags in a specific context (identified by key)
/// Supports adding/removing tags with deduplication
/// Watches tags bloc to sync when tags are deleted or modified
final class TagSelectionBlocProvider
    extends $NotifierProvider<TagSelectionBloc, TagSelectionState> {
  /// Bloc for managing selected tags in a specific context (identified by key)
  /// Supports adding/removing tags with deduplication
  /// Watches tags bloc to sync when tags are deleted or modified
  const TagSelectionBlocProvider._(
      {required TagSelectionBlocFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'tagSelectionBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tagSelectionBlocHash();

  @override
  String toString() {
    return r'tagSelectionBlocProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TagSelectionBloc create() => TagSelectionBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagSelectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagSelectionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TagSelectionBlocProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tagSelectionBlocHash() => r'082803c2161ad1196d377d26c4ecc879d3a9a873';

/// Bloc for managing selected tags in a specific context (identified by key)
/// Supports adding/removing tags with deduplication
/// Watches tags bloc to sync when tags are deleted or modified

final class TagSelectionBlocFamily extends $Family
    with
        $ClassFamilyOverride<TagSelectionBloc, TagSelectionState,
            TagSelectionState, TagSelectionState, String> {
  const TagSelectionBlocFamily._()
      : super(
          retry: null,
          name: r'tagSelectionBlocProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Bloc for managing selected tags in a specific context (identified by key)
  /// Supports adding/removing tags with deduplication
  /// Watches tags bloc to sync when tags are deleted or modified

  TagSelectionBlocProvider call(
    String key,
  ) =>
      TagSelectionBlocProvider._(argument: key, from: this);

  @override
  String toString() => r'tagSelectionBlocProvider';
}

/// Bloc for managing selected tags in a specific context (identified by key)
/// Supports adding/removing tags with deduplication
/// Watches tags bloc to sync when tags are deleted or modified

abstract class _$TagSelectionBloc extends $Notifier<TagSelectionState> {
  late final _$args = ref.$arg as String;
  String get key => _$args;

  TagSelectionState build(
    String key,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<TagSelectionState, TagSelectionState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TagSelectionState, TagSelectionState>,
        TagSelectionState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
