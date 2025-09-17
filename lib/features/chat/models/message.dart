import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

import '../../threads/models/thread.dart';
import '../../tags/models/tag.dart';

part 'message.mapper.dart';
part 'message.g.dart';

@MappableClass()
@Collection()
class Message with MessageMappable {
  Id id;
  final String text;
  final DateTime timestamp;
  @Enumerated(EnumType.name)
  final MessageType type;
  final String description;
  final List<int>? fileData;
  final String? mimeType;
  final String? transcript;
  final String? fileName;

  final thread = IsarLink<Thread>();
  final tags = IsarLinks<Tag>();

  Message({
    this.id = Isar.autoIncrement,
    this.text = '',
    required this.timestamp,
    this.type = MessageType.text,
    this.description = '',
    this.fileData,
    this.mimeType,
    this.transcript,
    this.fileName,
  });
}

@MappableEnum()
enum MessageType {
  text,
  audio,
  image,
}
