import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/media_attachment.dart';

part 'media_bloc.g.dart';

@riverpod
class MediaBloc extends _$MediaBloc {
  @override
  List<MediaAttachment> build() {
    // Return empty list for now
    return [];
  }

  /// Add media attachment
  void addAttachment(MediaAttachment attachment) {
    state = [...state, attachment];
  }

  /// Remove media attachment
  void removeAttachment(String path) {
    state = state.where((attachment) => attachment.path != path).toList();
  }

  /// Clear all attachments
  void clearAttachments() {
    state = [];
  }
}
