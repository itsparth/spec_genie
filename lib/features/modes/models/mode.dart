import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectbox/objectbox.dart';

import '../../mode_output/models/mode_output.dart';

part 'mode.mapper.dart';

@MappableClass()
@Entity()
class Mode with ModeMappable {
  @Id()
  int id;
  final String name;
  final String prompt;
  final bool isEditable;

  @Backlink('mode')
  final ToMany<ModeOutput> modeOutputs = ToMany<ModeOutput>();

  Mode({
    this.id = 0,
    required this.name,
    required this.prompt,
    this.isEditable = true,
  });
}
