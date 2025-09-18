import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/objectbox/objectbox_provider.dart';
import 'package:spec_genie/features/shared/openai/openai.dart';
import 'package:spec_genie/objectbox.g.dart';
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
      final store = ref.read(storeProvider);
      final modeBox = store.box<Mode>();
      final modeOutputBox = store.box<ModeOutput>();

      // Load the mode first
      final mode = modeBox.get(modeId);

      final outputs = modeOutputBox
          .query(ModeOutput_.thread
              .equals(threadId)
              .and(ModeOutput_.mode.equals(modeId)))
          .order(ModeOutput_.createdAt)
          .build()
          .find();

      state = state.copyWith(
        outputs: outputs.toIList(),
        isLoading: false,
        currentIndex: outputs.isNotEmpty
            ? outputs.length - 1
            : 0, // Show latest by default
        currentMode: mode,
      );

      // If no outputs exist, automatically start generation
      if (outputs.isEmpty) {
        generateOutput();
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  /// Get thread and mode data from database
  Future<({Thread thread, Mode mode})> _getThreadAndMode(
      int threadId, int modeId, Store store) async {
    final threadBox = store.box<Thread>();
    final modeBox = store.box<Mode>();

    final thread = threadBox.get(threadId);
    final mode = modeBox.get(modeId);

    if (thread == null || mode == null) {
      throw Exception('Thread or Mode not found');
    }

    return (thread: thread, mode: mode);
  }

  /// Convert messages from thread to content parts for OpenAI
  Future<List<ContentPart>> _getContentPartsFromMessages(
      int threadId, Store store) async {
    final messageBox = store.box<Message>();
    final messages = messageBox
        .query(Message_.thread.equals(threadId))
        .order(Message_.timestamp)
        .build()
        .find();

    final contentParts = <ContentPart>[];

    for (final message in messages) {
      // Get tags for this message (ToMany relationship)
      final tags = message.tags.toList();

      // Build context string with tags and description
      final contextParts = <String>[];

      // Add tag information
      if (tags.isNotEmpty) {
        final tagDescriptions =
            tags.map((tag) => '${tag.name}: ${tag.description}').join(', ');
        contextParts.add('Tags: $tagDescriptions');
      }

      // Add message description if present
      if (message.description.isNotEmpty) {
        contextParts.add('Description: ${message.description}');
      }

      final contextText =
          contextParts.isNotEmpty ? '${contextParts.join(' | ')}\n' : '';

      // Add text content if present
      if (message.text.isNotEmpty) {
        final fullText = contextText.isNotEmpty
            ? '$contextText${message.text}'
            : message.text;
        contentParts.add(TextPart(fullText));
      }

      // Add transcript if audio message has transcript
      if (message.type == MessageType.audio &&
          message.transcript != null &&
          message.transcript!.isNotEmpty) {
        final transcriptText = contextText.isNotEmpty
            ? '${contextText}Transcribed audio: ${message.transcript!}'
            : 'Transcribed audio: ${message.transcript!}';
        contentParts.add(TextPart(transcriptText));
      }

      // Add image data if present
      if (message.type == MessageType.image && message.fileData != null) {
        try {
          // Add context as separate text part before image if present
          if (contextText.isNotEmpty) {
            contentParts.add(TextPart('${contextText.trim()}'));
          }

          final imageBytes = Uint8List.fromList(message.fileData!);
          final mimeType = message.mimeType ?? 'image/jpeg';
          contentParts.add(ImagePart(imageBytes, mimeType));
        } catch (e) {
          // If image processing fails, add description instead
          final fallbackText = contextText.isNotEmpty
              ? '${contextText}Image description: ${message.description.isNotEmpty ? message.description : 'Image processing failed'}'
              : 'Image description: ${message.description.isNotEmpty ? message.description : 'Image processing failed'}';
          contentParts.add(TextPart(fallbackText));
        }
      }

      // Add audio data if present
      if (message.type == MessageType.audio && message.fileData != null) {
        try {
          // Add context as separate text part before audio if present
          if (contextText.isNotEmpty) {
            contentParts.add(TextPart('${contextText.trim()}'));
          }

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

          final fullFallbackText = contextText.isNotEmpty
              ? '$contextText$fallbackText'
              : fallbackText;
          contentParts.add(TextPart(fullFallbackText));
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
    // If we're already generating, don't start another generation
    if (state.isGenerating) return;

    final threadId = _threadId!;
    final modeId = _modeId!;

    try {
      final store = ref.read(storeProvider);

      // Get the thread and mode
      final (:thread, :mode) = await _getThreadAndMode(threadId, modeId, store);

      // Get content parts from messages
      final contentParts = await _getContentPartsFromMessages(threadId, store);

      // Create a placeholder output for streaming
      final placeholderOutput = ModeOutput.completed(content: '');

      // Set up relationships using target
      placeholderOutput.thread.target = thread;
      placeholderOutput.mode.target = mode;

      // Save placeholder to database
      final box = store.box<ModeOutput>();
      final outputId = box.put(placeholderOutput);

      // Reload outputs to include the new placeholder
      await _loadOutputs(threadId, modeId);

      // Find the index of the new output
      final newOutputIndex = state.outputs.length - 1;

      // Start streaming
      _startStreaming(newOutputIndex);

      // Generate content with streaming
      final systemPrompt = customPrompt ??
          "Generate markdown and follow the instructions: \n${mode.prompt}";
      final finalContent = await _performGeneration(systemPrompt, contentParts);

      // Complete streaming and save final content
      await _completeStreaming(finalContent, placeholderOutput, store);
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
    if (state.isGenerating && state.streamingIndex != null) {
      state = state.copyWith(streamingContent: content);

      // Also update the actual output in the list for real-time display
      if (state.streamingIndex! < state.outputs.length) {
        final updatedOutputs = <ModeOutput>[];

        for (int i = 0; i < state.outputs.length; i++) {
          final output = state.outputs[i];
          if (i == state.streamingIndex) {
            // Update the content of the streaming output
            final updatedOutput = output.copyWith(content: content);
            updatedOutputs.add(updatedOutput);
          } else {
            updatedOutputs.add(output);
          }
        }

        state = state.copyWith(
          outputs: updatedOutputs.toIList(),
          streamingContent: content,
        );
      }
    }
  }

  /// Complete streaming and save final content
  Future<void> _completeStreaming(
      String finalContent, ModeOutput placeholder, Store store) async {
    // Create a new output with the final content to ensure proper database saving
    final completedOutput = placeholder.copyWith(content: finalContent);

    // Maintain relationships
    completedOutput.thread.target = placeholder.thread.target;
    completedOutput.mode.target = placeholder.mode.target;

    // Save the completed output to database
    final box = store.box<ModeOutput>();
    box.put(completedOutput);

    // Stop streaming and update state directly instead of reloading
    _stopStreaming();

    // Update the outputs list with the completed output
    final updatedOutputs = state.outputs.map((output) {
      return output.id == placeholder.id ? completedOutput : output;
    }).toList();

    state = state.copyWith(
      outputs: updatedOutputs.toIList(),
    );
  }

  /// Complete streaming for regenerated output and save to database
  Future<void> _completeRegenerateStreaming(String finalContent,
      ModeOutput newOutput, Thread thread, Mode mode, Store store) async {
    // Update the output's content for saving to database
    final updatedOutput = newOutput.copyWith(content: finalContent);

    // Save to database with relationships
    updatedOutput.thread.target = thread;
    updatedOutput.mode.target = mode;
    final box = store.box<ModeOutput>();
    box.put(updatedOutput);

    // Stop streaming
    _stopStreaming();

    // Update the outputs list with the final content using copyWith for immutability
    final updatedOutputs = state.outputs.map((output) {
      return output.id == newOutput.id
          ? output.copyWith(content: finalContent)
          : output;
    }).toList();

    state = state.copyWith(
      outputs: updatedOutputs.toIList(),
    );
  }

  /// Stop streaming
  void _stopStreaming() {
    state = state.copyWith(
      isGenerating: false,
      streamingContent: null,
      streamingIndex: null,
    );
  }

  /// Regenerate by creating a new output (doesn't replace current one)
  Future<void> regenerateCurrentOutput() async {
    // If we're already generating, don't start another generation
    if (state.isGenerating) return;

    final threadId = _threadId!;
    final modeId = _modeId!;

    try {
      final store = ref.read(storeProvider);

      // Get the thread and mode
      final (:thread, :mode) = await _getThreadAndMode(threadId, modeId, store);

      // Get content parts from messages
      final contentParts = await _getContentPartsFromMessages(threadId, store);

      // Create a new output in state only (not in database yet)
      final newOutput = ModeOutput.completed(content: '');

      // Add to state immediately
      final updatedOutputs = state.outputs.add(newOutput);
      final newOutputIndex = updatedOutputs.length - 1;

      state = state.copyWith(
        outputs: updatedOutputs,
        currentIndex: newOutputIndex,
      );

      // Start streaming
      _startStreaming(newOutputIndex);

      final systemPrompt =
          "Generate markdown and follow the instructions: \n${mode.prompt}";

      // Generate content with streaming
      final finalContent = await _performGeneration(systemPrompt, contentParts);

      // Complete streaming and save to database
      await _completeRegenerateStreaming(
          finalContent, newOutput, thread, mode, store);
    } catch (e) {
      // Stop streaming on error and remove the temporary output from state
      _stopStreaming();

      // Remove the last output (the one we just added) if it exists
      if (state.outputs.isNotEmpty) {
        final updatedOutputs = state.outputs.removeLast();
        final newIndex =
            updatedOutputs.isNotEmpty ? updatedOutputs.length - 1 : 0;
        state = state.copyWith(
          outputs: updatedOutputs,
          currentIndex: newIndex.clamp(
              0, (updatedOutputs.length - 1).clamp(0, double.infinity).toInt()),
        );
      }

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
      final store = ref.read(storeProvider);
      final box = store.box<ModeOutput>();

      box.remove(currentOutput.id);

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
