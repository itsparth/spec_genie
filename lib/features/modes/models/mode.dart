import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

import '../../mode_output/models/mode_output.dart';

part 'mode.mapper.dart';
part 'mode.g.dart';

@MappableClass()
@Collection()
class Mode with ModeMappable {
  final Id id;
  final String name;
  final String prompt;
  final bool isEditable;

  @Backlink(to: 'mode')
  final modeOutputs = IsarLinks<ModeOutput>();

  Mode({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.prompt,
    this.isEditable = true,
  });
}
