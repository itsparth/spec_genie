import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/mode_output.dart';

part 'mode_output_state.mapper.dart';

@MappableClass()
class ModeOutputState with ModeOutputStateMappable {
  final IList<ModeOutput> outputs;
  final bool isLoading;
  final bool isGenerating;
  final String? error;
  final int currentIndex;

  const ModeOutputState({
    this.outputs = const IListConst([]),
    this.isLoading = false,
    this.isGenerating = false,
    this.error,
    this.currentIndex = 0,
  });

  /// Get the current mode output being displayed
  ModeOutput? get currentOutput {
    if (outputs.isEmpty || currentIndex < 0 || currentIndex >= outputs.length) {
      return null;
    }
    return outputs[currentIndex];
  }

  /// Check if we can navigate to previous output
  bool get canGoBack => currentIndex > 0;

  /// Check if we can navigate to next output
  bool get canGoForward => currentIndex < outputs.length - 1;

  /// Get the total number of outputs
  int get totalOutputs => outputs.length;
}
