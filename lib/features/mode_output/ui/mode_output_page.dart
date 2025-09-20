import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

import '../bloc/mode_output_bloc.dart';
import '../models/mode_outputs_state.dart';

/// Main mode output page that displays generated outputs for a specific thread and mode
class ModeOutputPage extends ConsumerWidget {
  final int threadId;
  final int modeId;

  const ModeOutputPage({
    super.key,
    required this.threadId,
    required this.modeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(modeOutputBlocProvider(threadId, modeId));
    final bloc = ref.read(modeOutputBlocProvider(threadId, modeId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.currentMode?.name ?? 'Output'),
        actions: [
          if (state.outputs.isNotEmpty) ...[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${state.currentIndex + 1}/${state.totalOutputs}',
                  style: const TextStyle(fontFeatures: []),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.copy_rounded),
              tooltip: 'Copy',
              onPressed: () => _copy(context, state.currentOutput!.content),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              tooltip: 'Delete',
              onPressed: state.outputs.length > 1
                  ? () => _confirmDelete(context, bloc)
                  : null,
            ),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.isGenerating
            ? null
            : () async {
                try {
                  if (state.outputs.isEmpty) {
                    await bloc.generateOutput();
                  } else {
                    await bloc.regenerateCurrentOutput();
                  }
                } catch (e) {
                  if (context.mounted) {
                    _snack(context, 'Failed: $e', error: true);
                  }
                }
              },
        icon: state.isGenerating
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(state.outputs.isEmpty
                ? Icons.auto_awesome_rounded
                : Icons.refresh_rounded),
        label: Text(
          state.isGenerating
              ? 'Working...'
              : state.outputs.isEmpty
                  ? 'Generate'
                  : 'Regenerate',
        ),
      ),
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.outputs.isEmpty) {
            if (state.isGenerating) {
              return const _CenterMessage(
                icon: Icons.bolt_rounded,
                title: 'Generating...',
                subtitle: 'Please wait',
              );
            }
            return _Empty(onGenerate: bloc.generateOutput);
          }
          return _OutputView(state: state, bloc: bloc);
        },
      ),
    );
  }

  Future<void> _copy(BuildContext context, String content) async {
    try {
      await Clipboard.setData(ClipboardData(text: content));
      if (context.mounted) _snack(context, 'Copied to clipboard');
    } catch (e) {
      if (context.mounted) _snack(context, 'Copy failed: $e', error: true);
    }
  }

  Future<void> _confirmDelete(BuildContext context, ModeOutputBloc bloc) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete output?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          FilledButton.tonal(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete')),
        ],
      ),
    );
    if (ok == true) {
      try {
        await bloc.deleteCurrentOutput();
        if (context.mounted) _snack(context, 'Deleted');
      } catch (e) {
        if (context.mounted) _snack(context, 'Delete failed: $e', error: true);
      }
    }
  }

  void _snack(BuildContext context, String msg, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg),
          backgroundColor: error ? Theme.of(context).colorScheme.error : null),
    );
  }
}

// --- Minimal sub-widgets ---

class _Empty extends StatelessWidget {
  final Future<void> Function() onGenerate;
  const _Empty({required this.onGenerate});

  @override
  Widget build(BuildContext context) {
    return _CenterMessage(
      icon: Icons.article_outlined,
      title: 'No output yet',
      subtitle: 'Tap Generate to create one',
      action: FilledButton.icon(
        onPressed: onGenerate,
        icon: const Icon(Icons.auto_awesome_rounded),
        label: const Text('Generate'),
      ),
    );
  }
}

class _OutputView extends StatelessWidget {
  final ModeOutputsState state;
  final ModeOutputBloc bloc;
  const _OutputView({required this.state, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final output = state.currentOutput!;
    return Column(
      children: [
        if (state.outputs.length > 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: state.canGoBack ? bloc.goToPreviousOutput : null,
                ),
                Expanded(
                  child: Text(
                    _dateTimeLabel(output.createdAt),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right_rounded),
                  onPressed: state.canGoForward ? bloc.goToNextOutput : null,
                ),
              ],
            ),
          ),
        const Divider(height: 1),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GptMarkdown(output.content),
          ),
        ),
      ],
    );
  }
}

class _CenterMessage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? action;
  const _CenterMessage({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            if (action != null) ...[
              const SizedBox(height: 24),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

String _dateTimeLabel(DateTime dt) {
  final d = '${dt.day}/${dt.month}/${dt.year}';
  final t =
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  return '$d  •  $t';
}
