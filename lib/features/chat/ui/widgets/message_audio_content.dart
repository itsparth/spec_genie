import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bloc/message_bloc.dart';
import '../../models/message.dart';

class MessageAudioContent extends ConsumerWidget {
  const MessageAudioContent({super.key, required this.messageId});
  final int messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageBlocProvider(messageId));
    final msg = state.message;
    final cs = Theme.of(context).colorScheme;

    if (msg.type != MessageType.audio) return const SizedBox.shrink();

    String truncate(String? name) {
      if (name == null || name.isEmpty) return 'Audio';
      if (name.length <= 8) return name;
      return '${name.substring(0, 8)}...';
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.primaryContainer.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border:
            Border.all(color: cs.primary.withValues(alpha: 0.15), width: 0.5),
      ),
      child: Column(children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.audiotrack_rounded, color: cs.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(truncate(msg.fileName),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: cs.primary)),
                if (msg.transcript?.isNotEmpty == true) ...[
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => _showTranscript(context, msg),
                    child: Text(
                      msg.transcript!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.7),
                          height: 1.3),
                    ),
                  ),
                ] else if (state.isProcessing) ...[
                  const SizedBox(height: 4),
                  Row(children: [
                    SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                cs.primary.withValues(alpha: 0.6)))),
                    const SizedBox(width: 6),
                    Text('Transcribing audio...',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: cs.primary.withValues(alpha: 0.7),
                            height: 1.3,
                            fontStyle: FontStyle.italic)),
                  ])
                ],
              ])),
          const SizedBox(width: 8),
          if (msg.transcript?.isNotEmpty == true) ...[
            Tooltip(
                message: 'View full transcript',
                child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => _showTranscript(context, msg),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: cs.secondary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.text_snippet_outlined,
                              color: cs.secondary, size: 18)),
                    ))),
            const SizedBox(width: 8),
          ],
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: msg.fileData != null
                  ? () => ref
                      .read(messageBlocProvider(messageId).notifier)
                      .togglePlayback()
                  : null,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: msg.fileData != null
                      ? cs.primary.withValues(alpha: 0.1)
                      : cs.outline.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: state.isAudioLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(cs.primary)))
                    : Icon(
                        msg.fileData == null
                            ? Icons.error_outline_rounded
                            : state.isAudioPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                        color: msg.fileData != null ? cs.primary : cs.outline,
                        size: 20,
                      ),
              ),
            ),
          ),
        ]),
        if (state.isAudioPlaying || state.audioPositionMs > 0) ...[
          const SizedBox(height: 8),
          Row(children: [
            Text(_format(Duration(milliseconds: state.audioPositionMs)),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.6), fontSize: 11)),
            const SizedBox(width: 6),
            Expanded(
                child: SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 1.5,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 5),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 10)),
                    child: Slider(
                      value: state.audioDurationMs > 0
                          ? (state.audioPositionMs / state.audioDurationMs)
                              .clamp(0.0, 1.0)
                          : 0.0,
                      onChanged: (v) => ref
                          .read(messageBlocProvider(messageId).notifier)
                          .seekAudio(v),
                      activeColor: cs.primary,
                      inactiveColor: cs.onSurface.withValues(alpha: 0.2),
                    ))),
            const SizedBox(width: 6),
            Text(_format(Duration(milliseconds: state.audioDurationMs)),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.6), fontSize: 11)),
          ])
        ]
      ]),
    );
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final h = d.inHours > 0 ? '${two(d.inHours)}:' : '';
    return '$h${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}';
  }

  Future<void> _showTranscript(BuildContext context, Message m) async {
    if (m.transcript?.isEmpty ?? true) return;
    final cs = Theme.of(context).colorScheme;
    await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Row(children: [
                Icon(Icons.text_snippet_outlined,
                    color: cs.secondary, size: 20),
                const SizedBox(width: 8),
                const Text('Audio Transcript')
              ]),
              content: Container(
                  constraints:
                      const BoxConstraints(maxHeight: 400, maxWidth: 400),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        if (m.fileName?.isNotEmpty == true) ...[
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color:
                                      cs.surfaceVariant.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(children: [
                                Icon(Icons.audiotrack_rounded,
                                    size: 16, color: cs.secondary),
                                const SizedBox(width: 6),
                                Expanded(
                                    child: Text(m.fileName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500))),
                              ])),
                          const SizedBox(height: 16)
                        ],
                        SelectableText(m.transcript!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(height: 1.5)),
                      ]))),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Close'))
              ],
              actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            ));
  }
}
