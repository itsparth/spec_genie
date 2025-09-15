import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/thread.dart';

part 'threads_bloc.g.dart';

@riverpod
class ThreadsBloc extends _$ThreadsBloc {
  @override
  List<Thread> build() {
    // Return empty list for now
    // TODO: Load from Isar database when integrated
    return [];
  }

  /// Create a new thread
  void createThread({String? name}) {
    final thread = Thread.create(name: name);
    state = [...state, thread];
  }

  /// Delete a thread
  void deleteThread(int threadId) {
    state = state.where((thread) => thread.id != threadId).toList();
  }

  /// Update thread name
  void updateThreadName(int threadId, String newName) {
    state = state.map((thread) {
      if (thread.id == threadId) {
        return Thread(
          id: thread.id,
          name: newName,
          createdAt: thread.createdAt,
          messageCount: thread.messageCount,
        );
      }
      return thread;
    }).toList();
  }

  /// Update message count for a thread
  void updateMessageCount(int threadId, int messageCount) {
    state = state.map((thread) {
      if (thread.id == threadId) {
        return thread.copyWithMessageCount(messageCount);
      }
      return thread;
    }).toList();
  }

  /// Get thread by ID
  Thread? getThreadById(int threadId) {
    try {
      return state.firstWhere((thread) => thread.id == threadId);
    } catch (e) {
      return null;
    }
  }

  /// Sort threads by creation date (newest first)
  void sortByDateDescending() {
    state = [...state]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Sort threads by name
  void sortByName() {
    state = [...state]..sort((a, b) => a.name.compareTo(b.name));
  }

  /// Sort threads by message count (most active first)
  void sortByMessageCount() {
    state = [...state]
      ..sort((a, b) => b.messageCount.compareTo(a.messageCount));
  }
}
