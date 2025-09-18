import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../bloc/message_state.dart';
import '../models/message.dart';
import '../../tags/models/tag.dart';
import '../../tags/ui/tags_selection_widget.dart';

/// Widget to display a single message in the chat
class MessageItemWidget extends ConsumerStatefulWidget {
  final MessageState messageState;
  final void Function(List<Tag> tags)? onTagsUpdate;
  final void Function(String description)? onDescriptionUpdate;
  final VoidCallback? onDelete;

  const MessageItemWidget({
    super.key,
    required this.messageState,
    this.onTagsUpdate,
    this.onDescriptionUpdate,
    this.onDelete,
  });

  @override
  ConsumerState<MessageItemWidget> createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends ConsumerState<MessageItemWidget> {
  AudioPlayer? _audioPlayer;
  bool _isPlaying = false;
  bool _isLoading = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (widget.messageState.message.type == MessageType.audio &&
        widget.messageState.message.fileData != null) {
      _initializeAudioPlayer();
    }
  }

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();
  }

  Future<void> _initializeAudioPlayer() async {
    if (widget.messageState.message.fileData == null) return;

    _audioPlayer = AudioPlayer();

    // Set up listeners
    _audioPlayer!.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;
          _isLoading = state.processingState == ProcessingState.loading ||
              state.processingState == ProcessingState.buffering;
        });
      }
    });

    _audioPlayer!.positionStream.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    _audioPlayer!.durationStream.listen((duration) {
      if (mounted && duration != null) {
        setState(() {
          _duration = duration;
        });
      }
    });

    try {
      // Load audio from bytes
      final audioBytes =
          Uint8List.fromList(widget.messageState.message.fileData!);
      await _audioPlayer!.setAudioSource(
        AudioSource.uri(
          Uri.dataFromBytes(
            audioBytes,
            mimeType: widget.messageState.message.mimeType ?? 'audio/mpeg',
          ),
        ),
      );
    } catch (e) {
      debugPrint('Error loading audio: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _togglePlayback() async {
    if (_audioPlayer == null || widget.messageState.message.fileData == null)
      return;

    try {
      if (_isPlaying) {
        await _audioPlayer!.pause();
      } else {
        // If we're at the end, seek back to the beginning
        if (_position >= _duration && _duration > Duration.zero) {
          await _audioPlayer!.seek(Duration.zero);
        }
        await _audioPlayer!.play();
      }
    } catch (e) {
      debugPrint('Error toggling playback: $e');
      // Show error to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error playing audio: ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _seek(Duration position) async {
    if (_audioPlayer == null || widget.messageState.message.fileData == null)
      return;

    try {
      await _audioPlayer!.seek(position);
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    } catch (e) {
      debugPrint('Error seeking: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.messageState.message;
    final isLoading =
        widget.messageState.isSaving || widget.messageState.isProcessing;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isLoading ? 0.7 : 1.0,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        elevation: 1.5,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _getMessageBackgroundColor(context, message.type),
                _getMessageBackgroundColor(context, message.type)
                    .withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loading indicator at the top
              if (isLoading)
                LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  minHeight: 2,
                ),

              // Main message content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Message header with timestamp and type
                    _buildMessageHeader(context, message),

                    // Description at the top (always show for editing)
                    const SizedBox(height: 8),
                    _buildDescriptionSection(context, message),

                    const SizedBox(height: 8),

                    // Message content
                    _buildMessageContent(context, message),

                    // Error display
                    if (widget.messageState.error != null) ...[
                      const SizedBox(height: 8),
                      _buildErrorDisplay(context),
                    ],
                  ],
                ),
              ),

              // Message actions
              _buildMessageActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageHeader(BuildContext context, Message message) {
    return Row(
      children: [
        // Message type icon with better styling
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            _getMessageTypeIcon(message.type),
            size: 14,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 10),

        // Timestamp
        Text(
          _formatTimestamp(message.timestamp),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
        ),

        const Spacer(),

        // Status indicator for loading states
        if (widget.messageState.isSaving ||
            widget.messageState.isProcessing) ...[
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.messageState.isSaving ? 'Saving...' : 'Processing...',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(width: 8),
        ],

        // Delete message button
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => _showDeleteConfirmationDialog(context),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.delete_outline,
                size: 16,
                color: Theme.of(context).colorScheme.error.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(BuildContext context, Message message) {
    final bool isEmpty = message.description.isEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onDescriptionUpdate != null
            ? () => _showEditDescriptionDialog(context)
            : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isEmpty
                ? Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3)
                : Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isEmpty
                  ? Theme.of(context).colorScheme.outline.withOpacity(0.3)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.15),
              width: 0.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isEmpty
                    ? Icons.add_comment_outlined
                    : Icons.description_outlined,
                size: 16,
                color: isEmpty
                    ? Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withOpacity(0.6)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isEmpty ? 'Add description...' : message.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isEmpty
                            ? Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withOpacity(0.6)
                            : Theme.of(context).colorScheme.onSurface,
                        height: 1.4,
                        fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w500,
                        fontStyle:
                            isEmpty ? FontStyle.italic : FontStyle.normal,
                      ),
                ),
              ),
              if (widget.onDescriptionUpdate != null) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.edit_outlined,
                  size: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.5),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context, Message message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main content based on message type
        _buildMainContent(context, message),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context, Message message) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.text.isNotEmpty ? message.text : message.description,
          style: Theme.of(context).textTheme.bodyMedium,
        );

      case MessageType.audio:
        return _buildAudioContent(context, message);

      case MessageType.image:
        return _buildImageContent(context, message);
    }
  }

  Widget _buildAudioContent(BuildContext context, Message message) {
    // Helper function to truncate filename
    String getTruncatedFilename(String? filename) {
      if (filename == null || filename.isEmpty) return 'Audio';
      if (filename.length <= 8) return filename;
      return '${filename.substring(0, 8)}...';
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Audio icon with background
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.audiotrack_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTruncatedFilename(message.fileName),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    if (message.transcript?.isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Text(
                        message.transcript!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.7),
                              height: 1.3,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Play/Pause button
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: message.fileData != null ? _togglePlayback : null,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: message.fileData != null
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        : Icon(
                            message.fileData == null
                                ? Icons.error_outline_rounded
                                : _isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                            color: message.fileData != null
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).colorScheme.outline,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),

          // Audio seekbar (only show when playing or has been played)
          if (_isPlaying || _position > Duration.zero) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  _formatDuration(_position),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                        fontSize: 11,
                      ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 1.5,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 5,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 10,
                      ),
                    ),
                    child: Slider(
                      value: _duration.inMilliseconds > 0
                          ? (_position.inMilliseconds /
                                  _duration.inMilliseconds)
                              .clamp(0.0, 1.0)
                          : 0.0,
                      onChanged: (value) {
                        final newPosition = Duration(
                          milliseconds:
                              (_duration.inMilliseconds * value).round(),
                        );
                        _seek(newPosition);
                      },
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.2),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _formatDuration(_duration),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                        fontSize: 11,
                      ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _buildImageContent(BuildContext context, Message message) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 240,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
          width: 0.5,
        ),
      ),
      child: message.fileData != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.memory(
                Uint8List.fromList(message.fileData!),
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImagePlaceholder(context, message);
                },
              ),
            )
          : _buildImagePlaceholder(context, message),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context, Message message) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message.fileName ?? 'Image',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageActions(BuildContext context) {
    final message = widget.messageState.message;
    final selectionKey = 'message_${message.id}';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.03),
            Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.08),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Spacer(),

          // Tags selection widget
          TagsSelectionWidget(
            selectionKey: selectionKey,
            title: 'Tags',
            showCreateButton: true,
            initialTags: widget.messageState.message.tags.toList(),
            onTagObjectsChanged: (selectedTags) {
              widget.onTagsUpdate?.call(selectedTags);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 16,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.messageState.error!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    height: 1.3,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final message = widget.messageState.message;
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.delete_outline_rounded,
                color: Theme.of(context).colorScheme.error,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text('Delete Message'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to delete this message?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              if (message.description.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    message.description.length > 50
                        ? '${message.description.substring(0, 50)}...'
                        : message.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                'This action cannot be undone.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.7),
                    ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              child: const Text('Delete'),
            ),
          ],
          actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        );
      },
    );

    if (result == true) {
      widget.onDelete?.call();
    }
  }

  Future<void> _showEditDescriptionDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController(
      text: widget.messageState.message.description,
    );

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.edit_note_rounded,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text('Edit Description'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add or edit a description to help organize and remember this message.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                maxLines: 4,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter a description for this message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .surfaceVariant
                      .withOpacity(0.3),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
            FilledButton(
              onPressed: () =>
                  Navigator.of(context).pop(controller.text.trim()),
              child: const Text('Save'),
            ),
          ],
          actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        );
      },
    );

    if (result != null) {
      widget.onDescriptionUpdate?.call(result);
    }
  }

  Color _getMessageBackgroundColor(BuildContext context, MessageType type) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (type) {
      case MessageType.text:
        return colorScheme.surface;
      case MessageType.audio:
        return colorScheme.primaryContainer.withOpacity(0.05);
      case MessageType.image:
        return colorScheme.secondaryContainer.withOpacity(0.05);
    }
  }

  IconData _getMessageTypeIcon(MessageType type) {
    switch (type) {
      case MessageType.text:
        return Icons.text_fields;
      case MessageType.audio:
        return Icons.audiotrack;
      case MessageType.image:
        return Icons.image;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
