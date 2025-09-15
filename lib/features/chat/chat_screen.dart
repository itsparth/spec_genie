import 'package:flutter/material.dart';
import 'package:spec_genie/models/thread.dart';
import 'package:spec_genie/models/message.dart';
import 'package:spec_genie/models/configuration.dart';
import 'package:spec_genie/services/storage_service.dart';
import 'package:spec_genie/services/ai_service.dart';

/// Chat screen for individual thread conversations
class ChatScreen extends StatefulWidget {
  final String threadId;

  const ChatScreen({
    super.key,
    required this.threadId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final StorageService _storage = StorageService.instance;
  final AIService _ai = AIService();

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();

  Thread? _thread;
  List<Message> _messages = [];
  Configuration? _config;
  bool _isLoading = true;
  bool _isSending = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadThreadData();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadThreadData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Load thread, messages, and configuration in parallel
      final results = await Future.wait([
        _storage.getThread(int.parse(widget.threadId)),
        _storage.getThreadMessages(widget.threadId),
        _storage.getConfiguration(),
      ]);

      _thread = results[0] as Thread?;
      _messages = results[1] as List<Message>;
      _config = results[2] as Configuration;

      if (_thread == null) {
        setState(() {
          _error = 'Thread not found';
          _isLoading = false;
        });
        return;
      }

      setState(() {
        _isLoading = false;
      });

      // Scroll to bottom after loading
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load thread: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _isSending) return;

    final userMessage = Message.text(
      content: text,
      threadId: widget.threadId,
      isUser: true,
    );

    // Clear input and add user message immediately
    _messageController.clear();
    setState(() {
      _messages.add(userMessage);
      _isSending = true;
    });

    _scrollToBottom();

    try {
      // Save user message
      await _storage.addMessage(userMessage);

      // Get AI response
      final response = await _ai.generateCompletion(
        config: _config!,
        prompt: text,
        conversationHistory:
            _messages.where((m) => m.type == MessageType.text).toList(),
        systemPrompt: _config!.systemPrompt,
      );

      final aiMessage = Message.text(
        content: response,
        threadId: widget.threadId,
        isUser: false,
      );

      // Add AI message and save
      setState(() {
        _messages.add(aiMessage);
      });

      await _storage.addMessage(aiMessage);

      // Update thread title if it's the first exchange
      if (_thread!.title.isEmpty && _messages.length >= 2) {
        await _generateThreadTitle(text);
      }

      _scrollToBottom();
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _generateThreadTitle(String firstMessage) async {
    if (_thread == null) return;

    try {
      // Simple title generation based on first message
      final title = _generateSimpleTitle(firstMessage);

      if (title.isNotEmpty) {
        await _storage.updateThread(_thread!.id, {'title': title});
        setState(() {
          _thread = _thread!.copyWith(title: title);
        });
      }
    } catch (e) {
      // Ignore title generation errors
      debugPrint('Failed to generate thread title: $e');
    }
  }

  String _generateSimpleTitle(String message) {
    // Simple title generation - take first few words
    final words = message.split(' ').take(5).join(' ');
    return words.length > 30 ? '${words.substring(0, 30)}...' : words;
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _isSending) return;

    final userMessage = Message(
      threadId: widget.threadId,
      content: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    // Clear input and add user message immediately
    _messageController.clear();
    setState(() {
      _messages.add(userMessage);
      _isSending = true;
    });

    _scrollToBottom();

    try {
      // Save user message
      await _storage.addMessage(userMessage);

      // Get AI response
      final response = await _ai.generateCompletion(
        config: _config!,
        prompt: text,
        conversationHistory:
            _messages.where((m) => m.type == MessageType.text).toList(),
      );

      final aiMessage = Message(
        threadId: widget.threadId,
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
      );

      // Add AI message and save
      setState(() {
        _messages.add(aiMessage);
      });

      await _storage.addMessage(aiMessage);

      // Update thread title if it's the first exchange
      if (_thread!.title.isEmpty && _messages.length >= 2) {
        await _generateThreadTitle();
      }

      _scrollToBottom();
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _generateThreadTitle() async {
    if (_thread == null || _messages.length < 2) return;

    try {
      final title = await _ai.generateTitle(
        messages: _messages.take(4).toList(), // Use first few messages
        config: _config!,
      );

      if (title.isNotEmpty) {
        await _storage.updateThread(_thread!.id, {'title': title});
        setState(() {
          _thread = _thread!.copyWith(title: title);
        });
      }
    } catch (e) {
      // Ignore title generation errors
      debugPrint('Failed to generate thread title: $e');
    }
  }

  Future<void> _startRecording() async {
    if (_isRecording || !_config!.enableSpeechToText) return;

    try {
      final hasPermission = await _audio.requestPermission();
      if (!hasPermission) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Microphone permission is required for voice messages'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final recordingPath = await _audio.startRecording();

      setState(() {
        _isRecording = true;
        _recordingPath = recordingPath;
      });

      // Start haptic feedback
      HapticFeedback.lightImpact();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to start recording: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      await _audio.stopRecording();
      setState(() {
        _isRecording = false;
      });

      // Stop haptic feedback
      HapticFeedback.lightImpact();

      if (_recordingPath != null) {
        await _processAudioMessage(_recordingPath!);
      }
    } catch (e) {
      setState(() {
        _isRecording = false;
        _recordingPath = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to process recording: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _cancelRecording() async {
    if (!_isRecording) return;

    try {
      await _audio.cancelRecording();
      setState(() {
        _isRecording = false;
        _recordingPath = null;
      });

      HapticFeedback.lightImpact();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to cancel recording: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _processAudioMessage(String audioPath) async {
    setState(() {
      _isSending = true;
    });

    try {
      // Create audio message
      final audioMessage = Message.withAudio(
        threadId: widget.threadId,
        audioPath: audioPath,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(audioMessage);
      });

      await _storage.addMessage(audioMessage);
      _scrollToBottom();

      // Convert speech to text
      final transcription = await _ai.speechToText(
        audioPath: audioPath,
        config: _config!,
      );

      if (transcription.isNotEmpty) {
        // Get AI response to transcribed text
        final response = await _ai.generateCompletion(
          messages: [
            ..._messages.where((m) => m.content.isNotEmpty)
          ], // Exclude audio-only messages
          config: _config!,
          userInput: transcription,
        );

        final aiMessage = Message(
          threadId: widget.threadId,
          content: response,
          isUser: false,
          timestamp: DateTime.now(),
        );

        setState(() {
          _messages.add(aiMessage);
        });

        await _storage.addMessage(aiMessage);
        _scrollToBottom();

        // Update thread title if needed
        if (_thread!.title.isEmpty) {
          await _generateThreadTitle();
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to process audio: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
        _recordingPath = null;
      });
    }
  }

  Future<void> _attachFile() async {
    if (!_config!.enableFileProcessing) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File processing is disabled'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      final file = await _fileService.pickFile();
      if (file == null) return;

      // Validate file
      final isValid = await _fileService.validateFile(file, _config!);
      if (!isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('File type or size not supported'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Create file message
      final fileMessage = Message.withFile(
        threadId: widget.threadId,
        filePath: file.path,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(fileMessage);
        _isSending = true;
      });

      await _storage.addMessage(fileMessage);
      _scrollToBottom();

      // Process file with AI
      final analysis = await _ai.processFile(
        filePath: file.path,
        config: _config!,
      );

      final aiMessage = Message(
        threadId: widget.threadId,
        content: analysis,
        isUser: false,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(aiMessage);
      });

      await _storage.addMessage(aiMessage);
      _scrollToBottom();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to process file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _attachImage() async {
    if (!_config!.enableImageProcessing) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image processing is disabled'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      final image = await _fileService.pickImage();
      if (image == null) return;

      // Create image message
      final imageMessage = Message.withImage(
        threadId: widget.threadId,
        imagePath: image.path,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(imageMessage);
        _isSending = true;
      });

      await _storage.addMessage(imageMessage);
      _scrollToBottom();

      // Analyze image with AI
      final analysis = await _ai.analyzeImage(
        imagePath: image.path,
        config: _config!,
      );

      final aiMessage = Message(
        threadId: widget.threadId,
        content: analysis,
        isUser: false,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(aiMessage);
      });

      await _storage.addMessage(aiMessage);
      _scrollToBottom();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to process image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _thread?.title.isEmpty == true
              ? 'New Thread'
              : _thread?.title ?? 'Chat',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _thread != null ? () => _shareThread() : null,
            tooltip: 'Share Thread',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'rename',
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Rename'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'clear',
                child: ListTile(
                  leading: Icon(Icons.clear),
                  title: Text('Clear Messages'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('Delete Thread',
                      style: TextStyle(color: Colors.red)),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _buildErrorState()
              : Column(
                  children: [
                    Expanded(
                      child: _buildMessagesList(),
                    ),
                    _buildInputArea(),
                  ],
                ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            _error!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadThreadData,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    if (_messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Start a conversation',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Type a message, record audio, or attach files',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16.0),
      itemCount: _messages.length + (_isSending ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _messages.length) {
          return _buildTypingIndicator();
        }
        return _buildMessageBubble(_messages[index]);
      },
    );
  }

  Widget _buildMessageBubble(Message message) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.hasAudio) _buildAudioContent(message),
            if (message.hasImage) _buildImageContent(message),
            if (message.hasFile) _buildFileContent(message),
            if (message.content.isNotEmpty)
              Text(
                message.content,
                style: TextStyle(
                  color: isUser
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(height: 4),
            Text(
              _formatMessageTime(message.timestamp),
              style: TextStyle(
                fontSize: 11,
                color: (isUser
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurfaceVariant)
                    .withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioContent(Message message) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.audiotrack, size: 20),
          const SizedBox(width: 8),
          const Text('Audio message'),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.play_arrow, size: 20),
            onPressed: () => _playAudio(message.audioPath!),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContent(Message message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          message.imagePath!,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 200,
            height: 200,
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }

  Widget _buildFileContent(Message message) {
    final fileName = message.filePath!.split('/').last;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.attach_file, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              fileName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'AI is thinking...',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            if (_isRecording) _buildRecordingIndicator(),
            Row(
              children: [
                // Attachment button
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: _showAttachmentOptions,
                ),

                // Text input
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    focusNode: _messageFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),

                const SizedBox(width: 8),

                // Send/Record button
                _buildSendButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingIndicator() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Recording...',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
            onPressed: _cancelRecording,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildSendButton() {
    final hasText = _messageController.text.trim().isNotEmpty;

    if (_isRecording) {
      return IconButton(
        icon: const Icon(Icons.stop, color: Colors.red),
        onPressed: _stopRecording,
      );
    }

    if (hasText) {
      return IconButton(
        icon: Icon(
          Icons.send,
          color:
              _isSending ? Colors.grey : Theme.of(context).colorScheme.primary,
        ),
        onPressed: _isSending ? null : _sendMessage,
      );
    }

    return IconButton(
      icon: const Icon(Icons.mic),
      onPressed: _config?.enableSpeechToText == true ? _startRecording : null,
    );
  }

  void _showAttachmentOptions() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Image'),
            onTap: () {
              Navigator.pop(context);
              _attachImage();
            },
            enabled: _config?.enableImageProcessing == true,
          ),
          ListTile(
            leading: const Icon(Icons.attach_file),
            title: const Text('File'),
            onTap: () {
              Navigator.pop(context);
              _attachFile();
            },
            enabled: _config?.enableFileProcessing == true,
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              _takePhoto();
            },
            enabled: _config?.enableImageProcessing == true,
          ),
        ],
      ),
    );
  }

  Future<void> _takePhoto() async {
    try {
      final image = await _fileService.takePhoto();
      if (image == null) return;

      // Process same as picked image
      final imageMessage = Message.withImage(
        threadId: widget.threadId,
        imagePath: image.path,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(imageMessage);
        _isSending = true;
      });

      await _storage.addMessage(imageMessage);
      _scrollToBottom();

      final analysis = await _ai.analyzeImage(
        imagePath: image.path,
        config: _config!,
      );

      final aiMessage = Message(
        threadId: widget.threadId,
        content: analysis,
        isUser: false,
        timestamp: DateTime.now(),
      );

      setState(() {
        _messages.add(aiMessage);
      });

      await _storage.addMessage(aiMessage);
      _scrollToBottom();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to take photo: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _playAudio(String audioPath) async {
    try {
      await _audio.playAudio(audioPath);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to play audio: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _formatMessageTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else if (difference.inMinutes < 1) {
      return 'Just now';
    } else {
      return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'rename':
        _renameThread();
        break;
      case 'clear':
        _clearMessages();
        break;
      case 'delete':
        _deleteThread();
        break;
    }
  }

  Future<void> _renameThread() async {
    final controller = TextEditingController(text: _thread?.title ?? '');

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rename Thread'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter new title',
            border: OutlineInputBorder(),
          ),
          maxLines: 1,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      try {
        await _storage.updateThread(_thread!.id, {'title': result});
        setState(() {
          _thread = _thread!.copyWith(title: result);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to rename thread: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _clearMessages() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Messages'),
        content: const Text(
          'Are you sure you want to delete all messages in this thread?\n\nThis action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _storage.clearThreadMessages(widget.threadId);
        setState(() {
          _messages.clear();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to clear messages: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteThread() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Thread'),
        content: Text(
          'Are you sure you want to delete "${_thread?.title ?? 'this thread'}"?\n\nThis will delete the thread and all its messages. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _storage.deleteThread(_thread!.id);

        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete thread: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _shareThread() async {
    // TODO: Implement thread sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share feature coming soon!')),
    );
  }
}
