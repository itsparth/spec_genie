import 'package:dart_mappable/dart_mappable.dart';
import 'package:spec_genie/database/database.dart';

part 'message_state.mapper.dart';

@MappableClass()
class MessageState with MessageStateMappable {
  final MessageRow message;
  final bool isSaving;
  final bool isProcessing;
  final String? error;

  const MessageState({
    required this.message,
    this.isSaving = false,
    this.isProcessing = false,
    this.error,
  });
}
