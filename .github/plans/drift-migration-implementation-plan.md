# Drift Migration Implementation Plan

Branch: `drift-migrate`
Prepared: 2025-09-18
Status: Draft (v0.1)
Owner: (assign)

---
## 1. Objectives
Migrate persistence layer from Isar to Drift (SQLite) to gain:
- Mature relational model (FK constraints, ad-hoc SQL, joins)
- Deterministic migrations & schema evolution
- Better tooling (schema exports, DevTools, query validation)
- Cross-platform consistency / potential web & desktop parity
- Easier integration with analytics / future sync layer

Non‑Goals (initial phase):
- Offline sync engine
- Full-text search
- Encryption (can be a follow-up)

Success Criteria:
- 100% of Isar-stored entities represented in Drift with correct relationships
- Data migration preserves row counts & referential integrity (zero loss)
- Feature parity in UI & state management (no regressions in tests)
- Migration executable < 5 minutes on expected dataset size
- Rollback path validated (restore from Isar export)

---
## 2. Current Isar Inventory (Completed)
Entities:
1. Configuration(id, apiKey, baseUrl?, modelName)
2. Thread(id, name, createdAt, backlinks: messages, modeOutputs)
3. Message(id, text, timestamp, type(enum), description, fileData(blob?), mimeType?, transcript?, fileName?, links: thread, tags[m2m])
4. Mode(id, name, prompt, isEditable, backlinks: modeOutputs)
5. ModeOutput(id, createdAt, content, links: thread, mode)
6. Tag(id, name, description, isEditable, backlinks: messages)

Relationships:
- Thread 1 - * Message
- Thread 1 - * ModeOutput
- Mode 1 - * ModeOutput
- Message * - * Tag (implicit via IsarLinks)
- Message * - 1 Thread
- ModeOutput * - 1 Thread
- ModeOutput * - 1 Mode

Special Types:
- Enum: MessageType(text|audio|image) stored by name
- Binary: Message.fileData (List<int>?)
- DateTime fields: createdAt / timestamp (need ISO-8601 decision)

Query Patterns:
- Ordered listings: Threads sorted by createdAt desc
- Filter-less loads: .where().findAllSync()
- Simple CRUD in writeTxn
- Seeding default Modes on empty

---
## 3. Target Drift Schema Design (Draft)
### 3.1 Conventions
- Table names: snake_case plural (threads, messages, tags, modes, mode_outputs, configuration, message_tags)
- Primary keys: INTEGER AUTOINCREMENT
- Created timestamps: NOT NULL, stored as TEXT ISO-8601 (config option)
- Foreign keys: ON DELETE CASCADE (where safe) or RESTRICT (configuration)
- Many-to-many via join table

### 3.2 Tables
configuration(
  id INTEGER PK AUTOINCREMENT,
  api_key TEXT NOT NULL DEFAULT '',
  base_url TEXT NULL,
  model_name TEXT NOT NULL
)

threads(
  id INTEGER PK AUTOINCREMENT,
  name TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL
)

modes(
  id INTEGER PK AUTOINCREMENT,
  name TEXT NOT NULL,
  prompt TEXT NOT NULL,
  is_editable INTEGER NOT NULL DEFAULT 1
)

messages(
  id INTEGER PK AUTOINCREMENT,
  thread_id INTEGER NOT NULL REFERENCES threads(id) ON DELETE CASCADE,
  text TEXT NOT NULL DEFAULT '',
  timestamp TEXT NOT NULL,
  type TEXT NOT NULL, -- enum name
  description TEXT NOT NULL DEFAULT '',
  file_data BLOB NULL,
  mime_type TEXT NULL,
  transcript TEXT NULL,
  file_name TEXT NULL
)

mode_outputs(
  id INTEGER PK AUTOINCREMENT,
  thread_id INTEGER NOT NULL REFERENCES threads(id) ON DELETE CASCADE,
  mode_id INTEGER NOT NULL REFERENCES modes(id) ON DELETE CASCADE,
  created_at TEXT NOT NULL,
  content TEXT NOT NULL
)

tags(
  id INTEGER PK AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  is_editable INTEGER NOT NULL DEFAULT 1
)

message_tags(
  message_id INTEGER NOT NULL REFERENCES messages(id) ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY(message_id, tag_id)
)

### 3.3 Indexes (Initial)
- messages(thread_id, timestamp)
- mode_outputs(thread_id, created_at)
- mode_outputs(mode_id)
- message_tags(tag_id)
- tags(name) (optional unique? — decide later)
- modes(name) (optional unique? — non-editable seed names + user additions)

### 3.4 Enum Handling
MessageType -> TEXT CHECK(type IN ('text','audio','image')) or custom TypeConverter. Start with CHECK.

### 3.5 DateTime Strategy
Use build.yaml: store_date_time_values_as_text: true (ISO-8601). Insert & compare in UTC.

### 3.6 Future-Proofing
- Add potential composite index (thread_id, id) if pagination required
- Consider FTS virtual table for content later (messages_fts)

---
## 4. Drift Project Configuration
Dependencies (pubspec):
  drift, drift_flutter, path_provider, sqlite3 perhaps (if needed), drift_dev, build_runner

Directory Layout:
lib/database/
  database.dart (AppDatabase)
  tables/
    threads.dart
    messages.dart
    modes.dart
    mode_outputs.dart
    tags.dart
    configuration.dart
    message_tags.dart (optional inline definition)
  converters/
    message_type_converter.dart (if not using CHECK)
  migrations/
    schema_v1.drift (optional export)

Generation Options (build.yaml):
store_date_time_values_as_text: true
use_sql_column_name_as_json_key: false (retain Dart naming in JSON) — keep unless drift files added

---
## 5. Architectural Transition
Approach: Strangler pattern with dual layer
1. Introduce repository interfaces (ConfigurationRepository, ThreadRepository, etc.) returning domain models (existing dart_mappable classes OR new drift rows mapped).
2. Initial implementation continues to wrap Isar (baseline tests).
3. Add Drift implementation behind feature flag (env var or const bool enableDrift = true in drift-migrate branch).
4. Toggle read path to Drift (shadow mode):
   - Write: both Isar + Drift (dual-write) for limited period
   - Read: still Isar, except opt-in screens (controlled via flag)
5. Once validated, cut reads to Drift only.
6. Remove Isar dual writes, then remove Isar dependency.

Provider Changes:
- New `driftDatabaseProvider` (autoDispose) supplying `AppDatabase`
- Repositories injected via Riverpod families
- UI blocs consume repositories; remove direct `isarProvider` usage.

---
## 6. Data Migration Pipeline
### 6.1 Export Phase
Write `tool/export_isar.dart`:
- Open Isar with schemas
- Stream collections: chunk (e.g., 500)
- Emit JSON arrays or NDJSON preserving IDs
- For links:
  - For Message.tags produce join rows list
- Output files under `migration_exports/`:
  configuration.json (single object or empty)
  threads.ndjson
  messages.ndjson
  modes.ndjson (seed + user)
  mode_outputs.ndjson
  tags.ndjson
  message_tags.ndjson

### 6.2 Import Phase (Drift)
`tool/import_to_drift.dart`:
- Initialize Drift db
- Disable foreign_keys then bulk insert within transaction batches
- Order: configuration, threads, modes, tags, messages, mode_outputs, message_tags
- Re-enable foreign_keys and run integrity checks (count comparisons)

### 6.3 Verification
`tool/verify_migration.dart`:
- Compare counts vs export metadata
- Spot-check random samples (e.g., pick 5 messages ensure tags set)
- Hash content (SHA256) to ensure fidelity for large text/blob fields

### 6.4 Performance Targets
- Batch insert size tunable (200-1000 rows)
- Use `batch` API in Drift

---
## 7. Incremental Adoption Phases
| Phase | Scope | Key Actions | Exit Criteria |
|-------|-------|-------------|---------------|
| 0 | Prep | Add drift deps, create schema, empty DB | Build passes |
| 1 | Dual Infra | Repos wrap Isar + stub Drift | Tests green |
| 2 | Drift Populated | Run export/import in dev; dual write | Row counts match |
| 3 | Shadow Reads | Selected read paths use Drift + compare in memory | No mismatches in logs over session |
| 4 | Full Cutover | All reads Drift; writes dual | 7 days stable |
| 5 | Decommission | Remove Isar writes, code, deps | Clean build, size drop |
| 6 | Cleanup | Add indices tuning, docs final | Perf >= baseline |

---
## 8. Model Layer Refactor
Strategy Options:
A) Keep existing domain classes (dart_mappable) and map Drift row classes -> domain
B) Use Drift-generated data classes directly & adapt serialization
Recommendation: A (separation of concerns; easier tests). Provide extension mappers.

Mapping Example:
```
extension MessageRowMapping on Message {
  MessagesCompanion toCompanion() => MessagesCompanion.insert(
    threadId: threadId,
    text: text,
    timestamp: timestamp,
    type: type.name,
    // ...
  );
}
```

Many-to-many (message_tags): custom DAO to load tags for message with join.

---
## 9. Repositories (Draft Interfaces)
```
abstract class ThreadRepository {
  Future<List<Thread>> list({int? limit});
  Future<Thread> create(Thread thread);
  Future<void> update(Thread thread);
  Future<void> delete(int id);
}
```
Provide `IsarThreadRepository` + `DriftThreadRepository` and composite `DualWriteThreadRepository`.

---
## 10. Testing & Validation
Layers:
1. Schema Tests: opening DB, foreign key enforcement
2. Repository Unit Tests: CRUD, filtering, ordering
3. Migration Tests: Run export->import on synthetic fixtures
4. Property Tests: Referential integrity (every message.thread_id exists)
5. Performance Benchmarks: Insert N messages compare time to Isar baseline
6. Regression: Snapshot counts pre/post cutover in CI

Test Data Harness: deterministic seed generator for messages/tags graph.

---
## 11. Index & Performance Plan
Initial Pragmas (optional runtime config):
- `PRAGMA foreign_keys = ON;`
- `PRAGMA journal_mode = WAL;`
- `PRAGMA synchronous = NORMAL;`

Monitor: query planner output for heavy queries (EXPLAIN QUERY PLAN) on listing screens.
Add indexes iteratively:
- `CREATE INDEX messages_thread_time ON messages(thread_id, timestamp);`
- `CREATE INDEX mode_outputs_thread_created ON mode_outputs(thread_id, created_at);`
- Consider covering index for tag filtering later.

---
## 12. Tooling & Scripts
- `tool/export_isar.dart`
- `tool/import_to_drift.dart`
- `tool/verify_migration.dart`
- `tool/dual_write_smoke_test.dart`
- Makefile or custom dart run tasks
- Logging with progress bars (e.g., simple stdout updates)

---
## 13. Risks & Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|
| Data loss during migration | High | Immutable JSON export backup, dry-run mode |
| Performance regression | Medium | Index profiling, batch sizing |
| Dual-write divergence | Medium | Verification script compares random samples |
| Enum value expansion later | Low | CHECK constraint easy to alter via migration |
| Blob size effect on WAL | Low | Optionally move large blobs to file storage later |
| Developer confusion (two systems) | Medium | Clear feature flag & phase timeline |

Rollback Trigger Examples:
- Verification script mismatch > 0.1%
- Crash rate increase related to DB stack

---
## 14. Documentation Updates
- README: new section "Database (Drift)"
- CONTRIBUTING: migration scripts usage
- Update `.github/prompts/*` to remove Isar-specific guidance
- Add diagrams (mermaid) for new schema

---
## 15. Timeline (Indicative)
| Week | Milestone |
|------|-----------|
| 1 | Schema + infra (Phase 0) |
| 2 | Repos + dual infra baseline (Phase 1) |
| 3 | Migration scripts + populated drift (Phase 2) |
| 4 | Shadow reads + validation (Phase 3) |
| 5 | Cutover + monitoring (Phase 4) |
| 6 | Decommission Isar (Phase 5) |
| 7 | Perf tuning & docs (Phase 6) |

---
## 16. Open Decisions
| Topic | Options | Tentative |
|-------|---------|-----------|
| Enum storage | TEXT + CHECK vs converter | TEXT + CHECK |
| Domain mapping | Separate domain vs direct row usage | Separate domain |
| Tag uniqueness | Enforce unique(name)? | Defer |
| DateTime TZ | Store UTC vs local | UTC |
| M2M load strategy | Manual joins vs generated views | Manual first |

---
## 17. Next Immediate Actions
1. Add drift dependencies + build.yaml option
2. Scaffold `lib/database/database.dart` with empty tables
3. Implement first table (threads) + run generator
4. Create drift provider & simple repository POC

---
## 18. Acceptance Checklist
- [ ] All tables created & code generated
- [ ] Migration scripts pass on sample data
- [ ] Dual write operational behind flag
- [ ] Verification logs stable 1 week
- [ ] Isar removed from dependency graph
- [ ] Docs updated & merged to main

---
(End of Plan)
