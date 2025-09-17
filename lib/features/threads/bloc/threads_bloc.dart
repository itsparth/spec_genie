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
}
