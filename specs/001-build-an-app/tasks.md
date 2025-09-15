# Tasks: Multi-Modal AI Chat Assistant App

**Input**: Design documents from `/home/parth/Work/spec_genie/specs/001-build-an-app/`
**Prerequisites**: plan.md (required), research.md, spec.md

## Execution Flow (main)
```
1. Load plan.md from feature directory
   → Extract: Flutter + Riverpod + dart_mappable + openai_dart stack
   → Structure: Feature-based architecture with code generation
2. Load spec.md for user requirements:
   → Extract: Configuration, threads, chat, modes, media features
   → Generate: Model, bloc, widget, and test tasks per feature
3. Generate tasks by category:
   → Setup: Flutter project init, dependencies, code generation
   → Tests: Widget tests, bloc tests, integration tests
   → Models: dart_mappable models with Isar collections
   → Blocs: Riverpod class-based notifiers with OpenAI integration
   → Widgets: Feature screens and components
   → Integration: Navigation, storage, permissions
   → Polish: Golden tests, error handling, performance
4. Apply Flutter-specific task rules:
   → Different features = mark [P] for parallel
   → Code generation dependencies
   → Widget tests before widget implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate parallel execution examples for feature development
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different features/files, no dependencies)
- Include exact file paths for Flutter lib/ structure

## Phase 3.1: Project Setup & Dependencies
- [ ] T001 Initialize Flutter project with Dart 3.5+ and configure pubspec.yaml dependencies
- [ ] T002 Setup code generation tools: build_runner, dart_mappable_builder, riverpod_generator, go_router_builder
- [ ] T003 [P] Configure Flutter linting rules and analysis_options.yaml
- [ ] T004 [P] Setup project structure with feature-based directories in lib/features/
- [ ] T005 [P] Configure Android permissions for microphone, camera, storage in android/app/src/main/AndroidManifest.xml
- [ ] T006 [P] Configure iOS permissions for microphone, camera, storage in ios/Runner/Info.plist

## Phase 3.2: Model Tests & Models (TDD) ⚠️ TESTS MUST FAIL FIRST
**CRITICAL: These tests MUST be written and MUST FAIL before ANY model implementation**

### Configuration Feature Tests & Models
- [ ] T007 [P] Widget test for configuration screen in test/features/configuration/widgets/configuration_screen_test.dart
- [ ] T008 [P] Bloc test for configuration bloc in test/features/configuration/bloc/configuration_bloc_test.dart  
- [ ] T009 [P] Configuration model with dart_mappable in lib/features/configuration/models/configuration.dart
- [ ] T010 [P] Configuration bloc with Riverpod generator in lib/features/configuration/bloc/configuration_bloc.dart

### Threads Feature Tests & Models  
- [ ] T011 [P] Widget test for threads screen in test/features/threads/widgets/threads_screen_test.dart
- [ ] T012 [P] Bloc test for threads bloc in test/features/threads/bloc/threads_bloc_test.dart
- [ ] T013 [P] Thread model with dart_mappable and Isar collection in lib/features/threads/models/thread.dart
- [ ] T014 [P] Threads bloc with Riverpod generator in lib/features/threads/bloc/threads_bloc.dart

### Chat Feature Tests & Models
- [ ] T015 [P] Widget test for chat screen in test/features/chat/widgets/chat_screen_test.dart
- [ ] T016 [P] Bloc test for chat bloc with OpenAI integration in test/features/chat/bloc/chat_bloc_test.dart
- [ ] T017 [P] Message model with dart_mappable and content union types in lib/features/chat/models/message.dart
- [ ] T018 [P] Chat bloc with OpenAI client integration in lib/features/chat/bloc/chat_bloc.dart

### Modes Feature Tests & Models
- [ ] T019 [P] Widget test for modes screen in test/features/modes/widgets/modes_screen_test.dart
- [ ] T020 [P] Bloc test for modes bloc in test/features/modes/bloc/modes_bloc_test.dart
- [ ] T021 [P] Mode model with dart_mappable for AI generation modes in lib/features/modes/models/mode.dart
- [ ] T022 [P] Modes bloc with OpenAI validation in lib/features/modes/bloc/modes_bloc.dart

### Media Feature Tests & Models
- [ ] T023 [P] Widget test for media components in test/features/media/widgets/media_widgets_test.dart
- [ ] T024 [P] Bloc test for media bloc in test/features/media/bloc/media_bloc_test.dart
- [ ] T025 [P] MediaAttachment model with dart_mappable in lib/features/media/models/media_attachment.dart
- [ ] T026 [P] Media bloc for file/audio/image handling in lib/features/media/bloc/media_bloc.dart

## Phase 3.3: Code Generation & Routing
- [ ] T027 Run dart run build_runner build to generate mappers and providers
- [ ] T028 [P] App router with go_router_builder type-safe routes in lib/routing/app_router.dart
- [ ] T029 [P] Route definitions for all features in lib/routing/routes/

## Phase 3.4: Core Widgets Implementation (ONLY after tests are failing)

### Configuration Feature Widgets
- [ ] T030 [P] Configuration screen with form validation in lib/features/configuration/widgets/configuration_screen.dart
- [ ] T031 [P] API settings form component in lib/features/configuration/widgets/api_settings_form.dart
- [ ] T032 [P] Model selector component in lib/features/configuration/widgets/model_selector.dart

### Threads Feature Widgets  
- [ ] T033 [P] Threads list screen with create functionality in lib/features/threads/widgets/threads_screen.dart
- [ ] T034 [P] Thread list item component in lib/features/threads/widgets/thread_list_item.dart
- [ ] T035 [P] Create thread button with auto-naming in lib/features/threads/widgets/create_thread_button.dart

### Chat Feature Widgets
- [ ] T036 Chat screen with message display and input in lib/features/chat/widgets/chat_screen.dart
- [ ] T037 [P] Message input component with multi-modal support in lib/features/chat/widgets/message_input.dart
- [ ] T038 [P] Voice recorder component with background support in lib/features/chat/widgets/voice_recorder.dart
- [ ] T039 [P] Message bubble component with markdown rendering in lib/features/chat/widgets/message_bubble.dart

### Modes Feature Widgets
- [ ] T040 [P] Modes management screen in lib/features/modes/widgets/modes_screen.dart
- [ ] T041 [P] Mode selector component for quick actions in lib/features/modes/widgets/mode_selector.dart
- [ ] T042 [P] Custom mode form for prompt editing in lib/features/modes/widgets/custom_mode_form.dart

### Media Feature Widgets
- [ ] T043 [P] Image picker button component in lib/features/media/widgets/image_picker_button.dart
- [ ] T044 [P] Audio recorder component with permissions in lib/features/media/widgets/audio_recorder.dart
- [ ] T045 [P] File picker button component in lib/features/media/widgets/file_picker_button.dart

## Phase 3.5: Shared Components & Utilities
- [ ] T046 [P] Loading indicator component in lib/features/shared/widgets/loading_indicator.dart
- [ ] T047 [P] Error widget component in lib/features/shared/widgets/error_widget.dart
- [ ] T048 [P] Empty state component in lib/features/shared/widgets/empty_state.dart
- [ ] T049 [P] Extension utilities in lib/features/shared/utils/extensions.dart
- [ ] T050 [P] App constants in lib/features/shared/utils/constants.dart

## Phase 3.6: Integration & Storage
- [ ] T051 Setup Isar database initialization and schema in lib/main.dart
- [ ] T052 [P] Validation utilities for configuration in lib/features/configuration/utils/validation_utils.dart
- [ ] T053 [P] Thread utilities for auto-naming in lib/features/threads/utils/thread_utils.dart
- [ ] T054 [P] Message utilities for content processing in lib/features/chat/utils/message_utils.dart
- [ ] T055 [P] Prompt utilities for mode templates in lib/features/modes/utils/prompt_utils.dart
- [ ] T056 [P] File utilities for media handling in lib/features/media/utils/file_utils.dart

## Phase 3.7: Main App & Navigation
- [ ] T057 Main app widget with theme and router configuration in lib/app/app.dart
- [ ] T058 App entry point with Riverpod providers in lib/main.dart
- [ ] T059 Route guard for configuration validation in lib/routing/guards/config_guard.dart

## Phase 3.8: Integration Tests
- [ ] T060 [P] End-to-end test for voice-to-AI workflow in test/integration/voice_to_ai_flow_test.dart
- [ ] T061 [P] Integration test for thread management in test/integration/thread_management_test.dart
- [ ] T062 [P] Integration test for multi-modal message flow in test/integration/multimodal_message_test.dart

## Phase 3.9: Polish & Performance
- [ ] T063 [P] Golden tests for configuration screen in test/golden/configuration_screen_test.dart
- [ ] T064 [P] Golden tests for thread list in test/golden/thread_list_test.dart
- [ ] T065 [P] Performance test for audio recording startup (<2s) in test/performance/audio_performance_test.dart
- [ ] T066 [P] Error handling for OpenAI API failures across all blocs
- [ ] T067 [P] Background audio permission handling and fallbacks
- [ ] T068 [P] Share functionality implementation with copy/share actions
- [ ] T069 [P] Audio transcription with same LLM model implementation
- [ ] T070 Final code generation run and cleanup

## Dependencies
- Code Generation (T027) depends on Models (T009, T013, T017, T021, T025)
- Widget Implementation (T030-T045) depends on Tests (T007, T011, T015, T019, T023) failing
- Blocs (T010, T014, T018, T022, T026) depend on Models being created
- Integration (T051-T056) depends on Core Implementation (T030-T045)
- Main App (T057-T059) depends on all features being implemented
- Polish (T063-T070) depends on everything else

## Parallel Execution Examples

### Phase 3.2 - All Feature Tests (Run Together):
```bash
# All model tests can run in parallel since they're in different files
Task: "Widget test for configuration screen in test/features/configuration/widgets/configuration_screen_test.dart"
Task: "Widget test for threads screen in test/features/threads/widgets/threads_screen_test.dart"  
Task: "Widget test for chat screen in test/features/chat/widgets/chat_screen_test.dart"
Task: "Widget test for modes screen in test/features/modes/widgets/modes_screen_test.dart"
Task: "Widget test for media components in test/features/media/widgets/media_widgets_test.dart"
```

### Phase 3.2 - All Models (Run Together After Tests):
```bash
# All models can be created in parallel since they're independent
Task: "Configuration model with dart_mappable in lib/features/configuration/models/configuration.dart"
Task: "Thread model with dart_mappable and Isar collection in lib/features/threads/models/thread.dart"
Task: "Message model with dart_mappable and content union types in lib/features/chat/models/message.dart"
Task: "Mode model with dart_mappable for AI generation modes in lib/features/modes/models/mode.dart" 
Task: "MediaAttachment model with dart_mappable in lib/features/media/models/media_attachment.dart"
```

### Phase 3.4 - Feature Widget Implementation (Run Together):
```bash
# Feature widgets can be implemented in parallel since they're in different features
Task: "Configuration screen with form validation in lib/features/configuration/widgets/configuration_screen.dart"
Task: "Threads list screen with create functionality in lib/features/threads/widgets/threads_screen.dart"
Task: "Modes management screen in lib/features/modes/widgets/modes_screen.dart"
# Note: Chat screen not parallel as it depends on Media components
```

## Notes
- [P] tasks = different features/files, no dependencies between them
- Always verify widget tests fail before implementing widgets (TDD)
- Run `dart run build_runner build` after model changes
- Commit after each completed task
- Feature isolation allows maximum parallelization
- Chat feature may depend on Media feature for multi-modal input
- OpenAI integration in Chat and Modes blocs requires valid configuration

## Flutter-Specific Task Generation Rules
- Widget tests before widgets (TDD)
- Models before blocs (dependency)  
- Blocs before widgets (state dependency)
- Code generation after model changes
- Integration tests after individual features work
- Golden tests for UI consistency
- Performance tests for audio/AI response times
```
1. Load plan.md from feature directory
   → Found: Flutter mobile app with Riverpod + Isar + go_router
   → Extract: tech stack (Flutter 3.24+, Dart 3.5+), libraries, structure
2. Load optional design documents:
   → spec.md: Extract 17 functional requirements → integration tests
   → research.md: Extract technical decisions → setup tasks
   → No data-model.md or contracts/ found
3. Generate tasks by category:
   → Setup: Flutter project, dependencies, code generation
   → Tests: widget tests, integration tests for user flows
   → Core: models (Freezed), services, routing (go_router)
   → Integration: Isar database, OpenAI API, permissions
   → Polish: unit tests, performance validation, documentation
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Path Conventions
Flutter mobile app structure at repository root:
- **lib/**: Main source code
- **test/**: All test files
- **pubspec.yaml**: Dependencies configuration

## Phase 3.1: Setup
- [ ] T001 Create Flutter project structure per plan.md with lib/ folders for features, services, models, routing
- [ ] T002 Initialize pubspec.yaml with dependencies: riverpod ^3.0.0, isar_community ^3.3.0-dev.2, freezed ^3.2.3, openai_dart ^0.5.5, etc.
- [ ] T003 [P] Configure analysis_options.yaml with linting rules and build.yaml for code generation
- [ ] T004 [P] Setup dev dependencies: build_runner ^2.8.0, json_serializable ^6.11.1, go_router_builder ^4.0.1

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**
- [ ] T005 [P] Widget test for configuration screen in test/features/configuration/configuration_screen_test.dart
- [ ] T006 [P] Widget test for thread list screen in test/features/threads/thread_list_screen_test.dart  
- [ ] T007 [P] Widget test for chat screen in test/features/chat/chat_screen_test.dart
- [ ] T008 [P] Integration test for FR-001-FR-003: configuration flow in test/integration/configuration_flow_test.dart
- [ ] T009 [P] Integration test for FR-004-FR-006: thread management in test/integration/thread_management_test.dart
- [ ] T010 [P] Integration test for FR-007-FR-008: multi-modal input in test/integration/multimodal_input_test.dart
- [ ] T011 [P] Integration test for FR-009-FR-012: quick actions flow in test/integration/quick_actions_test.dart
- [ ] T012 [P] Integration test for FR-013-FR-015: custom modes in test/integration/custom_modes_test.dart
- [ ] T013 [P] Service test for AI service integration in test/services/ai_service_test.dart
- [ ] T014 [P] Service test for storage service with Isar in test/services/storage_service_test.dart
- [ ] T015 [P] Service test for audio recording/playback in test/services/audio_service_test.dart
- [ ] T016 [P] Service test for file operations in test/services/file_service_test.dart
- [ ] T017 [P] Service test for share functionality in test/services/share_service_test.dart
- [ ] T018 [P] Integration test for quick actions output caching in test/integration/output_caching_test.dart
- [ ] T019 [P] Integration test for message deletion functionality in test/integration/message_deletion_test.dart

## Phase 3.3: Core Implementation (ONLY after tests are failing)
- [ ] T020 [P] Configuration model with Freezed in lib/models/configuration.dart
- [ ] T021 [P] Thread model with Isar annotations in lib/models/thread.dart
- [ ] T022 [P] Message model with multi-modal content and deletion support in lib/models/message.dart
- [ ] T023 [P] Quick action mode model in lib/models/mode.dart
- [ ] T024 [P] Media attachment model in lib/models/media_attachment.dart
- [ ] T025 [P] Quick action output cache model in lib/models/quick_action_output.dart
- [ ] T026 Run build_runner to generate Freezed and Isar code
- [ ] T027 [P] Go router type-safe routes in lib/routing/routes/home_route.dart
- [ ] T028 [P] Configuration route in lib/routing/routes/config_route.dart
- [ ] T029 [P] Thread route with parameters in lib/routing/routes/thread_route.dart
- [ ] T030 [P] Mode configuration route in lib/routing/routes/mode_route.dart
- [ ] T031 Router configuration with guards in lib/routing/app_router.dart
- [ ] T032 Run build_runner to generate go_router code
- [ ] T033 [P] AI service with OpenAI integration and caching in lib/services/ai_service.dart
- [ ] T034 [P] Storage service with Isar database and message deletion in lib/services/storage_service.dart
- [ ] T035 [P] Audio service with record/playback in lib/services/audio_service.dart
- [ ] T036 [P] File service with file operations in lib/services/file_service.dart
- [ ] T037 [P] Share service for incoming/outgoing shares in lib/services/share_service.dart
- [ ] T038 [P] Permission service for runtime permissions in lib/services/permission_service.dart
- [ ] T039 [P] Background service for background audio in lib/services/background_service.dart

## Phase 3.4: UI Features
- [ ] T040 [P] Configuration screen UI in lib/features/configuration/configuration_screen.dart
- [ ] T041 [P] Thread list screen UI in lib/features/threads/thread_list_screen.dart
- [ ] T042 [P] Chat screen with multi-modal input and message deletion in lib/features/chat/chat_screen.dart
- [ ] T043 [P] Quick action modes screen with output caching in lib/features/modes/modes_screen.dart
- [ ] T044 [P] Media input widgets in lib/features/media/media_input_widgets.dart
- [ ] T045 [P] Shared UI components in lib/features/shared/ui_components.dart
- [ ] T046 Main app with Riverpod providers in lib/main.dart
- [ ] T047 App-level configuration in lib/app/app.dart

## Phase 3.5: Integration
- [ ] T048 Connect storage service to Isar database with schema migration and message deletion
- [ ] T049 Connect AI service to OpenAI API with output caching and error handling
- [ ] T050 Integrate permission service with audio/camera/storage permissions
- [ ] T051 Setup background audio service with platform-specific implementations
- [ ] T052 Integrate share functionality with platform intents
- [ ] T053 Connect router service with deep linking support
- [ ] T054 Add structured logging throughout the app
- [ ] T055 Implement error handling and user feedback

## Phase 3.6: Polish
- [ ] T056 [P] Unit tests for utility functions in test/utils/extensions_test.dart
- [ ] T057 [P] Unit tests for file utilities in test/utils/file_utils_test.dart
- [ ] T058 [P] Performance tests for voice recording startup (<2s) in test/performance/audio_performance_test.dart
- [ ] T059 [P] Performance tests for AI response processing (<5s) in test/performance/ai_performance_test.dart
- [ ] T060 [P] Widget golden tests for UI consistency in test/golden/
- [ ] T061 [P] Update README.md with setup and usage instructions
- [ ] T062 [P] Generate API documentation with dartdoc
- [ ] T063 Remove code duplication and optimize imports
- [ ] T064 Final integration test run to validate all 19 functional requirements

## Dependencies
- Setup (T001-T004) before all other phases
- Tests (T005-T019) before implementation (T020-T055)
- Models (T020-T025) before services (T033-T039)
- Code generation (T026, T032) after model/route definitions
- Services before UI features (T040-T047)
- Core implementation before integration (T048-T055)
- Integration before polish (T056-T064)

## Parallel Example
```
# Launch T005-T019 together (all test files):
Task: "Widget test for configuration screen in test/features/configuration/configuration_screen_test.dart"
Task: "Widget test for thread list screen in test/features/threads/thread_list_screen_test.dart"
Task: "Widget test for chat screen in test/features/chat/chat_screen_test.dart"
Task: "Integration test for configuration flow in test/integration/configuration_flow_test.dart"
Task: "Integration test for quick actions output caching in test/integration/output_caching_test.dart"
Task: "Integration test for message deletion functionality in test/integration/message_deletion_test.dart"
# ... and so on for all [P] test tasks

# Launch T020-T025 together (all model files):
Task: "Configuration model with Freezed in lib/models/configuration.dart"
Task: "Thread model with Isar annotations in lib/models/thread.dart"
Task: "Message model with multi-modal content and deletion support in lib/models/message.dart"
Task: "Quick action output cache model in lib/models/quick_action_output.dart"
# ... and so on for all [P] model tasks
```

## Notes
- [P] tasks = different files, no dependencies
- All tests must fail before implementing corresponding features
- Run `dart run build_runner build` after T026 and T032 for code generation
- Commit after each task completion
- Verify all 19 functional requirements (FR-001 through FR-019) are covered
- FR-018: Quick actions output caching with selective recalculation
- FR-019: Message deletion within threads

## Task Generation Rules
*Applied during task creation*

1. **From Spec Requirements**:
   - Each functional requirement → integration test task [P]
   - User scenarios → end-to-end validation flows
   
2. **From Plan Structure**:
   - Each model → Freezed model creation task [P]
   - Each service → service implementation task [P]
   - Each screen → UI widget task [P]
   
3. **From Research Decisions**:
   - Each technology choice → setup and integration tasks
   - Code generation tools → build runner tasks

4. **Ordering**:
   - Setup → Tests → Models → Routes → Services → UI → Integration → Polish
   - Code generation tasks after definitions
   - Dependencies block parallel execution

## Validation Checklist
*GATE: Verified before task execution*

- [x] All 19 functional requirements have corresponding tests
- [x] All models from plan.md have creation tasks  
- [x] All tests come before implementation
- [x] Parallel tasks target different files
- [x] Each task specifies exact file path
- [x] No task modifies same file as another [P] task
- [x] TDD workflow enforced (RED before GREEN)
- [x] Code generation tasks properly sequenced
- [x] New requirements integrated: FR-018 (output caching), FR-019 (message deletion)
