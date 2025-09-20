import 'package:dart_mappable/dart_mappable.dart';
import '../models/thread.dart';
import '../../modes/models/mode.dart';

part 'threads_state.mapper.dart';

@MappableClass()
class ThreadItemState with ThreadItemStateMappable {
  final Thread thread;
  final Mode? latestMode; // mode associated with most recent output

  const ThreadItemState({required this.thread, this.latestMode});
}

/// Represents the UI state for threads list.
@MappableClass()
class ThreadsState with ThreadsStateMappable {
  final bool isLoading;
  final List<Thread> threads; // raw threads kept for backward compatibility
  final List<ThreadItemState> threadItems; // enriched thread state
  final Object? error; // nullable error
  final Set<int> deletingIds; // ids currently deleting

  const ThreadsState({
    this.isLoading = false,
    this.threads = const [],
    this.threadItems = const [],
    this.error,
    this.deletingIds = const {},
  });
}
