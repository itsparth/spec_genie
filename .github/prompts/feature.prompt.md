---
mode: agent
---
Task Summary:
	Scaffold a complete Flutter feature module following the established architecture pattern. Generate models, bloc, state management, and directory structure with proper code generation setup.

Objectives:
	- Create feature directory under lib/features/<feature_name>/
	- Generate dart_mappable model with Isar collection annotations
	- Create Riverpod class-based bloc with state management
	- Setup proper code generation with part directives
	- Add basic utility functions if specified

Scope:
	In:
		- Directory structure creation (models/, bloc/, utils/)
		- Model classes with @MappableClass and @Collection annotations
		- Riverpod bloc with @riverpod class extending _$<Name>Bloc
		- State classes with dart_mappable support
		- Generated file part directives (.g.dart, .mapper.dart)
	Out:
		- UI widgets and screens
		- API integration logic
		- Complex business rules

Inputs:
	- feature_name (snake_case, required)
	- model_fields (list of field definitions with types)
	- bloc_methods (list of method signatures for state management)
	- requires_persistence (boolean, default: true)

Outputs:
	- lib/features/<feature_name>/models/<model>.dart
	- lib/features/<feature_name>/bloc/<feature>_bloc.dart  
	- lib/features/<feature_name>/bloc/<feature>_state.dart
	- lib/features/<feature_name>/utils/<feature>_utils.dart (if needed)

Constraints:
	- Follow dart_mappable over freezed for serialization
	- Use Riverpod 3.0+ class-based pattern (@riverpod class extends _$)
	- Keep models minimal (3-4 fields max per design philosophy)
	- Include Isar persistence hooks when requires_persistence=true
	- No external dependencies beyond project standard (riverpod_annotation, dart_mappable, isar_community)

Workflow:
	1. Validate feature_name (snake_case, not empty)
	2. Create directory structure: lib/features/<feature_name>/{models,bloc,utils}
	3. Generate model class with @MappableClass and @Collection annotations
	4. Create state class with dart_mappable support
	5. Generate bloc class with @riverpod annotation and persistence methods
	6. Add part directives for code generation
	7. Create utility functions if complex logic needed

Quality Gates:
	- All files compile without analyzer errors
	- Models follow @MappableClass pattern with proper part directives
	- Bloc follows @riverpod class <Name>Bloc extends _$<Name>Bloc pattern
	- State management is immutable with copyWith support
	- Proper imports for isar_community, dart_mappable, riverpod_annotation

Edge Cases:
	- Feature already exists → abort with clear message
	- Invalid feature_name → prompt for correction
	- Missing model fields → create minimal model with id and name
	- No persistence needed → skip Isar annotations and persistence methods

Assumptions:
	- Project uses dart_mappable for serialization
	- Riverpod 3.0+ with class-based providers
	- Isar for local persistence
	- build_runner available for code generation

Success Criteria:
	- User can run `dart run build_runner build` without errors
	- Generated files compile and follow project patterns
	- Bloc integrates with existing feature structure
	- Model supports both serialization and persistence

Examples:

Model Pattern:
```dart
import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'example.mapper.dart';
part 'example.g.dart';

@MappableClass()
@Collection()
class Example with ExampleMappable {
  final Id id;
  final String name;
  final DateTime createdAt;
  final bool isActive;

  const Example({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.createdAt,
    this.isActive = true,
  });
}
```

State Pattern:
```dart
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../models/example.dart';

part 'example_state.mapper.dart';

@MappableClass()
class ExampleState with ExampleStateMappable {
  final IList<Example> items;
  final bool isLoading;
  final String? error;

  const ExampleState({
    this.items = const IListConst([]),
    this.isLoading = false,
    this.error,
  });
}
```

Bloc Pattern:
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/example.dart';
import '../../shared/isar_provider.dart';
import 'example_state.dart';

part 'example_bloc.g.dart';

@riverpod
class ExampleBloc extends _$ExampleBloc {
  @override
  ExampleState build() {
    _loadItems();
    return const ExampleState(isLoading: true);
  }

  Future<void> _loadItems() async {
    try {
      final isar = ref.read(isarProvider);
      final items = await isar.examples.where().findAll();
      
      state = state.copyWith(
        items: items.toIList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> addItem(Example item) async {
    state = state.copyWith(isLoading: true);
    
    try {
      final isar = ref.read(isarProvider);
      await isar.writeTxn(() async {
        await isar.examples.put(item);
      });
      
      await _loadItems();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
```