---
mode: agent
---
Task Summary:
	Generate or refine a Riverpod state management bloc (class-based @riverpod or functional provider) with clear state modeling, persistence (Isar when specified), and side-effect boundaries.

Objectives:
	- Produce a new bloc or improve an existing one per user description.
	- Support both class-based (@riverpod class ... extends _...) and functional providers (e.g. @riverpod FutureOr<T> foo(FooRef ref)).
	- Model immutable state with copyWith / data classes when multiple fields.
	- Integrate Isar persistence if requested (load initial state, save mutations) without uncontrolled listeners unless explicitly asked.
	- Emit minimal, testable logic: no UI concerns.
	- Include doc comments for public APIs.

Scope:
	In:
		- State class / record definitions
		- Provider annotations and generated part directives
		- Persistence hooks (load/save) for Isar collections
		- Error handling strategy (sealed states or Result pattern) when requested
	Out:
		- UI widgets
		- Network client full implementations (use abstraction / stub)
		- Unrelated architecture changes

Inputs:
	- User description of desired bloc purpose
	- Existing file snippet (optional)
	- Persistence requirements (optional)
	- Side effects specification (optional)

Outputs:
	- Complete bloc source (ready for codegen via build_runner)
	- Optional diff if refining existing code
	- Brief usage example (1–3 lines) unless user disables

Constraints:
	- Keep bloc class ≤ 150 lines unless complex persistence logic required
	- Avoid premature optimization; no micro-perf hacks
	- Use explicit return types (no implicit dynamic)
	- Null safety enforced; no ! unless justified via comment
	- Isar writes wrapped in writeTxn; reads prefer sync only in build() if fast
	- Avoid starting background listeners unless user requests

Workflow:
	1. Parse user request; identify: provider type (class/functional), sync vs async, persistence.
	2. Define state shape (single value vs model vs sealed union) with rationale.
	3. Sketch contract (inputs, outputs, side effects, error modes) in comments (removed in final if user wants minimal).
	4. Implement provider with proper annotation & part directives.
	5. Add persistence (load, save, optional reload) if requested; ensure id management.
	6. Add mutation methods with small, focused responsibilities.
	7. Provide minimal usage example.
	8. (If refinement) produce unified diff then final version.

Quality Gates:
	- Compiles under analyzer (no errors; warnings minimized)
	- State transitions pure & synchronous unless marked async
	- No hidden side effects inside getters
	- Persistence paths (Isar) handle absent records gracefully

Edge Cases / Failure Handling:
	- Missing persistence layer -> fallback to in-memory state
	- Save failures -> surface via returned Result / exception with context
	- Concurrent saves -> serialize via awaiting same txn
	- Empty initial data set -> create default state constant

Assumptions:
	- Riverpod codegen (`riverpod_annotation`) + build_runner available
	- Isar collection accessor naming follows <model>s (e.g., isar.configurations)

Success Criteria:
	- User can run build_runner without manual edits
	- Methods are cohesive (one concern each)
	- Optional persistence works (load->mutate->save->reload yields updated state)

Examples:
	# Class-based simple value bloc
	@riverpod
	class CounterBloc extends _$CounterBloc {
		@override
		int build() => 0;
		void increment() => state += 1;
	}

	# Functional async provider with Isar fetch
	@riverpod
	Future<Configuration> configuration(ConfigurationRef ref) async {
		final isar = ref.read(isarProvider);
		return await isar.configurations.where().limit(1).findFirst() ?? const Configuration(modelName: '', apiKey: '');
	}

	# Class-based bloc with persistence helper
	@riverpod
	class ConfigurationBloc extends _$ConfigurationBloc {
		@override
		Configuration build() {
			final isar = ref.read(isarProvider);
			return isar.configurations.where().limit(1).findFirstSync() ?? const Configuration(modelName: '', apiKey: '');
		}
		Future<void> save() async {
			final isar = ref.read(isarProvider);
			await isar.writeTxn(() async { await isar.configurations.put(state); });
		}
		void updateApiKey(String v) => state = state.copyWith(apiKey: v);
	}

Directive:
	When user says "minimal" -> omit Objectives/Scope/Assumptions sections and show only front matter + code.

END