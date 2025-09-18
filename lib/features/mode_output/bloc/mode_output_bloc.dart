import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/openai/openai.dart';
import 'package:spec_genie/database/database.dart';
import 'package:spec_genie/database/drift_database_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/drift.dart' show Value;
import 'dart:typed_data';
import 'mode_outputs_state.dart';

part 'mode_output_bloc.g.dart';

/// Manages mode outputs for a specific thread and mode combination
@riverpod
class ModeOutputBloc extends _$ModeOutputBloc {
  int? _threadId;
  int? _modeId;

  @override
  ModeOutputsState build(int threadId, int modeId) {
    _threadId = threadId;
    _modeId = modeId;
    _load(threadId, modeId);
    return const ModeOutputsState(isLoading: true);
  }

  Future<void> _load(int threadId, int modeId) async {
    final adb = ref.read(driftDatabaseProvider);
    final outputs = await (adb.select(adb.modeOutputs)
          ..where((o) => o.threadId.equals(threadId) & o.modeId.equals(modeId))
          ..orderBy([(o) => OrderingTerm(expression: o.createdAt)]))
        .get();
    final mode = await (adb.select(adb.modes)
          ..where((m) => m.id.equals(modeId)))
        .getSingleOrNull();
    state = state.copyWith(
      outputs: outputs.toIList(),
      currentMode: mode,
      isLoading: false,
      currentIndex: outputs.isNotEmpty ? outputs.length - 1 : 0,
    );
    if (outputs.isEmpty) {
      generateOutput();
    }
  }

  Future<List<ContentPart>> _contentParts(int threadId) async {
    final adb = ref.read(driftDatabaseProvider);
    final msgs = await (adb.select(adb.messages)
          ..where((m) => m.threadId.equals(threadId))
          ..orderBy([(m) => OrderingTerm(expression: m.timestamp)]))
        .get();
    final parts = <ContentPart>[];
    for (final m in msgs) {
      final contextSegments = <String>[];
      if (m.description.isNotEmpty) {
        contextSegments.add('Description: ${m.description}');
      }
      final context =
          contextSegments.isNotEmpty ? '${contextSegments.join(' | ')}\n' : '';
      if (m.body.isNotEmpty) {
        parts.add(TextPart(context.isNotEmpty ? '$context${m.body}' : m.body));
      }
      if (m.transcript?.isNotEmpty == true) {
        parts.add(TextPart(context.isNotEmpty
            ? '${context}Transcribed audio: ${m.transcript!}'
            : 'Transcribed audio: ${m.transcript!}'));
      }
      if (m.messageType == 'image' && m.fileData != null) {
        parts.add(ImagePart(
            Uint8List.fromList(m.fileData!), m.mimeType ?? 'image/jpeg'));
      }
      if (m.messageType == 'audio' && m.fileData != null) {
        parts.add(AudioPart(
            Uint8List.fromList(m.fileData!), m.mimeType ?? 'audio/wav'));
      }
    }
    if (parts.isEmpty) parts.add(TextPart('Generate content for this thread.'));
    return parts;
  }

  Future<String> _streamGenerate(
      String systemPrompt, List<ContentPart> parts) async {
    final openAI = ref.watch(openAIUtilProvider);
    String finalContent = '';
    await for (final content in openAI.generateStream(systemPrompt, parts)) {
      finalContent = content;
      _updateStreamingContent(content);
    }
    return finalContent;
  }

  Future<void> generateOutput({String? customPrompt}) async {
    if (state.isGenerating) return;
    final threadId = _threadId!;
    final modeId = _modeId!;
    final adb = ref.read(driftDatabaseProvider);
    final mode = await (adb.select(adb.modes)
          ..where((m) => m.id.equals(modeId)))
        .getSingle();

    final placeholderId =
        await adb.into(adb.modeOutputs).insert(ModeOutputsCompanion.insert(
              threadId: threadId,
              modeId: modeId,
              createdAt: DateTime.now(),
              content: '',
            ));
    await _load(threadId, modeId);
    _startStreaming(state.outputs.length - 1);
    final parts = await _contentParts(threadId);
    final systemPrompt = customPrompt ??
        "Generate markdown and follow the instructions: \n${mode.prompt}";
    final finalContent = await _streamGenerate(systemPrompt, parts);
    await (adb.update(adb.modeOutputs)
          ..where((o) => o.id.equals(placeholderId)))
        .write(
      ModeOutputsCompanion(content: Value(finalContent)),
    );
    _stopStreaming();
    await _load(threadId, modeId);
  }

  /// Start streaming for a specific output index
  void _startStreaming(int outputIndex) {
    state = state.copyWith(
      isGenerating: true,
      streamingIndex: outputIndex,
      streamingContent: '',
      currentIndex: outputIndex,
    );
  }

  /// Update the streaming content
  void _updateStreamingContent(String content) {
    if (state.isGenerating && state.streamingIndex != null) {
      state = state.copyWith(streamingContent: content);
      // Optimistic live update: replace content in list
      if (state.streamingIndex! < state.outputs.length) {
        final updated = state.outputs.replace(
          state.streamingIndex!,
          state.outputs[state.streamingIndex!].copyWith(content: content),
        );
        state = state.copyWith(outputs: updated);
      }
    }
  }

  /// Complete streaming and save final content
  // Drift version handled inline in generateOutput

  /// Complete streaming for regenerated output and save to database
  // Regenerate simplified for Drift implementation

  /// Stop streaming
  void _stopStreaming() {
    state = state.copyWith(
      isGenerating: false,
      streamingContent: null,
      streamingIndex: null,
    );
  }

  /// Regenerate by creating a new output (doesn't replace current one)
  Future<void> regenerateCurrentOutput() async => generateOutput();

  /// Navigate to the previous output
  void goToPreviousOutput() {
    if (state.canGoBack) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  /// Navigate to the next output
  void goToNextOutput() {
    if (state.canGoForward) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  /// Navigate to a specific output by index
  void goToOutput(int index) {
    if (index >= 0 && index < state.outputs.length) {
      state = state.copyWith(currentIndex: index);
    }
  }

  /// Delete the current output
  Future<void> deleteCurrentOutput() async {
    final current = state.currentOutput;
    if (current == null || state.outputs.length <= 1) return;
    final adb = ref.read(driftDatabaseProvider);
    await (adb.delete(adb.modeOutputs)..where((o) => o.id.equals(current.id)))
        .go();
    await _load(_threadId!, _modeId!);
  }
}
