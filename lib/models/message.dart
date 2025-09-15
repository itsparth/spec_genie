import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'message.mapper.dart';
part 'message.g.dart';

@MappableClass()
@Collection()
class Message with MessageMappable {
  final Id id;
  final String content;
  @Enumerated(EnumType.name)
  final MessageType type;
  final DateTime timestamp;
  final bool isUser;
  final String threadId;
  final String filePath; // For audio, image, file attachments
  final String fileName;
  final int fileSize;
  final String mimeType;
  final String transcription; // For audio messages
  @Ignore()
  final Map<String, dynamic> metadata; // Additional data

  const Message({
    this.id = Isar.autoIncrement,
    this.content = '',
    this.type = MessageType.text,
    required this.timestamp,
    this.isUser = true,
    this.threadId = '',
    this.filePath = '',
    this.fileName = '',
    this.fileSize = 0,
    this.mimeType = '',
    this.transcription = '',
    this.metadata = const {},
  });

  /// Create a text message
  factory Message.text({
    required String content,
    required String threadId,
    bool isUser = true,
  }) {
    return Message(
      content: content,
      type: MessageType.text,
      threadId: threadId,
      isUser: isUser,
      timestamp: DateTime.now(),
    );
  }

  /// Create an audio message
  factory Message.audio({
    required String filePath,
    required String threadId,
    String? transcription,
    int? duration,
    bool isUser = true,
  }) {
    return Message(
      content: transcription ?? '',
      type: MessageType.audio,
      threadId: threadId,
      filePath: filePath,
      fileName: filePath.split('/').last,
      isUser: isUser,
      timestamp: DateTime.now(),
      transcription: transcription ?? '',
      metadata: duration != null ? {'duration': duration} : {},
    );
  }

  /// Create an image message
  factory Message.image({
    required String filePath,
    required String threadId,
    String? description,
    bool isUser = true,
  }) {
    return Message(
      content: description ?? '',
      type: MessageType.image,
      threadId: threadId,
      filePath: filePath,
      fileName: filePath.split('/').last,
      isUser: isUser,
      timestamp: DateTime.now(),
    );
  }

  /// Create a file message
  factory Message.file({
    required String filePath,
    required String threadId,
    String? description,
    bool isUser = true,
  }) {
    return Message(
      content: description ?? '',
      type: MessageType.file,
      threadId: threadId,
      filePath: filePath,
      fileName: filePath.split('/').last,
      isUser: isUser,
      timestamp: DateTime.now(),
    );
  }

  /// Create an AI response message
  factory Message.aiResponse({
    required String content,
    required String threadId,
    String? mode,
  }) {
    return Message(
      content: content,
      type: MessageType.aiResponse,
      threadId: threadId,
      isUser: false,
      timestamp: DateTime.now(),
      metadata: mode != null ? {'mode': mode} : {},
    );
  }

  /// Get display content based on message type
  String get displayContent {
    switch (type) {
      case MessageType.text:
        return content;
      case MessageType.audio:
        return transcription.isNotEmpty ? transcription : 'Audio message';
      case MessageType.image:
        return content.isNotEmpty ? content : 'Image: $fileName';
      case MessageType.file:
        return content.isNotEmpty ? content : 'File: $fileName';
      case MessageType.aiResponse:
        return content;
    }
  }

  /// Check if message has a file attachment
  bool get hasFile {
    return filePath.isNotEmpty &&
        [
          MessageType.audio,
          MessageType.image,
          MessageType.file,
        ].contains(type);
  }

  /// Get file size in MB
  double get fileSizeMB {
    return fileSize / (1024 * 1024);
  }

  /// Get duration for audio messages
  int? get audioDuration {
    return metadata['duration'] as int?;
  }

  /// Get mode for AI responses
  String? get aiMode {
    return metadata['mode'] as String?;
  }

  /// Check if message is deletable (user messages are always deletable)
  bool get isDeletable {
    return isUser; // Only user messages can be deleted
  }

  /// Get formatted timestamp
  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }

  /// Update transcription for audio messages
  Message updateTranscription(String newTranscription) {
    return copyWith(
      transcription: newTranscription,
      content: newTranscription,
    );
  }

  /// Update description/content
  Message updateContent(String newContent) {
    return copyWith(content: newContent);
  }

  /// Add metadata
  Message addMetadata(String key, dynamic value) {
    final updatedMetadata = Map<String, dynamic>.from(metadata);
    updatedMetadata[key] = value;
    return copyWith(metadata: updatedMetadata);
  }
}

// Enum for message types
enum MessageType {
  text,
  audio,
  image,
  file,
  aiResponse,
}
