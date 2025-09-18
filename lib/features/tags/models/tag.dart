import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectbox/objectbox.dart';

import '../../chat/models/message.dart';

part 'tag.mapper.dart';

@MappableClass()
@Entity()
class Tag with TagMappable {
  @Id()
  int id;
  final String name;
  final String description;
  final bool isEditable;

  @Backlink('tags')
  final ToMany<Message> messages = ToMany<Message>();

  Tag({
    this.id = 0,
    required this.name,
    required this.description,
    this.isEditable = true,
  });
}
