import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'tag.mapper.dart';
part 'tag.g.dart';

@MappableClass()
@Collection()
class Tag with TagMappable {
  final Id id;
  final String name;
  final String description;
  final bool isEditable;

  const Tag({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.description,
    this.isEditable = true,
  });
}