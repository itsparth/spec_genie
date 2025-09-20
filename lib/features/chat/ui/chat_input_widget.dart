import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/chat_input_bloc.dart';
import '../models/chat_input.dart';
import '../services/feedback_service.dart';
import '../models/chat_input_state.dart';
import 'widgets/chat_input_content_preview.dart';
import 'widgets/chat_input_bottom_controls.dart';

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

    final feedback = ref.read(feedbackServiceProvider);
    ref.listen<ChatInputState>(chatInputBlocProvider, (prev, next) async {
      final prevAudio = prev?.audioState;
      final curr = next.audioState;
      if (curr.triggerStartFeedback &&
          !(prevAudio?.triggerStartFeedback ?? false)) {
        await feedback.playStart();
        chatInputBloc.ackRecordingFeedback();
      } else if (curr.triggerStopFeedback &&
          !(prevAudio?.triggerStopFeedback ?? false)) {
        await feedback.playStop();
        chatInputBloc.ackRecordingFeedback();
      }
    });

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
            // Current content preview (including text input)
            if (state.currentContent != null ||
                state.textInput.trim().isNotEmpty)
              ChatInputContentPreview(
                state: state,
                onTapText: () => _showTextInput(context, chatInputBloc),
              ),
            ChatInputBottomControls(
              state: state,
              bloc: chatInputBloc,
              onSend: () => _handleSend(context, chatInputBloc),
              onCancel: () => _handleCancel(chatInputBloc, state),
              onShowFileOptions: () => _showFileOptions(context, chatInputBloc),
              onShowTextInput: () => _showTextInput(context, chatInputBloc),
            ),
          ],
        ),
      ),
    );
  }

  // Removed description and tags section

  // Removed inlined preview/controls helpers (now separate widgets)

  void _handleCancel(ChatInputBloc chatInputBloc, ChatInputState state) {
    // Cancel any active recording first
    if (state.isRecording || state.isRecordingPaused) {
      chatInputBloc.cancelRecording();
    }

    // Clear all content (including recorded audio, images, files, text)
    chatInputBloc.clearCurrentContent();
    chatInputBloc.clearTextInput();
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
              leading: const Icon(Icons.text_fields),
              title: const Text('Add Text'),
              onTap: () {
                Navigator.pop(context);
                _showTextInput(context, chatInputBloc);
              },
            ),
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

// MathHelper removed after simplifying animation.
