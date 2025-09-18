import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectbox/objectbox.dart';

import '../../threads/models/thread.dart';
import '../../tags/models/tag.dart';

part 'message.mapper.dart';

@MappableClass()
@Entity()
class Message with MessageMappable {
  @Id()
  int id;
  final String text;
  @Property(type: PropertyType.date)
  final DateTime timestamp;
  final int type; // Use int instead of enum for ObjectBox
  final String description;
  final List<int>? fileData;
  final String? mimeType;
  final String? transcript;
  final String? fileName;

  final ToOne<Thread> thread = ToOne<Thread>();
  final ToMany<Tag> tags = ToMany<Tag>();

  Message({
    this.id = 0,
    this.text = '',
    required this.timestamp,
    this.type = 0, // Default to text (index 0)
    this.description = '',
    this.fileData,
    this.mimeType,
    this.transcript,
    this.fileName,
  });

  // Factory constructor that takes enum
  Message.fromType({
    int id = 0,
    String text = '',
    required DateTime timestamp,
    MessageType messageType = MessageType.text,
    String description = '',
    List<int>? fileData,
    String? mimeType,
    String? transcript,
    String? fileName,
  }) : this(
          id: id,
          text: text,
          timestamp: timestamp,
          type: messageType.index,
          description: description,
          fileData: fileData,
          mimeType: mimeType,
          transcript: transcript,
          fileName: fileName,
        );

  // Helper getter to convert int back to enum
  MessageType get messageType => MessageType.values[type];
}

@MappableEnum()
enum MessageType {
  text,
  audio,
  image,
}
