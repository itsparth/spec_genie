// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaBloc)
const mediaBlocProvider = MediaBlocProvider._();

final class MediaBlocProvider
    extends $NotifierProvider<MediaBloc, List<MediaAttachment>> {
  const MediaBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'mediaBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$mediaBlocHash();

  @$internal
  @override
  MediaBloc create() => MediaBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MediaAttachment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MediaAttachment>>(value),
    );
  }
}

String _$mediaBlocHash() => r'8c96bd44b1fe2d6e58a490fff7176c3bc3feddbc';

abstract class _$MediaBloc extends $Notifier<List<MediaAttachment>> {
  List<MediaAttachment> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<MediaAttachment>, List<MediaAttachment>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<MediaAttachment>, List<MediaAttachment>>,
        List<MediaAttachment>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
