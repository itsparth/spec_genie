import 'package:isar_community/isar.dart';
import '../models/mode.dart';

/// Repository responsible for all Isar database access for Modes.
/// Keeps persistence concerns out of bloc/provider logic.
class ModesRepository {
  ModesRepository(this._isar);

  final Isar _isar;

  /// Fetch all modes synchronously.
  List<Mode> getAllModesSync() => _isar.modes.where().findAllSync();

  /// Fetch all modes asynchronously.
  Future<List<Mode>> getAllModes() => _isar.modes.where().findAll();

  /// Watch all modes for changes.
  Stream<List<Mode>> watchAllModes() =>
      _isar.modes.where().watch(fireImmediately: true);

  /// Add a new editable mode.
  Future<Mode> addEditableMode(
      {required String name, required String prompt}) async {
    final mode = Mode(name: name, prompt: prompt, isEditable: true);
    late Mode stored;
    await _isar.writeTxn(() async {
      final id = await _isar.modes.put(mode);
      stored = (await _isar.modes.get(id))!;
    });
    return stored;
  }

  /// Update an existing mode (must exist & be editable). Returns updated or null.
  Future<Mode?> updateMode(int id, {String? name, String? prompt}) async {
    final existing = _isar.modes.getSync(id);
    if (existing == null || !existing.isEditable) return null;
    final updated = existing.copyWith(
      name: name ?? existing.name,
      prompt: prompt ?? existing.prompt,
    );
    await _isar.writeTxn(() async {
      await _isar.modes.put(updated);
    });
    return updated;
  }

  /// Delete a mode by id if editable. Returns true if deleted.
  Future<bool> deleteMode(int id) async {
    final existing = _isar.modes.getSync(id);
    if (existing == null || !existing.isEditable) return false;
    bool deleted = false;
    await _isar.writeTxn(() async {
      deleted = await _isar.modes.delete(id);
    });
    return deleted;
  }

  /// Seed default modes if database empty. Returns inserted list (may be empty if already populated).
  Future<List<Mode>> seedDefaults(List<Mode> defaults) async {
    final currentCount = _isar.modes.countSync();
    if (currentCount > 0) return const [];
    final inserted = <Mode>[];
    await _isar.writeTxn(() async {
      for (final m in defaults) {
        final id = await _isar.modes.put(m);
        final stored = await _isar.modes.get(id);
        if (stored != null) inserted.add(stored);
      }
    });
    return inserted;
  }
}
