import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../tags/ui/tags_selection_widget.dart';
import '../bloc/chat_input_bloc.dart';
import '../bloc/chat_input_state.dart';
import '../models/chat_input.dart';

/// Simplified and beautified chat input widget (stateless)
/// Layout:
/// - Top: Description textbox and tags picker
/// - Bottom: Left file picker, center animated mic button, right text button
/// - Dynamic UI changes for recording states
class ChatInputWidget extends ConsumerWidget {
  final int? threadId;
  final VoidCallback? onSend;
  final String? hintText;
  final EdgeInsets? padding;

  const ChatInputWidget({
    super.key,
    required this.threadId,
    this.onSend,
    this.hintText,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatInputBloc = ref.read(chatInputBlocProvider.notifier);
    final state = ref.watch(chatInputBlocProvider);

    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top section: Description and Tags (always visible)
            _buildTopSection(context, chatInputBloc, state),

            const SizedBox(height: 12),

            // Current content preview (including text input)
            if (state.currentContent != null ||
                state.textInput.trim().isNotEmpty)
              _buildContentPreview(context, ref, state),

            // Recording controls (shown during recording)
            if (state.isRecording || state.isRecordingPaused)
              _buildRecordingControls(context, chatInputBloc, state),

            // Main input controls (hide if already have content or text input)
            if (!state.isRecording &&
                !state.isRecordingPaused &&
                state.currentContent == null &&
                state.textInput.trim().isEmpty)
              _buildMainControls(context, chatInputBloc, state),

            // Send/Cancel controls (shown after recording or when content exists)
            if (state.audioState.status == RecordingStatus.stopped ||
                state.canSend)
              _buildActionControls(context, chatInputBloc, state),
          ],
        ),
      ),
    );
  }

  // Top section with description and tags
  Widget _buildTopSection(
      BuildContext context, ChatInputBloc chatInputBloc, ChatInputState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Description input field
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            ),
          ),
          child: TextField(
            controller: chatInputBloc.descriptionController,
            decoration: InputDecoration(
              hintText: 'Add description (optional)',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            maxLines: 2,
            minLines: 1,
          ),
        ),

        const SizedBox(height: 8),

        // Tags selection
        Row(
          children: [
            const Spacer(),
            TagsSelectionWidget(
              selectionKey: 'input',
              onTagObjectsChanged: (selectedTags) {
                chatInputBloc.setTags(selectedTags);
              },
            ),
          ],
        ),
      ],
    );
  }

  // Content preview widget
  Widget _buildContentPreview(
      BuildContext context, WidgetRef ref, ChatInputState state) {
    // Show content preview for either currentContent or text input
    final hasContent = state.currentContent != null;
    final hasTextInput = state.textInput.trim().isNotEmpty;

    if (!hasContent && !hasTextInput) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Content type icon
          Icon(
            hasContent
                ? _getContentIcon(state.currentContent!.type)
                : Icons.text_fields,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),

          const SizedBox(width: 8),

          // Content info (scrollable for text, clickable if text)
          Expanded(
            child: hasContent &&
                    state.currentContent!.type != ChatInputType.text
                ? Text(
                    _getContentDisplayText(state.currentContent!),
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : GestureDetector(
                    onTap: () => _showTextInput(
                        context, ref.read(chatInputBlocProvider.notifier)),
                    child: Container(
                      height: 40, // Fixed height to maintain consistent space
                      child: SingleChildScrollView(
                        child: Text(
                          hasContent
                              ? _getContentDisplayText(state.currentContent!)
                              : state.textInput.trim(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // Recording controls during recording
  Widget _buildRecordingControls(
      BuildContext context, ChatInputBloc chatInputBloc, ChatInputState state) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Pause/Resume button (left)
          IconButton(
            onPressed: state.isRecordingPaused
                ? () => chatInputBloc.resumeRecording()
                : () => chatInputBloc.pauseRecording(),
            icon: Icon(
              state.isRecordingPaused ? Icons.play_arrow : Icons.pause,
              color: Colors.red,
            ),
          ),

          const Spacer(),

          // Recording status and duration (center)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    color: state.isRecordingPaused ? Colors.orange : Colors.red,
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    state.isRecordingPaused ? 'PAUSED' : 'RECORDING',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: state.isRecordingPaused
                              ? Colors.orange
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              Text(
                _formatDuration(state.audioState.duration),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),

          const Spacer(),

          // Stop button (right)
          IconButton(
            onPressed: () => _handleStopRecording(chatInputBloc),
            icon: const Icon(
              Icons.stop,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // Main input controls (file picker, mic, text)
  Widget _buildMainControls(
      BuildContext context, ChatInputBloc chatInputBloc, ChatInputState state) {
    return Row(
      children: [
        // File picker button (left)
        _buildControlButton(
          context: context,
          icon: Icons.attach_file_outlined,
          onPressed: state.isLoading
              ? null
              : () => _showFileOptions(context, chatInputBloc),
          tooltip: 'Attach file',
          isPrimary: false,
        ),

        const Spacer(),

        // Large animated mic button (center)
        _buildAnimatedMicButton(context, chatInputBloc, state),

        const Spacer(),

        // Text input button (right)
        _buildControlButton(
          context: context,
          icon: Icons.text_fields,
          onPressed: state.isLoading
              ? null
              : () => _showTextInput(context, chatInputBloc),
          tooltip: 'Add text',
          isPrimary: false,
        ),
      ],
    );
  }

  // Action controls (send/cancel after recording or when content exists)
  Widget _buildActionControls(
      BuildContext context, ChatInputBloc chatInputBloc, ChatInputState state) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          // Cancel button
          Expanded(
            child: OutlinedButton(
              onPressed: () => _handleCancel(chatInputBloc, state),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: const Text('Cancel'),
            ),
          ),

          const SizedBox(width: 12),

          // Send button
          Expanded(
            child: ElevatedButton(
              onPressed: state.canSend
                  ? () => _handleSend(context, chatInputBloc)
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Send'),
            ),
          ),
        ],
      ),
    );
  }

  // Control button widget
  Widget _buildControlButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onPressed,
    required String tooltip,
    required bool isPrimary,
  }) {
    return Material(
      color: isPrimary
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(28),
      elevation: isPrimary ? 4 : 1,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: isPrimary
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
            size: 24,
          ),
        ),
      ),
    );
  }

  // Animated mic button with amplitude visualization
  Widget _buildAnimatedMicButton(
      BuildContext context, ChatInputBloc chatInputBloc, ChatInputState state) {
    final isRecording = state.isRecording;
    final amplitude = state.audioState.amplitude;

    return GestureDetector(
      onTap:
          state.isLoading ? null : () => _handleMicAction(chatInputBloc, state),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isRecording ? Colors.red : Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: (isRecording ? Colors.red : Theme.of(context).primaryColor)
                  .withOpacity(0.3),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Amplitude animation rings
            if (isRecording) ...[
              _buildAmplitudeRing(
                  amplitude, 1.0, Colors.white.withOpacity(0.3)),
              _buildAmplitudeRing(
                  amplitude * 0.7, 0.8, Colors.white.withOpacity(0.2)),
              _buildAmplitudeRing(
                  amplitude * 0.4, 0.6, Colors.white.withOpacity(0.1)),
            ],

            // Mic icon
            Icon(
              isRecording ? Icons.stop : Icons.mic,
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }

  // Amplitude visualization ring
  Widget _buildAmplitudeRing(double amplitude, double baseScale, Color color) {
    final scale = baseScale + (amplitude * 0.5); // Scale based on amplitude

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
      ),
    );
  }

  // Helper methods
  IconData _getContentIcon(ChatInputType type) {
    switch (type) {
      case ChatInputType.text:
        return Icons.text_fields;
      case ChatInputType.audio:
        return Icons.audiotrack;
      case ChatInputType.image:
        return Icons.image;
      case ChatInputType.file:
        return Icons.attach_file;
    }
  }

  String _getContentDisplayText(ChatInput content) {
    switch (content.type) {
      case ChatInputType.text:
        final textInput = content as TextChatInput;
        return textInput.text;
      case ChatInputType.audio:
        final audioInput = content as AudioChatInput;
        return audioInput.fileName ?? 'Audio recording';
      case ChatInputType.image:
        final imageInput = content as ImageChatInput;
        return imageInput.fileName ?? 'Image';
      case ChatInputType.file:
        final fileInput = content as FileChatInput;
        return fileInput.fileName;
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  // Event handlers
  Future<void> _handleMicAction(
      ChatInputBloc chatInputBloc, ChatInputState state) async {
    if (state.isRecording) {
      // Stop recording and save it
      await chatInputBloc.stopRecording();
      await chatInputBloc.saveRecording();
    } else {
      await chatInputBloc.startRecording();
    }
  }

  Future<void> _handleStopRecording(ChatInputBloc chatInputBloc) async {
    await chatInputBloc.stopRecording();
    await chatInputBloc.saveRecording();
  }

  void _handleCancel(ChatInputBloc chatInputBloc, ChatInputState state) {
    // Cancel any active recording first
    if (state.isRecording || state.isRecordingPaused) {
      chatInputBloc.cancelRecording();
    }

    // Clear all content (including recorded audio, images, files, text)
    chatInputBloc.clearCurrentContent();
    chatInputBloc.clearTextInput();

    // Also clear description and tags
    chatInputBloc.clearDescription();
  }

  Future<void> _handleSend(
      BuildContext context, ChatInputBloc chatInputBloc) async {
    // Check if there are inputs to send
    final inputs = chatInputBloc.prepareInputsForSending();
    if (inputs.isNotEmpty) {
      try {
        // Send the message using the bloc (handles thread creation if needed)
        await chatInputBloc.sendMessage(threadId);

        // Clear all inputs after successful send
        chatInputBloc.clearAllInputs();
        chatInputBloc.clearDescription();

        // Call the onSend callback if provided
        onSend?.call();
      } catch (e) {
        // Handle error - for now just clear the inputs and rethrow
        chatInputBloc.clearAllInputs();
        // TODO: Show error message to user
        rethrow;
      }
    }
  }

  void _showFileOptions(BuildContext context, ChatInputBloc chatInputBloc) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.captureImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.selectImageFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.audiotrack),
              title: const Text('Audio Files'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.selectFiles(
                  filterType: FileInputType.audio,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text('Other Files'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.selectFiles();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTextInput(BuildContext context, ChatInputBloc chatInputBloc) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Text',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: chatInputBloc.textController,
                decoration: InputDecoration(
                  hintText: hintText ?? 'Type your message...',
                  border: const OutlineInputBorder(),
                ),
                maxLines: 5,
                minLines: 3,
                autofocus: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        chatInputBloc.clearTextInput();
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Done'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
