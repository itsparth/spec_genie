import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/mode_output_bloc.dart';
import '../bloc/mode_outputs_state.dart';

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
    final outputState = ref.watch(modeOutputBlocProvider(threadId, modeId));
    final outputBloc =
        ref.read(modeOutputBlocProvider(threadId, modeId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mode Output'),
        elevation: 0,
        actions: [
          if (outputState.outputs.isNotEmpty) ...[
            // Navigation counter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  '${outputState.currentIndex + 1} of ${outputState.totalOutputs}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            // Delete button
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: outputState.outputs.length > 1
                  ? () => _showDeleteConfirmation(context, outputBloc)
                  : null,
              tooltip: 'Delete current output',
            ),
          ],
        ],
      ),
      body: outputState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : outputState.outputs.isEmpty
              ? _buildEmptyState(context, outputBloc)
              : _buildOutputContent(context, outputState, outputBloc),
      floatingActionButton: FloatingActionButton(
        onPressed: () => outputBloc.generateOutput(),
        tooltip: 'Generate new output',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ModeOutputBloc outputBloc) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.auto_awesome,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          Text(
            'No outputs yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Generate your first output to see results here',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => outputBloc.generateOutput(),
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Generate Output'),
          ),
        ],
      ),
    );
  }

  Widget _buildOutputContent(
    BuildContext context,
    ModeOutputsState outputState,
    ModeOutputBloc outputBloc,
  ) {
    final currentOutput = outputState.currentOutput;
    if (currentOutput == null) {
      return const Center(child: Text('No output selected'));
    }

    return Column(
      children: [
        // Navigation controls
        if (outputState.outputs.length > 1)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: outputState.canGoBack
                      ? outputBloc.goToPreviousOutput
                      : null,
                  tooltip: 'Previous output',
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      _formatDate(currentOutput.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: outputState.canGoForward
                      ? outputBloc.goToNextOutput
                      : null,
                  tooltip: 'Next output',
                ),
              ],
            ),
          ),

        // Output content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Output metadata
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Generated on ${_formatDateTime(currentOutput.createdAt)}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () => outputBloc.regenerateCurrentOutput(),
                          tooltip: 'Regenerate',
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Main content
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SelectableText(
                      currentOutput.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatDateTime(DateTime date) {
    return '${_formatDate(date)} at ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    ModeOutputBloc outputBloc,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Output'),
        content: const Text(
          'Are you sure you want to delete this output? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await outputBloc.deleteCurrentOutput();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Output deleted successfully')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete output: $e')),
          );
        }
      }
    }
  }
}
