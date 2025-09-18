import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spec_genie/database/repositories/threads_repository.dart';
import 'package:spec_genie/database/database.dart';

part 'threads_bloc.g.dart';

@riverpod
class ThreadsBloc extends _$ThreadsBloc {
  StreamSubscription<List<ThreadRow>>? _sub;

  @override
  List<ThreadRow> build() {
    // Subscribe to drift thread stream
    final repo = ref.read(threadsRepositoryProvider);
    _sub = repo.watchAll().listen((rows) {
      state = rows;
    });
    ref.onDispose(() => _sub?.cancel());
    return const [];
  }

  Future<int> addThread(String name) async {
    final repo = ref.read(threadsRepositoryProvider);
    return repo.createThread(name: name, createdAt: DateTime.now());
  }

  Future<void> updateThread(int id, String name) async {
    final repo = ref.read(threadsRepositoryProvider);
    await repo.rename(id, name);
  }

  Future<void> deleteThread(int id) async {
    final repo = ref.read(threadsRepositoryProvider);
    await repo.delete(id);
  }

  /// Manual refresh (restarts subscription)
  Future<void> reload() async {
    await _sub?.cancel();
    final repo = ref.read(threadsRepositoryProvider);
    _sub = repo.watchAll().listen((rows) => state = rows);
  }
}
