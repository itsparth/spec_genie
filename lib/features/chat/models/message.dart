import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'message.mapper.dart';
part 'message.g.dart';

@MappableClass()
@Collection()
class Message with MessageMappable {
  final Id id;
  final String content;
  final DateTime timestamp;
  @Enumerated(EnumType.name)
  final MessageType type;

  const Message({
    this.id = Isar.autoIncrement,
    this.content = '',
    required this.timestamp,
    this.type = MessageType.text,
  });

  /// Create a text message
  factory Message.text(String content) {
    return Message(
      content: content,
      timestamp: DateTime.now(),
      type: MessageType.text,
    );
  }

  /// Create an audio message
  factory Message.audio(String filePath) {
    return Message(
      content: filePath,
      timestamp: DateTime.now(),
      type: MessageType.audio,
    );
  }

  /// Create an image message
  factory Message.image(String filePath) {
    return Message(
      content: filePath,
      timestamp: DateTime.now(),
      type: MessageType.image,
    );
  }

  /// Check if message is a file attachment
  bool get isAttachment {
    return type != MessageType.text;
  }

  /// Get file path for attachments
  String? get filePath {
    return isAttachment ? content : null;
  }
}

@MappableEnum()
enum MessageType {
  text,
  audio,
  image,
}
