// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Plays short UI feedback sounds & haptics for recording lifecycle.

@ProviderFor(feedbackService)
const feedbackServiceProvider = FeedbackServiceProvider._();

/// Plays short UI feedback sounds & haptics for recording lifecycle.

final class FeedbackServiceProvider extends $FunctionalProvider<FeedbackService,
    FeedbackService, FeedbackService> with $Provider<FeedbackService> {
  /// Plays short UI feedback sounds & haptics for recording lifecycle.
  const FeedbackServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'feedbackServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedbackServiceHash();

  @$internal
  @override
  $ProviderElement<FeedbackService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeedbackService create(Ref ref) {
    return feedbackService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedbackService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedbackService>(value),
    );
  }
}

String _$feedbackServiceHash() => r'6856c14a5505cddaf7da00a617b0ba3c43c72e02';
