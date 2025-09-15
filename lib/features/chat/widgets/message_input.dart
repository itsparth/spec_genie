import 'package:flutter/material.dart';
import '../../media/widgets/voice_recorder.dart';
import '../../media/widgets/image_picker_button.dart';

class MessageInput extends StatefulWidget {
  final void Function(String) onSendText;
  final void Function(String) onSendAudio;
  final void Function(String) onSendImage;

  const MessageInput({
    super.key,
    required this.onSendText,
    required this.onSendAudio,
    required this.onSendImage,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: SafeArea(
        child: Row(
          children: [
            // Media buttons
            if (!_isComposing) ...[
              VoiceRecorder(
                onRecordingComplete: widget.onSendAudio,
              ),
              const SizedBox(width: 4),
              ImagePickerButton(
                onImageSelected: widget.onSendImage,
              ),
              const SizedBox(width: 8),
            ],

            // Text input
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _textController,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {
                    setState(() {
                      _isComposing = value.trim().isNotEmpty;
                    });
                  },
                  onSubmitted: _isComposing ? (value) => _sendText() : null,
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Send button
            CircleAvatar(
              backgroundColor: _isComposing
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: _isComposing ? Colors.white : Colors.grey.shade600,
                ),
                onPressed: _isComposing ? _sendText : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendText() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      widget.onSendText(text);
      _textController.clear();
      setState(() {
        _isComposing = false;
      });
      _focusNode.requestFocus();
    }
  }
}
