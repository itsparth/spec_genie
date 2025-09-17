import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/mode_output.dart';

part 'mode_outputs_state.mapper.dart';

@MappableClass()
class ModeOutputsState with ModeOutputsStateMappable {
  final IList<ModeOutput> outputs;
  final bool isLoading;
  final int currentIndex;

  const ModeOutputsState({
    this.outputs = const IListConst([]),
    this.isLoading = false,
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
