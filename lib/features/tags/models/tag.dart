import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

import '../../chat/models/message.dart';

part 'tag.mapper.dart';
part 'tag.g.dart';

@MappableClass()
@Collection()
class Tag with TagMappable {
  Id id;
  final String name;
  final String description;
  final bool isEditable;

  @Backlink(to: 'tags')
  final messages = IsarLinks<Message>();

  Tag({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.description,
    this.isEditable = true,
  });
}