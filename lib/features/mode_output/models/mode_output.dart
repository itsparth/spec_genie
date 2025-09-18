import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectbox/objectbox.dart';

import '../../threads/models/thread.dart';
import '../../modes/models/mode.dart';

part 'mode_output.mapper.dart';

@MappableClass()
@Entity()
class ModeOutput with ModeOutputMappable {
  @Id()
  int id;
  @Property(type: PropertyType.date)
  final DateTime createdAt;
  String content; // Made mutable to allow in-place updates

  // Relationships
  final ToOne<Thread> thread = ToOne<Thread>();
  final ToOne<Mode> mode = ToOne<Mode>();

  ModeOutput({
    this.id = 0,
    required this.createdAt,
    required this.content,
  });

  /// Create a completed mode output with content
  ModeOutput.completed({
    this.id = 0,
    DateTime? createdAt,
    required this.content,
  }) : createdAt = createdAt ?? DateTime.now();
}
