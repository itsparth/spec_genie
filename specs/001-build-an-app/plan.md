# Implementation Plan: Multi-Modal AI Chat Assistant App

**Branch**: `001-build-an-app` | **Date**: September 15, 2025 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/home/parth/Work/spec_genie/specs/001-build-an-app/spec.md`

## Execution Flow (/plan command scope)
```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect Project Type from context (web=frontend+backend, mobile=app+api)
   → Set Structure Decision based on project type
3. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
4. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
5. Execute Phase 1 → contracts, data-model.md, quickstart.md, agent-specific template file (e.g., `CLAUDE.md` for Claude Code, `.github/copilot-instructions.md` for GitHub Copilot, or `GEMINI.md` for Gemini CLI).
6. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
7. Plan Phase 2 → Describe task generation approach (DO NOT create tasks.md)
8. STOP - Ready for /tasks command
```

**IMPORTANT**: The /plan command STOPS at step 7. Phases 2-4 are executed by other commands:
- Phase 2: /tasks command creates tasks.md
- Phase 3-4: Implementation execution (manual or via tools)

## Summary
Multi-modal AI chat assistant mobile app with Flutter frontend enabling voice/text/image input, local thread management, configurable AI generation modes, and markdown output with copy/share functionality. Focus on speed, ease of use, and BYOK offline-first approach with OpenAI API integration.

## Technical Context
**Language/Version**: Dart 3.5+ with Flutter 3.24+  
**Primary Dependencies**: flutter_riverpod 3.0+ (state management), dart_mappable 4.6+ (code generation), isar_community 3.3+ (local database), openai_dart 0.5+ (AI integration in chat/modes blocs), arcane 6.1+ (UI components), record 6.1+ (audio recording), go_router 16.2+ (navigation)  
**Storage**: Isar database for local persistence (threads, messages, configuration, modes) + local file system for media files  
**Testing**: Flutter test framework with widget/unit/integration testing + golden tests for UI components  
**Target Platform**: Mobile (iOS 15+, Android API 21+) with background audio capabilities  
**Project Type**: mobile - Flutter mobile application with feature-based architecture and code generation  
**Performance Goals**: <2s voice recording startup, <5s AI response processing, smooth 60fps UI, background recording support  
**Constraints**: 100% offline data management, online only for OpenAI API calls via openai_dart in chat/modes blocs (using same LLM model for transcription), BYOK security model, background audio compliance  
**Scale/Scope**: Single-user app, 1000+ threads, unlimited messages per thread, 10+ custom modes, shared media handling

## Constitution Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

**Simplicity**:
- Projects: 1 (Flutter mobile app)
- Using framework directly? YES (direct Flutter widgets + established packages, no wrapper classes)
- Single data model? YES (dart_mappable entities with direct API mapping)
- Avoiding patterns? YES (no Repository/Service patterns, direct feature-based Riverpod blocs)

**Architecture**:
- EVERY feature as library? YES (feature-based modules with blocs, models, widgets, utils)
- Libraries listed: configuration (AI settings), threads (thread management), chat (messaging), modes (AI generation), media (audio/image/file), shared (common components)
- CLI per library: N/A (mobile app, but feature modules expose clear APIs)
- Library docs: dartdoc format with feature documentation

**Testing (NON-NEGOTIABLE)**:
- RED-GREEN-Refactor cycle enforced? YES (widget tests fail first, then implement)
- Git commits show tests before implementation? YES (will be enforced)
- Order: Contract→Integration→E2E→Unit strictly followed? YES (feature contracts, widget integration, app E2E, bloc unit tests)
- Real dependencies used? YES (actual Isar database, real OpenAI API in integration tests)
- Integration tests for: New feature blocs, data model changes, multi-modal input flows
- FORBIDDEN: Implementation before test, skipping RED phase

**Observability**:
- Structured logging included? YES (flutter logging with debug/release modes)
- Frontend logs → backend? N/A (single mobile app)
- Error context sufficient? YES (detailed error states in bloc patterns)

**Versioning**:
- Version number assigned? 1.0.0 (initial release target)
- BUILD increments on every change? YES (semantic versioning with build numbers)
- Breaking changes handled? YES (migration scripts for Isar schema changes)

## Project Structure

### Documentation (this feature)
```
specs/[###-feature]/
├── plan.md              # This file (/plan command output)
├── research.md          # Phase 0 output (/plan command)
├── data-model.md        # Phase 1 output (/plan command)
├── quickstart.md        # Phase 1 output (/plan command)
├── contracts/           # Phase 1 output (/plan command)
└── tasks.md             # Phase 2 output (/tasks command - NOT created by /plan)
```

### Source Code (repository root)
```
# Flutter Feature-Based Architecture with Code Generation
lib/
├── main.dart                        # App entry point with Riverpod providers
├── app/
│   ├── app.dart                     # Main app widget with theme and router
│   └── router/
│       ├── app_router.dart          # GoRouter configuration
│       └── app_router.g.dart        # Generated routes (build_runner)
├── features/
│   ├── configuration/
│   │   ├── models/
│   │   │   ├── configuration.dart   # @MappableClass with minimal fields
│   │   │   └── configuration.mapper.dart # Generated mapper
│   │   ├── bloc/
│   │   │   ├── configuration_bloc.dart # @riverpod class ConfigurationBloc
│   │   │   └── configuration_bloc.g.dart # Generated provider
│   │   ├── widgets/
│   │   │   ├── configuration_screen.dart
│   │   │   ├── api_settings_form.dart
│   │   │   └── model_selector.dart
│   │   └── utils/
│   │       └── validation_utils.dart
│   ├── threads/
│   │   ├── models/
│   │   │   ├── thread.dart          # @MappableClass, @Collection for Isar
│   │   │   └── thread.mapper.dart   # Generated mapper
│   │   ├── bloc/
│   │   │   ├── threads_bloc.dart    # @riverpod class ThreadsBloc
│   │   │   └── threads_bloc.g.dart  # Generated provider
│   │   ├── widgets/
│   │   │   ├── threads_screen.dart
│   │   │   ├── thread_list_item.dart
│   │   │   └── create_thread_button.dart
│   │   └── utils/
│   │       └── thread_utils.dart
│   ├── chat/
│   │   ├── models/
│   │   │   ├── message.dart         # @MappableClass with content union
│   │   │   └── message.mapper.dart  # Generated mapper
│   │   ├── bloc/
│   │   │   ├── chat_bloc.dart       # @riverpod class ChatBloc
│   │   │   └── chat_bloc.g.dart     # Generated provider
│   │   ├── widgets/
│   │   │   ├── chat_screen.dart
│   │   │   ├── message_input.dart
│   │   │   ├── voice_recorder.dart
│   │   │   └── message_bubble.dart
│   │   └── utils/
│   │       └── message_utils.dart
│   ├── modes/
│   │   ├── models/
│   │   │   ├── mode.dart            # @MappableClass for AI generation modes
│   │   │   └── mode.mapper.dart     # Generated mapper
│   │   ├── bloc/
│   │   │   ├── modes_bloc.dart      # @riverpod class ModesBloc
│   │   │   └── modes_bloc.g.dart    # Generated provider
│   │   ├── widgets/
│   │   │   ├── modes_screen.dart
│   │   │   ├── mode_selector.dart
│   │   │   └── custom_mode_form.dart
│   │   └── utils/
│   │       └── prompt_utils.dart
│   ├── media/
│   │   ├── models/
│   │   │   ├── media_attachment.dart # @MappableClass for files
│   │   │   └── media_attachment.mapper.dart
│   │   ├── bloc/
│   │   │   ├── media_bloc.dart      # @riverpod class MediaBloc
│   │   │   └── media_bloc.g.dart    # Generated provider
│   │   ├── widgets/
│   │   │   ├── image_picker_button.dart
│   │   │   ├── audio_recorder.dart
│   │   │   └── file_picker_button.dart
│   │   └── utils/
│   │       └── file_utils.dart
│   └── shared/
│       ├── widgets/
│       │   ├── loading_indicator.dart
│       │   ├── error_widget.dart
│       │   └── empty_state.dart
│       ├── utils/
│       │   ├── extensions.dart
│       │   └── constants.dart
│       └── models/
│           └── api_response.dart    # Generic response wrapper
└── generated/                       # All generated files
    ├── *.mapper.dart               # dart_mappable generated files
    ├── *.g.dart                    # riverpod generated providers
    └── app_router.g.dart           # go_router generated routes

# Minimalistic Models Philosophy
# Configuration: apiKey, baseUrl, modelName, transcribeAudioFirst (4 fields max)
# Thread: id, name, createdAt, messageCount (4 fields max)  
# Message: id, content, timestamp, type (4 fields max)
# Mode: id, name, prompt, isDefault (4 fields max)
# MediaAttachment: path, type, size (3 fields max)

test/
├── features/
│   ├── configuration/
│   │   ├── bloc/
│   │   │   └── configuration_bloc_test.dart
│   │   └── widgets/
│   │       └── configuration_screen_test.dart
│   ├── threads/
│   ├── chat/
│   ├── modes/
│   └── media/
├── integration/
│   ├── app_integration_test.dart
│   └── voice_to_ai_flow_test.dart
└── golden/
    ├── configuration_screen_test.dart
    └── thread_list_test.dart
```

**Structure Decision**: Feature-based mobile architecture with minimalistic models and code generation

### Code Generation Architecture

**Riverpod 3 Bloc Pattern**:
```dart
// features/configuration/bloc/configuration_bloc.dart
@riverpod
class ConfigurationBloc extends _$ConfigurationBloc {
  @override
  Configuration? build() {
    // Load from local storage on init
    return null;
  }

  // Minimalistic methods called directly from UI
  Future<void> saveConfiguration(Configuration config) async {
    state = config;
    // Direct API call to storage
    await _saveToStorage(config);
  }

  Future<void> loadConfiguration() async {
    // Direct API call to storage  
    final config = await _loadFromStorage();
    state = config;
  }
}

// features/chat/bloc/chat_bloc.dart
@riverpod
class ChatBloc extends _$ChatBloc {
  @override
  List<Message> build(String threadId) {
    // Load messages from local storage
    return [];
  }

  // OpenAI integration for AI responses using openai_dart
  Future<void> sendMessage(Message userMessage, Mode selectedMode) async {
    // Add user message to state
    state = [...state, userMessage];
    
    // Get configuration for OpenAI client
    final config = ref.read(configurationBlocProvider);
    final client = OpenAIClient(
      apiKey: config.apiKey,
      baseUrl: config.baseUrl, // Optional: for OpenAI-compatible APIs
    );
    
    // Create chat completion with mode-specific system prompt
    final res = await client.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: ChatCompletionModel.modelId(config.modelName),
        messages: [
          ChatCompletionMessage.developer(content: selectedMode.prompt),
          ...state.map((msg) => ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(msg.content),
          )),
        ],
      ),
    );
    
    // Add AI response to state
    final aiResponse = res.choices.first.message.content ?? '';
    final aiMessage = Message.fromAI(aiResponse);
    state = [...state, aiMessage];
  }

  // Support for multi-modal input (voice/image) with transcription option
  Future<void> sendMultiModalMessage(
    String text, 
    String? imagePath, 
    String? audioPath,
    Mode selectedMode,
  ) async {
    final config = ref.read(configurationBlocProvider);
    final client = OpenAIClient(apiKey: config.apiKey, baseUrl: config.baseUrl);
    
    String finalText = text;
    
    // Handle audio transcription if enabled and audio provided
    if (audioPath != null && config.transcribeAudioFirst) {
      // First transcribe audio to text using the same LLM model
      final audioBytes = await File(audioPath).readAsBytes();
      final base64Audio = base64Encode(audioBytes);
      
      final transcriptionRes = await client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: ChatCompletionModel.modelId(config.modelName),
          messages: [
            ChatCompletionMessage.developer(
              content: 'Transcribe the following audio to text. Return only the transcribed text without any additional formatting or comments.',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.parts([
                ChatCompletionMessageContentPart.audio(
                  inputAudio: ChatCompletionMessageInputAudio(
                    data: base64Audio,
                    format: ChatCompletionMessageInputAudioFormat.wav,
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
      
      final transcribedText = transcriptionRes.choices.first.message.content ?? '';
      
      // Append transcribed text to the message
      finalText = text.isEmpty 
        ? transcribedText 
        : '$text\n\nTranscribed audio: $transcribedText';
    }
    
    // Build content parts for the final message
    final contentParts = <ChatCompletionMessageContentPart>[
      ChatCompletionMessageContentPart.text(text: finalText),
    ];
    
    // Add image if provided
    if (imagePath != null) {
      final imageBytes = await File(imagePath).readAsBytes();
      final base64Image = base64Encode(imageBytes);
      contentParts.add(
        ChatCompletionMessageContentPart.image(
          imageUrl: ChatCompletionMessageImageUrl(
            url: 'data:image/jpeg;base64,$base64Image',
          ),
        ),
      );
    }
    
    // Add audio directly only if transcribeAudioFirst is false
    if (audioPath != null && !config.transcribeAudioFirst) {
      final audioBytes = await File(audioPath).readAsBytes();
      final base64Audio = base64Encode(audioBytes);
      contentParts.add(
        ChatCompletionMessageContentPart.audio(
          inputAudio: ChatCompletionMessageInputAudio(
            data: base64Audio,
            format: ChatCompletionMessageInputAudioFormat.wav,
          ),
        ),
      );
    }

    // Final chat completion with the selected mode
    final res = await client.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: ChatCompletionModel.modelId(config.modelName),
        messages: [
          ChatCompletionMessage.developer(content: selectedMode.prompt),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.parts(contentParts),
          ),
        ],
      ),
    );
    
    final aiResponse = res.choices.first.message.content ?? '';
    final aiMessage = Message.fromAI(aiResponse);
    state = [...state, aiMessage];
  }
}

// features/modes/bloc/modes_bloc.dart
@riverpod
class ModesBloc extends _$ModesBloc {
  @override
  List<Mode> build() {
    return _getDefaultModes();
  }

  // Test mode with OpenAI API validation using openai_dart
  Future<bool> validateMode(Mode mode) async {
    final config = ref.read(configurationBlocProvider);
    final client = OpenAIClient(
      apiKey: config.apiKey,
      baseUrl: config.baseUrl,
    );
    
    try {
      // Test the mode with a simple prompt
      await client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: ChatCompletionModel.modelId(config.modelName),
          messages: [
            ChatCompletionMessage.developer(content: mode.prompt),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string("Test message"),
            ),
          ],
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
```

**dart_mappable Models**:
```dart
// features/configuration/models/configuration.dart
@MappableClass()
class Configuration with ConfigurationMappable {
  final String apiKey;           // Only essential UI fields
  final String baseUrl;          // No temperature, maxTokens, etc.
  final String modelName;        // Can add advanced fields later
  final bool transcribeAudioFirst; // Default: transcribe audio to text first
  
  const Configuration({
    required this.apiKey,
    required this.baseUrl, 
    required this.modelName,
    this.transcribeAudioFirst = true, // Default behavior
  });
}
```

**Feature Integration**:
- Each feature has its own bloc, models, widgets, utils
- Blocs call APIs/storage directly (no service layer)
- Models expose only UI-necessary fields
- Utils handle complex logic extraction when methods grow
- Widgets consume bloc state via `ref.watch()`

**Build Commands**:
```bash
# Generate all code (mappers + providers + routes)
dart run build_runner build

# Watch for changes during development  
dart run build_runner watch
```

## Phase 0: Outline & Research
1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Design & Contracts
*Prerequisites: research.md complete*

1. **Extract minimalistic entities from feature spec** → `data-model.md`:
   - Entity name with only UI-exposed fields (3-4 fields max per model)
   - dart_mappable annotations for code generation
   - Isar collections for local persistence
   - No complex relationships initially (flat structure)

2. **Generate feature contracts** from functional requirements:
   - Each user action → bloc method signature
   - Direct API calls (no service abstraction)
   - Output method contracts to `/contracts/`

3. **Generate bloc tests** from contracts:
   - One test file per bloc
   - Assert state changes and API calls
   - Tests must fail (no implementation yet)

4. **Extract test scenarios** from user stories:
   - Each story → widget integration test scenario
   - Focus on UI interactions and state updates

5. **Update GitHub Copilot context** (minimalistic approach):
   - Run update script for `.github/copilot-instructions.md`
   - Add feature-based structure and dart_mappable patterns
   - Include Riverpod 3 bloc examples
   - Keep under 150 lines for efficiency

**Output**: data-model.md (minimalistic), /contracts/* (bloc methods), failing tests, quickstart.md, .github/copilot-instructions.md

## Phase 2: Task Planning Approach
*This section describes what the /tasks command will do - DO NOT execute during /plan*

**Task Generation Strategy**:
- Load `/templates/tasks-template.md` as base
- Generate tasks from Phase 1 minimalistic design docs
- Each feature bloc → bloc test task [P] + bloc implementation task
- Each minimalistic model → model creation task [P] with dart_mappable
- Each widget → widget test task + widget implementation task
- Code generation tasks for build_runner execution

**Feature-Based Ordering Strategy**:
- TDD order: Tests before implementation for each feature
- Feature independence: Most tasks marked [P] for parallel execution  
- Dependency order within features: Models → Blocs → Widgets
- Code generation: After model changes, before bloc implementation

**Minimalistic Implementation Tasks**:
1. Setup code generation (build_runner, dart_mappable, riverpod_generator)
2. Create minimalistic models (3-4 fields each) [P]
3. Generate mappers and providers via build_runner
4. Create bloc tests (state changes only) [P] 
5. Implement blocs with direct API calls [P]
6. Create widget tests for UI interactions [P]
7. Implement widgets consuming bloc state [P]
8. Integration tests for complete user flows

**Estimated Output**: 35-40 numbered, ordered tasks in tasks.md (higher due to feature separation)

**IMPORTANT**: This phase is executed by the /tasks command, NOT by /plan

## Phase 3+: Future Implementation
*These phases are beyond the scope of the /plan command*

**Phase 3**: Task execution (/tasks command creates tasks.md)  
**Phase 4**: Implementation (execute tasks.md following constitutional principles)  
**Phase 5**: Validation (run tests, execute quickstart.md, performance validation)

## Complexity Tracking
*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |


## Progress Tracking
*This checklist is updated during execution flow*

**Phase Status**:
- [ ] Phase 0: Research complete (/plan command)
- [ ] Phase 1: Design complete (/plan command)
- [ ] Phase 2: Task planning complete (/plan command - describe approach only)
- [ ] Phase 3: Tasks generated (/tasks command)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Validation passed

**Gate Status**:
- [ ] Initial Constitution Check: PASS
- [ ] Post-Design Constitution Check: PASS
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented

---
*Based on Constitution v2.1.1 - See `/memory/constitution.md`*