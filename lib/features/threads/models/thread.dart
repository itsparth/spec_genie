import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectbox/objectbox.dart';

import '../../chat/models/message.dart';
import '../../mode_output/models/mode_output.dart';

part 'thread.mapper.dart';

@MappableClass()
@Entity()
class Thread with ThreadMappable {
  @Id()
  int id;
  final String name;
  @Property(type: PropertyType.date)
  final DateTime createdAt;

  @Backlink('thread')
  final ToMany<Message> messages = ToMany<Message>();

  @Backlink('thread')
  final ToMany<ModeOutput> modeOutputs = ToMany<ModeOutput>();

  Thread({
    this.id = 0,
    this.name = '',
    required this.createdAt,
  });
}
