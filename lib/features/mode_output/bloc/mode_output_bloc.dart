import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/shared/openai/openai.dart';
import 'dart:typed_data';

import '../models/mode_output.dart';
import '../../threads/models/thread.dart';
import '../../modes/models/mode.dart';
import '../../chat/models/message.dart';
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
    _loadOutputs(threadId, modeId);
    return const ModeOutputsState(isLoading: true);
  }

  /// Load all outputs for the thread and mode combination
  Future<void> _loadOutputs(int threadId, int modeId) async {
    try {
      final isar = ref.read(isarProvider);
      final outputs = await isar.modeOutputs
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .and()
          .mode((q) => q.idEqualTo(modeId))
          .sortByCreatedAt()
          .findAll();

      state = state.copyWith(
        outputs: outputs.toIList(),
        isLoading: false,
        currentIndex: outputs.isNotEmpty
            ? outputs.length - 1
            : 0, // Show latest by default
      );

      // Auto-generate if no outputs exist but thread has messages
      if (outputs.isEmpty) {
        await _checkAndAutoGenerate(threadId, isar);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  /// Check if thread has messages and auto-generate output if needed
  Future<void> _checkAndAutoGenerate(int threadId, Isar isar) async {
    try {
      // Don't auto-generate if we're already generating
      if (state.isGenerating) return;

      // Check if the thread has any messages
      final messageCount = await isar.messages
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .count();

      // If there are messages but no outputs, start generating
      if (messageCount > 0) {
        await generateOutput();
      }
    } catch (e) {
      // Silently handle errors in auto-generation check
      // The user can still manually trigger generation
    }
  }

  /// Get thread and mode data from database
  Future<({Thread thread, Mode mode})> _getThreadAndMode(
      int threadId, int modeId, Isar isar) async {
    final thread = await isar.threads.get(threadId);
    final mode = await isar.modes.get(modeId);

    if (thread == null || mode == null) {
      throw Exception('Thread or Mode not found');
    }

    return (thread: thread, mode: mode);
  }

  /// Convert messages from thread to content parts for OpenAI
  Future<List<ContentPart>> _getContentPartsFromMessages(
      int threadId, Isar isar) async {
    final messages = await isar.messages
        .filter()
        .thread((q) => q.idEqualTo(threadId))
        .sortByTimestamp()
        .findAll();

    final contentParts = <ContentPart>[];

    for (final message in messages) {
      // Add text content if present
      if (message.text.isNotEmpty) {
        contentParts.add(TextPart(message.text));
      }

      // Add transcript if audio message has transcript
      if (message.type == MessageType.audio &&
          message.transcript != null &&
          message.transcript!.isNotEmpty) {
        contentParts.add(TextPart('Transcribed audio: ${message.transcript!}'));
      }

      // Add image data if present
      if (message.type == MessageType.image && message.fileData != null) {
        try {
          final imageBytes = Uint8List.fromList(message.fileData!);
          final mimeType = message.mimeType ?? 'image/jpeg';
          contentParts.add(ImagePart(imageBytes, mimeType));
        } catch (e) {
          // If image processing fails, add description instead
          if (message.description.isNotEmpty) {
            contentParts
                .add(TextPart('Image description: ${message.description}'));
          }
        }
      }

      // Add audio data if present
      if (message.type == MessageType.audio && message.fileData != null) {
        try {
          final audioBytes = Uint8List.fromList(message.fileData!);
          final mimeType = message.mimeType ?? 'audio/wav';
          contentParts.add(AudioPart(audioBytes, mimeType));
        } catch (e) {
          // If audio processing fails, just use transcript or description
          final fallbackText = message.transcript?.isNotEmpty == true
              ? message.transcript!
              : message.description.isNotEmpty
                  ? 'Audio description: ${message.description}'
                  : 'Audio content (processing failed)';
          contentParts.add(TextPart(fallbackText));
        }
      }
    }

    // If no content parts, add a default message
    if (contentParts.isEmpty) {
      contentParts.add(TextPart('Generate content for this thread.'));
    }

    return contentParts;
  }

  /// Perform OpenAI generation with streaming
  Future<String> _performGeneration(
      String systemPrompt, List<ContentPart> contentParts) async {
    final openAI = ref.watch(openAIUtilProvider);

    String finalContent = '';
    await for (final content
        in openAI.generateStream(systemPrompt, contentParts)) {
      finalContent = content;
      _updateStreamingContent(content);
    }

    return finalContent;
  }

  /// Generate a new output for the current thread and mode
  Future<void> generateOutput({String? customPrompt}) async {
    final threadId = _threadId!;
    final modeId = _modeId!;

    try {
      final isar = ref.read(isarProvider);

      // Get the thread and mode
      final (:thread, :mode) = await _getThreadAndMode(threadId, modeId, isar);

      // Get content parts from messages
      final contentParts = await _getContentPartsFromMessages(threadId, isar);

      // Create a placeholder output for streaming
      final placeholderOutput = ModeOutput.completed(content: '');

      // Save placeholder to database and link relationships
      await isar.writeTxn(() async {
        await isar.modeOutputs.put(placeholderOutput);
        placeholderOutput.thread.value = thread;
        placeholderOutput.mode.value = mode;
        await placeholderOutput.thread.save();
        await placeholderOutput.mode.save();
      });

      // Reload outputs to include the new placeholder
      await _loadOutputs(threadId, modeId);

      // Find the index of the new output
      final newOutputIndex = state.outputs.length - 1;

      // Start streaming
      _startStreaming(newOutputIndex);

      // Generate content with streaming
      final systemPrompt = customPrompt ?? mode.prompt;
      final finalContent = await _performGeneration(systemPrompt, contentParts);

      // Complete streaming and save final content
      await _completeStreaming(finalContent, placeholderOutput, isar);
    } catch (e) {
      // Stop streaming on error and let the caller handle errors
      _stopStreaming();
      rethrow;
    }
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
    if (state.isGenerating) {
      state = state.copyWith(streamingContent: content);
    }
  }

  /// Complete streaming and save final content
  Future<void> _completeStreaming(
      String finalContent, ModeOutput placeholder, Isar isar) async {
    // Create a new output with the final content
    final completedOutput = ModeOutput.completed(
      content: finalContent,
    );

    // Copy relationships from placeholder
    completedOutput.thread.value = placeholder.thread.value;
    completedOutput.mode.value = placeholder.mode.value;

    await isar.writeTxn(() async {
      // Delete the placeholder and save the completed output
      await isar.modeOutputs.delete(placeholder.id);
      await isar.modeOutputs.put(completedOutput);
      await completedOutput.thread.save();
      await completedOutput.mode.save();
    });

    // Stop streaming and reload to get updated state
    _stopStreaming();
    await _loadOutputs(_threadId!, _modeId!);
  }

  /// Stop streaming
  void _stopStreaming() {
    state = state.copyWith(
      isGenerating: false,
      streamingContent: null,
      streamingIndex: null,
    );
  }

  /// Regenerate the current output
  Future<void> regenerateCurrentOutput() async {
    final currentOutput = state.currentOutput;
    if (currentOutput == null) return;

    // If we're already generating, don't start another generation
    if (state.isGenerating) return;

    final threadId = _threadId!;
    final modeId = _modeId!;
    final currentIndex = state.currentIndex;

    try {
      final isar = ref.read(isarProvider);

      // Get the thread and mode
      final (:thread, :mode) = await _getThreadAndMode(threadId, modeId, isar);

      // Get content parts from messages
      final contentParts = await _getContentPartsFromMessages(threadId, isar);

      // Start streaming for the current output (don't create a new one)
      _startStreaming(currentIndex);

      // Generate content with streaming
      final finalContent = await _performGeneration(mode.prompt, contentParts);

      // Create new output with the regenerated content
      final newOutput = ModeOutput.completed(content: finalContent);

      // Copy relationships from current output
      newOutput.thread.value = currentOutput.thread.value;
      newOutput.mode.value = currentOutput.mode.value;

      await isar.writeTxn(() async {
        // Delete the old output and save the new one atomically
        await isar.modeOutputs.delete(currentOutput.id);
        await isar.modeOutputs.put(newOutput);
        await newOutput.thread.save();
        await newOutput.mode.save();
      });

      // Stop streaming and reload to get updated state, but maintain the same index
      _stopStreaming();

      // Reload outputs but preserve the current index position
      final outputs = await isar.modeOutputs
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .and()
          .mode((q) => q.idEqualTo(modeId))
          .sortByCreatedAt()
          .findAll();

      state = state.copyWith(
        outputs: outputs.toIList(),
        currentIndex: currentIndex.clamp(0, outputs.length - 1),
      );
    } catch (e) {
      // Stop streaming on error and let the caller handle errors
      _stopStreaming();
      rethrow;
    }
  }

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
    final currentOutput = state.currentOutput;
    if (currentOutput == null || state.outputs.length <= 1) return;

    try {
      final isar = ref.read(isarProvider);

      await isar.writeTxn(() async {
        await isar.modeOutputs.delete(currentOutput.id);
      });

      // Remove from state and adjust current index
      final updatedOutputs = state.outputs.removeAt(state.currentIndex);
      final newIndex = state.currentIndex >= updatedOutputs.length
          ? updatedOutputs.length - 1
          : state.currentIndex;

      state = state.copyWith(
        outputs: updatedOutputs,
        currentIndex: newIndex.clamp(0, updatedOutputs.length - 1),
      );
    } catch (e) {
      // Let errors bubble up to be handled at a higher level
      rethrow;
    }
  }
}
