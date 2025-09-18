import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:objectbox/objectbox.dart';
import '../models/thread.dart';
import '../../shared/objectbox/objectbox_provider.dart';
import '../../../objectbox.g.dart';

part 'threads_bloc.g.dart';

@riverpod
class ThreadsBloc extends _$ThreadsBloc {
  @override
  List<Thread> build() {
    final store = ref.read(storeProvider);
    final box = store.box<Thread>();
    final query = box.query();
    query.order(Thread_.createdAt, flags: Order.descending);
    final queryBuilder = query.build();
    final threads = queryBuilder.find();
    queryBuilder.close();
    return threads;
  }

  Future<Thread> addThread(String name) async {
    final store = ref.read(storeProvider);
    final box = store.box<Thread>();
    final newThread = Thread(
      name: name,
      createdAt: DateTime.now(),
    );

    final id = box.put(newThread);
    final savedThread = box.get(id)!;

    // Update state with the new thread
    state = [...state, savedThread];
    return savedThread;
  }

  Future<void> updateThread(int id, String name) async {
    final store = ref.read(storeProvider);
    final box = store.box<Thread>();
    final existingThread = box.get(id);

    if (existingThread != null) {
      final updatedThread = Thread(
        id: existingThread.id,
        name: name,
        createdAt: existingThread.createdAt,
      );

      box.put(updatedThread);

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
    final store = ref.read(storeProvider);
    final box = store.box<Thread>();

    box.remove(id);

    // Update state
    state = state.where((thread) => thread.id != id).toList();
  }

  /// Reload threads from database
  void reload() {
    final store = ref.read(storeProvider);
    final box = store.box<Thread>();
    final query = box.query();
    query.order(Thread_.createdAt, flags: Order.descending);
    final queryBuilder = query.build();
    final threads = queryBuilder.find();
    queryBuilder.close();
    state = threads;
  }
}
