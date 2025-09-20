import 'package:flutter/material.dart';

import '../models/thread.dart';

class ThreadItemWidget extends StatelessWidget {
  final Thread thread;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onOpenLatestOutput; // New action: open latest mode output
  final VoidCallback?
      onQuickRecord; // New action: jump to chat & start recording
  final bool isDeleting;

  const ThreadItemWidget({
    super.key,
    required this.thread,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    this.onOpenLatestOutput,
    this.onQuickRecord,
    this.isDeleting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDeleting ? 0.5 : 1,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12.0),
        child: InkWell(
          onTap: isDeleting ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        thread.name.isEmpty ? 'Untitled Thread' : thread.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatDate(thread.createdAt),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (isDeleting)
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      else
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              if (onOpenLatestOutput != null)
                                IconButton(
                                  icon: const Icon(Icons.auto_awesome),
                                  tooltip: 'Latest output',
                                  onPressed: onOpenLatestOutput,
                                ),
                              if (onQuickRecord != null)
                                IconButton(
                                  icon: const Icon(Icons.mic),
                                  tooltip: 'Quick record',
                                  onPressed: onQuickRecord,
                                ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                tooltip: 'Edit project',
                                onPressed: onEdit,
                              ),
                              if (onDelete != null)
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  tooltip: 'Delete project',
                                  onPressed: onDelete,
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return '1 day ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
      } else {
        final months = (difference.inDays / 30).floor();
        return months == 1 ? '1 month ago' : '$months months ago';
      }
    } else if (difference.inHours > 0) {
      return difference.inHours == 1
          ? '1 hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return difference.inMinutes == 1
          ? '1 minute ago'
          : '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}

// Removed _SmallIconButton; using standard IconButton for accessible targets.
