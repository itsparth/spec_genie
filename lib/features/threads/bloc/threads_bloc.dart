import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../shared/isar/isar_provider.dart';
import '../data/threads_repository.dart';
import 'threads_state.dart';
import '../models/thread.dart';
import '../../mode_output/data/mode_outputs_repository.dart';

part 'threads_bloc.g.dart';

@riverpod
class ThreadsBloc extends _$ThreadsBloc {
  @override
  ThreadsState build() {
    final repository = ThreadsRepository(ref.read(isarProvider));
    state = const ThreadsState(isLoading: true, threadItems: []);
    final modeOutputsRepo = ref.read(modeOutputsRepositoryProvider);
    final sub = repository.watchAllThreads().listen((threads) {
      // Start with placeholders (latestMode null) then enrich asynchronously
      final baseItems = threads
          .map((t) => ThreadItemState(thread: t, latestMode: null))
          .toList();
      state = ThreadsState(
        isLoading: false,
        threads: threads,
        threadItems: baseItems,
        deletingIds: state.deletingIds,
      );
      // Enrich asynchronously (fire and forget)
      Future(() async {
        final enriched = <ThreadItemState>[];
        for (final t in threads) {
          final latestMode =
              await modeOutputsRepo.getLatestUsedModeForThread(t.id);
          enriched.add(ThreadItemState(thread: t, latestMode: latestMode));
        }
        state = state.copyWith(threadItems: enriched, threads: threads);
      });
    }, onError: (Object e) {
      state = ThreadsState(
        isLoading: false,
        threads: const [],
        threadItems: const [],
        error: e,
        deletingIds: state.deletingIds,
      );
    });
    ref.onDispose(sub.cancel);
    // Provide initial synchronous snapshot while stream sets up
    try {
      final initial = repository.getAllThreadsSync();
      final baseItems = initial
          .map((t) => ThreadItemState(thread: t, latestMode: null))
          .toList();
      // Kick off enrichment async
      Future(() async {
        final enriched = <ThreadItemState>[];
        for (final t in initial) {
          final latestMode =
              await modeOutputsRepo.getLatestUsedModeForThread(t.id);
          enriched.add(ThreadItemState(thread: t, latestMode: latestMode));
        }
        state = state.copyWith(threadItems: enriched);
      });
      return ThreadsState(
        isLoading: false,
        threads: initial,
        threadItems: baseItems,
        deletingIds: state.deletingIds,
      );
    } catch (e) {
      return ThreadsState(
        isLoading: false,
        threads: const [],
        threadItems: const [],
        error: e,
        deletingIds: state.deletingIds,
      );
    }
  }

  Future<Thread> addThread(String name) async {
    final repository = ThreadsRepository(ref.read(isarProvider));
    return repository.addThread(name);
  }

  Future<void> updateThread(int id, String name) async {
    final repository = ThreadsRepository(ref.read(isarProvider));
    await repository.updateThread(id, name);
  }

  Future<void> deleteThread(int id) async {
    final repository = ThreadsRepository(ref.read(isarProvider));
    // Mark as deleting
    state = state.copyWith(
      deletingIds: {...state.deletingIds, id},
    );
    try {
      await repository.deleteThreadCascade(id);
    } catch (e) {
      // Remove id from deleting set and surface error (keeping threads list)
      final newSet = {...state.deletingIds}..remove(id);
      state = state.copyWith(
        deletingIds: newSet,
        error: e,
      );
    }
  }

  Future<void> reload() async {
    final repository = ThreadsRepository(ref.read(isarProvider));
    state = state.copyWith(
      isLoading: true,
      error: null,
    );
    try {
      final fresh = repository.getAllThreadsSync();
      final modeOutputsRepo = ref.read(modeOutputsRepositoryProvider);
      final items = <ThreadItemState>[];
      for (final t in fresh) {
        final latestMode =
            await modeOutputsRepo.getLatestUsedModeForThread(t.id);
        items.add(ThreadItemState(thread: t, latestMode: latestMode));
      }
      state = state.copyWith(
        isLoading: false,
        threads: fresh,
        threadItems: items,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        threads: const [],
        threadItems: const [],
        error: e,
      );
    }
  }
}
