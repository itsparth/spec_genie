import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:drift/drift.dart' show Value;
import 'package:spec_genie/database/repositories/modes_repository.dart';
import 'package:spec_genie/database/database.dart';
import 'mode_state.dart';

part 'modes_bloc.g.dart';

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Load existing modes from Isar on build.
///  - Insert a default (non-editable) mode if database empty.
///  - CRUD operations for editable modes only.
///  - (Selection removed per current requirements)
@riverpod
class ModesBloc extends _$ModesBloc {
  static const _defaultModes = [
    (
      'Spec',
      'Generate well-organized specifications with clear structure, requirements, acceptance criteria, and user stories. Focus on clarity, completeness, and actionable details.'
    ),
    (
      'Tech Spec',
      'Create detailed technical specifications including architecture decisions, implementation details, API designs, database schemas, and technical requirements. Focus on technical depth and engineering considerations.'
    ),
    (
      'Podcast',
      'Generate engaging podcast content including episode outlines, talking points, interview questions, and show notes. Focus on conversational flow, audience engagement, and compelling storytelling.'
    ),
    (
      'Summary',
      'Generate concise, well-structured summaries of content. Extract key points, main ideas, and essential information while maintaining clarity and brevity. Focus on capturing the essence without losing important details.'
    ),
    (
      'Transcript',
      'Generate accurate, verbatim transcripts of audio/video content. Maintain speaker identification, timestamps where relevant, and preserve the exact spoken words including natural speech patterns, pauses, and corrections.'
    ),
  ];

  @override
  ModeState build() {
    final repo = ref.read(modesRepositoryProvider);
    repo.watchAll().listen((rows) {
      state = state.copyWith(modes: rows.toIList());
    });
    _seedDefaultsIfEmpty();
    return ModeState.empty;
  }

  Future<void> _seedDefaultsIfEmpty() async {
    final repo = ref.read(modesRepositoryProvider);
    final adb = repo.db as AppDatabase;
    final existing = await (adb.select(adb.modes)).get();
    if (existing.isEmpty) {
      for (final (name, prompt) in _defaultModes) {
        await adb.into(adb.modes).insert(ModesCompanion.insert(
              name: name,
              prompt: prompt,
              isEditable: const Value(false),
            ));
      }
    }
  }

  Future<void> create({required String name, required String prompt}) async {
    state = state.copyWith(isSaving: true);
    try {
      final adb = (ref.read(modesRepositoryProvider).db as AppDatabase);
      await adb.into(adb.modes).insert(ModesCompanion.insert(
            name: name,
            prompt: prompt,
            isEditable: const Value(true),
          ));
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<bool> update(int id, {String? name, String? prompt}) async {
    state = state.copyWith(isSaving: true);
    try {
      final adb = (ref.read(modesRepositoryProvider).db as AppDatabase);
      await (adb.update(adb.modes)..where((m) => m.id.equals(id))).write(
        ModesCompanion(
          name: name != null ? Value(name) : const Value.absent(),
          prompt: prompt != null ? Value(prompt) : const Value.absent(),
        ),
      );
      return true;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<bool> remove(int id) async {
    state = state.copyWith(isSaving: true);
    try {
      final adb = (ref.read(modesRepositoryProvider).db as AppDatabase);
      await (adb.delete(adb.modes)..where((m) => m.id.equals(id))).go();
      return true;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> reload() async {/* Stream handles updates */}
}
