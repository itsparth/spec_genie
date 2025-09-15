import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'thread.mapper.dart';
part 'thread.g.dart';

@MappableClass()
@Collection()
class Thread with ThreadMappable {
  final Id id;
  final String name;
  final DateTime createdAt;
  final int messageCount;

  const Thread({
    this.id = Isar.autoIncrement,
    this.name = '',
    required this.createdAt,
    this.messageCount = 0,
  });

  /// Create a new thread with auto-generated name
  factory Thread.create({String? name}) {
    return Thread(
      name: name ?? '',
      createdAt: DateTime.now(),
    );
  }

  /// Update message count
  Thread copyWithMessageCount(int count) {
    return Thread(
      id: id,
      name: name,
      createdAt: createdAt,
      messageCount: count,
    );
  }

  /// Check if thread has a custom name (not auto-generated)
  bool get hasCustomName {
    return name.isNotEmpty;
  }
}
