import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import '../models/thread.dart';
import '../../shared/isar/isar_provider.dart';

part 'threads_bloc.g.dart';

@riverpod
class ThreadsBloc extends _$ThreadsBloc {
  @override
  List<Thread> build() {
    final isar = ref.read(isarProvider);
    final threads = isar.threads.where().sortByCreatedAtDesc().findAllSync();
    return threads;
  }

  Future<Thread> addThread(String name) async {
    final isar = ref.read(isarProvider);
    final newThread = Thread(
      name: name,
      createdAt: DateTime.now(),
    );

    late Thread savedThread;
    await isar.writeTxn(() async {
      final id = await isar.threads.put(newThread);
      savedThread = await isar.threads.get(id) ?? newThread;
    });

    // Update state with the new thread
    state = [...state, savedThread];
    return savedThread;
  }

  Future<void> updateThread(int id, String name) async {
    final isar = ref.read(isarProvider);
    final existingThread = isar.threads.getSync(id);

    if (existingThread != null) {
      final updatedThread = Thread(
        id: existingThread.id,
        name: name,
        createdAt: existingThread.createdAt,
      );

      await isar.writeTxn(() async {
        await isar.threads.put(updatedThread);
      });

      // Update state
      state = state.map((thread) {
        if (thread.id == id) {
          return updatedThread;
        }
        return thread;
      }).toList();
    }
  }

  Future<void> deleteThread(int id) async {
    final isar = ref.read(isarProvider);

    await isar.writeTxn(() async {
      await isar.threads.delete(id);
    });

    // Update state
    state = state.where((thread) => thread.id != id).toList();
  }

  /// Reload threads from database
  void reload() {
    final isar = ref.read(isarProvider);
    final threads = isar.threads.where().sortByCreatedAtDesc().findAllSync();
    state = threads;
  }
}
