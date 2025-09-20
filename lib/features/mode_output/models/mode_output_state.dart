import 'package:dart_mappable/dart_mappable.dart';

import 'mode_output.dart';

part 'mode_output_state.mapper.dart';

@MappableClass()
class ModeOutputState with ModeOutputStateMappable {
  final ModeOutput? output;
  final bool isGenerating;
  final String? error;

  const ModeOutputState({
    this.output,
    this.isGenerating = false,
    this.error,
  });

  /// Create a loading state while generating
  const ModeOutputState.generating({
    this.output,
    this.error,
  }) : isGenerating = true;

  /// Create a completed state with output
  const ModeOutputState.completed({
    required this.output,
    this.error,
  }) : isGenerating = false;

  /// Create an error state
  const ModeOutputState.error({
    this.output,
    required this.error,
  }) : isGenerating = false;

  /// Check if we have valid output
  bool get hasOutput => output != null;

  /// Check if we're in a ready state (not loading, no errors)
  bool get isReady => !isGenerating && error == null;
}
