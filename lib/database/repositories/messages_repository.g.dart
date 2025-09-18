// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(messagesRepository)
const messagesRepositoryProvider = MessagesRepositoryProvider._();

final class MessagesRepositoryProvider extends $FunctionalProvider<
    MessagesRepository,
    MessagesRepository,
    MessagesRepository> with $Provider<MessagesRepository> {
  const MessagesRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'messagesRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$messagesRepositoryHash();

  @$internal
  @override
  $ProviderElement<MessagesRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MessagesRepository create(Ref ref) {
    return messagesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MessagesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MessagesRepository>(value),
    );
  }
}

String _$messagesRepositoryHash() =>
    r'0942c600b4216ccf176130aade501cc9bd552f35';
