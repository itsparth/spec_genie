import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'message_state.dart';

part 'chat_state.mapper.dart';

@MappableClass()
class ChatState with ChatStateMappable {
  final int? threadId;
  final IList<MessageState> messages;
  final bool isLoading;

  const ChatState({
    this.threadId,
    this.messages = const IListConst([]),
    this.isLoading = false,
  });
}
