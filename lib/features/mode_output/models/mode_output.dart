import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

import '../../threads/models/thread.dart';
import '../../modes/models/mode.dart';

part 'mode_output.mapper.dart';
part 'mode_output.g.dart';

@MappableClass()
@Collection()
class ModeOutput with ModeOutputMappable {
  final Id id;
  final DateTime createdAt;
  final String content;

  // Relationships
  final thread = IsarLink<Thread>();
  final mode = IsarLink<Mode>();

  ModeOutput({
    this.id = Isar.autoIncrement,
    required this.createdAt,
    required this.content,
  });

  /// Create a completed mode output with content
  ModeOutput.completed({
    this.id = Isar.autoIncrement,
    DateTime? createdAt,
    required this.content,
  }) : createdAt = createdAt ?? DateTime.now();
}
