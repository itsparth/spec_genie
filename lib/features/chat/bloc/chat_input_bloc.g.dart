// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_input_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatInputBloc)
const chatInputBlocProvider = ChatInputBlocProvider._();

final class ChatInputBlocProvider
    extends $NotifierProvider<ChatInputBloc, ChatInputState> {
  const ChatInputBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chatInputBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chatInputBlocHash();

  @$internal
  @override
  ChatInputBloc create() => ChatInputBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatInputState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatInputState>(value),
    );
  }
}

String _$chatInputBlocHash() => r'2c70f9ce0704736b60d3013516ec0df468b7cfa5';

abstract class _$ChatInputBloc extends $Notifier<ChatInputState> {
  ChatInputState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChatInputState, ChatInputState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChatInputState, ChatInputState>,
        ChatInputState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
