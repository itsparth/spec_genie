import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'mode.mapper.dart';
part 'mode.g.dart';

@MappableClass()
@Collection()
class Mode with ModeMappable {
  final Id id;
  final String name;
  final String prompt;
  final bool isEditable;

  const Mode({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.prompt,
    this.isEditable = true,
  });
}
