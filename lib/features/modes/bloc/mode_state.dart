import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/database/database.dart';

part 'mode_state.mapper.dart';

/// Immutable state for the ModesBloc.
/// Holds the full list of modes.
@MappableClass()
class ModeState with ModeStateMappable {
  /// All modes (persisted + defaults). Immutable list.
  final IList<ModeRow> modes;

  /// Whether a save operation is currently in progress.
  final bool isSaving;

  const ModeState({
    required this.modes,
    this.isSaving = false,
  });

  const ModeState.initial()
      : modes = const IListConst([]),
        isSaving = false;

  static const empty = ModeState.initial();
}
