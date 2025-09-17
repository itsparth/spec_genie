import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/message.dart';

part 'chat_state.mapper.dart';

@MappableClass()
class ChatState with ChatStateMappable {
  final IList<Message> messages;
  final bool isLoading;
  final bool isSaving;

  const ChatState({
    this.messages = const IListConst([]),
    this.isLoading = false,
    this.isSaving = false,
  });
}