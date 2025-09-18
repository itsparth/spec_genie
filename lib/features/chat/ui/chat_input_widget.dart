import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../tags/ui/tags_selection_widget.dart';
import '../bloc/chat_input_bloc.dart';
import '../bloc/chat_input_state.dart';
import '../models/chat_input.dart';
import 'widgets/chat_input_field.dart';
import 'widgets/chat_recording_controls.dart';
import 'widgets/chat_pending_inputs_preview.dart';

/// Simplified chat input widget with minimalistic design
/// Primary action: Audio recording with pause/resume
/// Secondary actions: File selection, image selection
/// Text input always available
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
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Pending inputs preview
            Row(
              children: [
                Expanded(
                  child: ChatPendingInputsPreview(
                      pendingInputs: state.pendingInputs.toList()),
                ),

                // Tags selection widget with onChange handler
                TagsSelectionWidget(
                  selectionKey: 'input',
                  onTagObjectsChanged: (selectedTags) {
                    final chatInputBloc =
                        ref.read(chatInputBlocProvider.notifier);
                    chatInputBloc.setTags(selectedTags);
                  },
                ),
              ],
            ),
            // Main input row
            Row(
              children: [
                // File selection button
                _buildActionButton(
                  context: context,
                  icon: Icons.attach_file,
                  onPressed: state.isLoading
                      ? null
                      : () => _showFileOptions(context, chatInputBloc),
                  tooltip: 'Attach file',
                ),

                // Text input field
                Expanded(
                  child: ChatInputField(
                    hintText: hintText,
                    canSend: state.canSend,
                    onSubmit: () => _handleSend(context, ref, chatInputBloc),
                  ),
                ),

                // Image selection button
                _buildActionButton(
                  context: context,
                  icon: Icons.image_outlined,
                  onPressed: state.isLoading
                      ? null
                      : () => _showImageOptions(context, chatInputBloc),
                  tooltip: 'Add image',
                ),

                const SizedBox(width: 8),

                // Mic button for recording
                _buildMicButton(context, ref, chatInputBloc, state),

                const SizedBox(width: 8),

                // Send button (always visible when there's content to send)
                _buildSendButton(context, ref, chatInputBloc, state),
              ],
            ),

            // Recording controls (shown when recording)
            if (state.isRecording || state.isRecordingPaused)
              ChatRecordingControls(
                recordingDuration: state.audioState.duration,
                isRecordingPaused: state.isRecordingPaused,
                onPauseResume: state.isRecordingPaused
                    ? () => chatInputBloc.resumeRecording()
                    : () => chatInputBloc.pauseRecording(),
                onCancel: () => _handleCancelRecording(chatInputBloc),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onPressed,
    required String tooltip,
    Color? color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: color ?? Theme.of(context).colorScheme.onSurface,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildMicButton(BuildContext context, WidgetRef ref,
      ChatInputBloc chatInputBloc, ChatInputState state) {
    // Mic button for recording with visual feedback
    return Material(
      color: state.isRecording
          ? Colors.red
          : Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      elevation: state.isRecording ? 4 : 0,
      child: InkWell(
        onTap: state.isLoading
            ? null
            : () => _handleMicAction(chatInputBloc, state),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Icon(
            state.isRecording ? Icons.stop : Icons.mic,
            color: state.isRecording
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton(BuildContext context, WidgetRef ref,
      ChatInputBloc chatInputBloc, ChatInputState state) {
    // Show send button only when there's content to send
    if (!state.canSend) {
      return const SizedBox.shrink();
    }

    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: state.isLoading
            ? null
            : () => _handleSend(context, ref, chatInputBloc),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20,
          ),
        ),
      ),
    );
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
              leading: const Icon(Icons.audiotrack),
              title: const Text('Audio Files'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.selectFiles(
                  filterType: FileInputType.audio,
                  allowMultiple: true,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text('Any Files'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.selectFiles(allowMultiple: true);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context, ChatInputBloc chatInputBloc) {
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
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Select Multiple'),
              onTap: () {
                Navigator.pop(context);
                chatInputBloc.selectMultipleImages();
              },
            ),
          ],
        ),
      ),
    );
  }

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

  void _handleCancelRecording(ChatInputBloc chatInputBloc) {
    // Cancel recording without saving
    chatInputBloc.cancelRecording();
  }

  void _handleSend(
      BuildContext context, WidgetRef ref, ChatInputBloc chatInputBloc) async {
    // Check if there are inputs to send
    final inputs = chatInputBloc.prepareInputsForSending();
    if (inputs.isNotEmpty) {
      try {
        // Send the message using the bloc (handles thread creation if needed)
        await chatInputBloc.sendMessage(threadId);

        // Clear the text input after successful send
        chatInputBloc.clearTextInput();

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
}
