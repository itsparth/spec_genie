import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/mode_output.dart';
import '../../modes/models/mode.dart';

part 'mode_outputs_state.mapper.dart';

@MappableClass()
class ModeOutputsState with ModeOutputsStateMappable {
  final IList<ModeOutput> outputs;
  final bool isLoading;
  final int currentIndex;
  final bool isGenerating;
  final String? streamingContent;
  final int? streamingIndex;
  final Mode? currentMode;

  const ModeOutputsState({
    this.outputs = const IListConst([]),
    this.isLoading = false,
    this.currentIndex = 0,
    this.isGenerating = false,
    this.streamingContent,
    this.streamingIndex,
    this.currentMode,
  });

  /// Get the current mode output being displayed
  ModeOutput? get currentOutput {
    if (outputs.isEmpty || currentIndex < 0 || currentIndex >= outputs.length) {
      return null;
    }
    return outputs[currentIndex];
  }

  /// Get the effective content for the current output (streaming or completed)
  String? get currentContent {
    final output = currentOutput;
    if (output == null) return null;

    // If we're generating and this is the streaming output, return streaming content
    if (isGenerating &&
        streamingIndex == currentIndex &&
        streamingContent != null) {
      return streamingContent;
    }

    // Otherwise return the completed content
    return output.content;
  }

  /// Check if we can navigate to previous output
  bool get canGoBack => currentIndex > 0;

  /// Check if we can navigate to next output
  bool get canGoForward => currentIndex < outputs.length - 1;

  /// Get the total number of outputs
  int get totalOutputs => outputs.length;
}
