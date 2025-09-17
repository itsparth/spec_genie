import 'package:dart_mappable/dart_mappable.dart';
import '../models/mode.dart';

part 'mode_state.mapper.dart';

/// Immutable state for the ModesBloc.
/// Holds the full list of modes and the currently selected mode id (if any).
@MappableClass()
class ModeState with ModeStateMappable {
  /// All modes (persisted + defaults). Immutable list.
  final List<Mode> modes;

  /// Currently selected mode id.
  final int? selectedId;

  const ModeState({
    required this.modes,
    this.selectedId,
  });

  const ModeState.initial()
      : modes = const [],
        selectedId = null;

  static const empty = ModeState.initial();

  /// Returns the currently selected [Mode] or null.
  Mode? get selected {
    final id = selectedId;
    if (id == null) return null;
    for (final m in modes) {
      if (m.id == id) return m;
    }
    return null;
  }
}
