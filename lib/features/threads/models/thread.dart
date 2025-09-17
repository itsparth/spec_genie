import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

import '../../chat/models/message.dart';
import '../../mode_output/models/mode_output.dart';

part 'thread.mapper.dart';
part 'thread.g.dart';

@MappableClass()
@Collection()
class Thread with ThreadMappable {
  Id id;
  final String name;
  final DateTime createdAt;

  @Backlink(to: 'thread')
  final messages = IsarLinks<Message>();

  @Backlink(to: 'thread')
  final modeOutputs = IsarLinks<ModeOutput>();

  Thread({
    this.id = Isar.autoIncrement,
    this.name = '',
    required this.createdAt,
  });
}
