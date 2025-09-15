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
  final bool isDefault;

  const Mode({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.prompt,
    this.isDefault = false,
  });

  /// Create a default spec mode
  factory Mode.spec() {
    return const Mode(
      name: 'Spec Mode',
      prompt:
          'Generate a comprehensive specification based on the input provided.',
      isDefault: true,
    );
  }

  /// Create a default code context mode
  factory Mode.codeContext() {
    return const Mode(
      name: 'Code Context',
      prompt:
          'Create detailed code context documentation from the provided input.',
      isDefault: true,
    );
  }

  /// Create a custom user-defined mode
  factory Mode.custom({required String name, required String prompt}) {
    return Mode(
      name: name,
      prompt: prompt,
      isDefault: false,
    );
  }

  /// Check if this mode can be edited
  bool get isEditable {
    return !isDefault;
  }
}
