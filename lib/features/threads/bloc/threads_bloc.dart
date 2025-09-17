import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/thread.dart';

part 'threads_bloc.g.dart';

@riverpod
class ThreadsBloc extends _$ThreadsBloc {
  @override
  List<Thread> build() {
    // Return sample data for testing
    // TODO: Load from Isar database when integrated
    return [
      Thread(
        id: 1,
        name: 'Flutter UI Design Discussion',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Thread(
        id: 2,
        name: 'Backend API Integration',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Thread(
        id: 3,
        name: 'Performance Optimization Ideas',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      Thread(
        id: 4,
        name: '', // Test empty name
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }

  void addThread(String name) {
    final newThread = Thread(
      id: state.length + 1,
      name: name,
      createdAt: DateTime.now(),
    );
    state = [...state, newThread];
  }

  void updateThread(int id, String name) {
    state = state.map((thread) {
      if (thread.id == id) {
        return Thread(
          id: thread.id,
          name: name,
          createdAt: thread.createdAt,
        );
      }
      return thread;
    }).toList();
  }

  void deleteThread(int id) {
    state = state.where((thread) => thread.id != id).toList();
  }
}
