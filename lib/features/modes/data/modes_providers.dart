import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import '../models/mode.dart';
import 'modes_repository.dart';

/// Provides a singleton ModesRepository.
final modesRepositoryProvider = Provider<ModesRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return ModesRepository(isar);
});

/// Internal default seed list (kept here to share with bloc or other consumers if needed)
final _defaultModes = [
  Mode(
    id: Isar.autoIncrement,
    name: 'Summary',
    prompt:
        'Organize the content into a concise, well-structured summary capturing all key points.',
  ),
  Mode(
    id: Isar.autoIncrement,
    name: 'Spec',
    prompt:
        'Organize the content into a product specification with: Overview, Goals/Non-Goals, Scope, Constraints, Stakeholders, Functional/Non-Functional Requirements, User Stories, Data/Integrations, Risks, and Open Questions.',
  ),
  Mode(
    id: Isar.autoIncrement,
    name: 'Detailed Summary',
    prompt:
        'Organize the content into a comprehensive summary with sections: Overview, Key Themes, Detailed Breakdown, Data/Metrics, Decisions/Rationale, Constraints, Edge Cases, Risks, Open Questions, and Potential Inferences.',
  ),
];

/// Watches all modes. Seeds defaults if empty on first listen.
final watchAllModesProvider = StreamProvider<List<Mode>>((ref) async* {
  final repo = ref.watch(modesRepositoryProvider);
  if (repo.getAllModesSync().isEmpty) {
    await repo.seedDefaults(_defaultModes);
  }
  yield* repo.watchAllModes();
});
