import 'package:flutter/material.dart';

class VoiceRecorder extends StatefulWidget {
  final void Function(String) onRecordingComplete;

  const VoiceRecorder({
    super.key,
    required this.onRecordingComplete,
  });

  @override
  State<VoiceRecorder> createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleRecording,
      icon: Icon(
        _isRecording ? Icons.stop : Icons.mic,
        color: _isRecording ? Colors.red : null,
      ),
      tooltip: _isRecording ? 'Stop recording' : 'Record audio',
    );
  }

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
    });

    if (!_isRecording) {
      // Simulate recording completion
      // TODO: Implement actual audio recording
      const dummyPath = '/path/to/recorded/audio.m4a';
      widget.onRecordingComplete(dummyPath);
    }
  }
}
