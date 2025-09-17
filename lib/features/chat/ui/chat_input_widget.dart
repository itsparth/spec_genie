import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/chat_input_bloc.dart';
import '../bloc/chat_input_state.dart';
import '../models/chat_input.dart';

/// Production chat input widget with minimalistic design
/// Primary action: Audio recording
/// Secondary actions: File selection, image selection
/// Text input always available
class ChatInputWidget extends ConsumerStatefulWidget {
  final VoidCallback? onSend;
  final String? hintText;
  final EdgeInsets? padding;

  const ChatInputWidget({
    super.key,
    this.onSend,
    this.hintText,
    this.padding,
  });

  @override
  ConsumerState<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends ConsumerState<ChatInputWidget>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();

  late AnimationController _recordingAnimationController;
  late Animation<double> _recordingScaleAnimation;
  late Animation<Color?> _recordingColorAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _recordingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _recordingScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _recordingAnimationController,
      curve: Curves.easeInOut,
    ));

    _recordingColorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.red.shade300,
    ).animate(CurvedAnimation(
      parent: _recordingAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFocusNode.dispose();
    _recordingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatInputBloc = ref.read(chatInputBlocProvider.notifier);
    final state = ref.watch(chatInputBlocProvider);

    // Handle recording animation
    ref.listen<ChatInputState>(chatInputBlocProvider, (previous, next) {
      if (next.isRecording && !_recordingAnimationController.isAnimating) {
        _recordingAnimationController.repeat(reverse: true);
      } else if (!next.isRecording &&
          _recordingAnimationController.isAnimating) {
        _recordingAnimationController.stop();
        _recordingAnimationController.reset();
      }
    });

    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            // Pending inputs preview
            if (state.pendingInputs.isNotEmpty)
              _buildPendingInputsPreview(state),

            // Main input row
            Row(
              children: [
                // File selection button
                _buildActionButton(
                  icon: Icons.attach_file,
                  onPressed: state.isLoading
                      ? null
                      : () => _showFileOptions(chatInputBloc),
                  tooltip: 'Attach file',
                ),

                const SizedBox(width: 8),

                // Text input field
                Expanded(
                  child: _buildTextInput(chatInputBloc, state),
                ),

                const SizedBox(width: 8),

                // Image selection button
                _buildActionButton(
                  icon: Icons.image_outlined,
                  onPressed: state.isLoading
                      ? null
                      : () => _showImageOptions(chatInputBloc),
                  tooltip: 'Add image',
                ),

                const SizedBox(width: 8),

                // Primary action: Audio recording or Send
                _buildPrimaryAction(chatInputBloc, state),
              ],
            ),

            // Recording controls (shown when recording)
            if (state.isRecording || state.isRecordingPaused)
              _buildRecordingControls(chatInputBloc, state),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingInputsPreview(ChatInputState state) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: state.pendingInputs.map((input) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getInputIcon(input),
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _getInputPreviewText(input),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => ref
                        .read(chatInputBlocProvider.notifier)
                        .removePendingInput(input.id),
                    child: Icon(
                      Icons.close,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTextInput(ChatInputBloc chatInputBloc, ChatInputState state) {
    return TextField(
      controller: _textController,
      focusNode: _textFocusNode,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Type a message...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        isDense: true,
      ),
      maxLines: 4,
      minLines: 1,
      textCapitalization: TextCapitalization.sentences,
      onChanged: chatInputBloc.updateTextInput,
      onSubmitted: state.canSend ? (_) => _handleSend(chatInputBloc) : null,
    );
  }

  Widget _buildActionButton({
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

  Widget _buildPrimaryAction(
      ChatInputBloc chatInputBloc, ChatInputState state) {
    if (state.canSend) {
      // Send button when there's content to send
      return Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => _handleSend(chatInputBloc),
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

    // Audio recording button as primary action
    return AnimatedBuilder(
      animation: _recordingAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: state.isRecording ? _recordingScaleAnimation.value : 1.0,
          child: Material(
            color: state.isRecording
                ? _recordingColorAnimation.value
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            elevation: state.isRecording ? 4 : 0,
            child: InkWell(
              onTap: state.isLoading
                  ? null
                  : () => _handleAudioAction(chatInputBloc, state),
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
          ),
        );
      },
    );
  }

  Widget _buildRecordingControls(
      ChatInputBloc chatInputBloc, ChatInputState state) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Recording indicator and duration
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatDuration(state.audioState.duration),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          // Control buttons
          Row(
            children: [
              // Pause/Resume button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: state.isRecordingPaused
                      ? () => chatInputBloc.resumeRecording()
                      : () => chatInputBloc.pauseRecording(),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      state.isRecordingPaused ? Icons.play_arrow : Icons.pause,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Cancel button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _handleCancelRecording(chatInputBloc),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showFileOptions(ChatInputBloc chatInputBloc) {
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

  void _showImageOptions(ChatInputBloc chatInputBloc) {
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

  Future<void> _handleAudioAction(
      ChatInputBloc chatInputBloc, ChatInputState state) async {
    if (state.isRecording) {
      await chatInputBloc.stopRecording();
    } else {
      await chatInputBloc.startRecording();
    }
  }

  void _handleCancelRecording(ChatInputBloc chatInputBloc) {
    // Stop recording without saving
    chatInputBloc.stopRecording().then((_) {
      // Remove the last audio input (the cancelled recording)
      final state = ref.read(chatInputBlocProvider);
      if (state.pendingInputs.isNotEmpty) {
        final lastInput = state.pendingInputs.last;
        if (lastInput is AudioChatInput) {
          chatInputBloc.removePendingInput(lastInput.id);
        }
      }
    });
  }

  void _handleSend(ChatInputBloc chatInputBloc) {
    final inputs = chatInputBloc.prepareInputsForSending();
    if (inputs.isNotEmpty) {
      // Clear the text controller
      _textController.clear();

      // Clear all inputs
      chatInputBloc.clearAllInputs();

      // Call the onSend callback if provided
      widget.onSend?.call();

      // TODO: Send inputs to chat service
      // This would typically involve calling a chat service or API
    }
  }

  IconData _getInputIcon(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        return Icons.text_fields;
      case ChatInputType.audio:
        return Icons.mic;
      case ChatInputType.image:
        return Icons.image;
      case ChatInputType.file:
        final fileInput = input as FileChatInput;
        return fileInput.fileType == FileInputType.audio
            ? Icons.audiotrack
            : Icons.insert_drive_file;
    }
  }

  String _getInputPreviewText(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        final textInput = input as TextChatInput;
        return textInput.text.length > 20
            ? '${textInput.text.substring(0, 20)}...'
            : textInput.text;
      case ChatInputType.audio:
        final audioInput = input as AudioChatInput;
        return audioInput.duration != null
            ? _formatDuration(audioInput.duration!)
            : 'Audio';
      case ChatInputType.image:
        return 'Image';
      case ChatInputType.file:
        final fileInput = input as FileChatInput;
        return fileInput.fileName.length > 15
            ? '${fileInput.fileName.substring(0, 15)}...'
            : fileInput.fileName;
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
