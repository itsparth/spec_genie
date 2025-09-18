// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_tags_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(messageTagsRepository)
const messageTagsRepositoryProvider = MessageTagsRepositoryProvider._();

final class MessageTagsRepositoryProvider extends $FunctionalProvider<
    MessageTagsRepository,
    MessageTagsRepository,
    MessageTagsRepository> with $Provider<MessageTagsRepository> {
  const MessageTagsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'messageTagsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$messageTagsRepositoryHash();

  @$internal
  @override
  $ProviderElement<MessageTagsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MessageTagsRepository create(Ref ref) {
    return messageTagsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MessageTagsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MessageTagsRepository>(value),
    );
  }
}

String _$messageTagsRepositoryHash() =>
    r'd84c25087dc95d430a2bd64cbf5b70236526c9be';
