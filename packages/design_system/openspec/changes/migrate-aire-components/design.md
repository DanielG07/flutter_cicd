# Technical Design: AIRE Component Migration

## Context

The AIRE design system exists in `widgets/` with production-ready components using relative import paths. The `lib/` directory contains placeholder components with a different naming scheme. We need to consolidate these into a single, properly structured Flutter package that can be consumed by other applications and cataloged with Widgetbook.

### Stakeholders
- Design system maintainers
- Future app developers consuming this package
- Widgetbook users exploring component documentation

### Constraints
- Must maintain Flutter package conventions
- Must support Dart 3.8.1+ and Flutter 3.16.0+
- No external consumers exist yet, allowing clean-slate approach
- Components must remain functional after migration

## Goals / Non-Goals

### Goals
- Single source of truth: `lib/` contains the AIRE component library
- Proper package structure with correct import paths
- Professional component catalog via Widgetbook
- Atomic design organization (tokens → atoms → molecules → organisms)
- Platform support: Web, macOS, Windows for Widgetbook

### Non-Goals
- Modifying component functionality or APIs
- Renaming components (keep AIRE prefix)
- Creating new components beyond existing inventory
- Backward compatibility (no existing consumers)
- Mobile platform support for Widgetbook (can be added later)

## Decisions

### Decision 1: Clean Slate Migration
**Choice:** Delete existing `lib/src/` and rebuild from `widgets/`

**Alternatives Considered:**
1. Incremental replacement: Keep lib/ structure, replace components one-by-one
   - ❌ Creates confusion during transition
   - ❌ Risk of leaving orphaned DS components
   - ❌ More complex to validate completion
2. Parallel structures: Keep both DS and Aire prefixed components
   - ❌ Doubles maintenance burden
   - ❌ Unclear which to use
   - ❌ Bloats package size

**Rationale:** Clean slate is safe (no consumers), cleaner, and prevents confusion.

### Decision 2: Import Path Strategy
**Choice:** Use package-relative imports: `package:design_system/src/...`

**Example transformation:**
```dart
// OLD (in widgets/)
import '../../../design_tokens/aire_colors.dart';

// NEW (in lib/)
import 'package:design_system/src/design_tokens/aire_colors.dart';
```

**Rationale:**
- Standard Flutter package convention
- Works correctly when package is consumed externally
- Cleaner and more maintainable
- Avoid fragile relative paths

### Decision 3: Directory Structure
**Choice:** Atomic design hierarchy under `lib/src/`

```
lib/
├── design_system.dart          (barrel file exports all public API)
└── src/
    ├── design_tokens/          (foundational tokens)
    │   ├── design_tokens.dart  (barrel export)
    │   ├── aire_colors.dart
    │   ├── aire_text_styles.dart
    │   ├── aire_spacing.dart
    │   ├── aire_border_radius.dart
    │   ├── aire_breakpoints.dart
    │   └── aire_icons.dart
    ├── atoms/                   (basic building blocks)
    │   ├── button/
    │   │   └── aire_button.dart
    │   ├── checkbox/
    │   │   └── aire_checkbox.dart
    │   └── ... (chip, icon_button, link, avatar, switch, radio_button, tag, badge)
    ├── molecules/               (simple combinations)
    │   ├── input/
    │   │   └── aire_input_text.dart
    │   ├── toast/
    │   │   └── aire_toast.dart
    │   └── ... (slider, input_search, list, select)
    └── organisms/               (complex components)
        └── navigation/
            └── aire_appbar.dart
```

**Rationale:**
- Follows atomic design methodology
- Clear separation of concerns
- Easy to navigate and discover components
- Scales well as more components are added

### Decision 4: Widgetbook Architecture
**Choice:** Separate Flutter application in `widgetbook/` sibling directory

```
design_system/
├── lib/                    (main package)
├── example/                (simple usage examples)
└── widgetbook/             (comprehensive catalog)
    ├── pubspec.yaml        (widgetbook dependencies)
    └── lib/
        ├── main.dart       (@widgetbook.App annotation)
        └── ... (use case files)
```

**Dependencies for widgetbook/pubspec.yaml:**
```yaml
dependencies:
  design_system:
    path: ../
  widgetbook: ^latest
  widgetbook_annotation: ^latest
dev_dependencies:
  widgetbook_generator: ^latest
  build_runner: ^latest
```

**Platforms:** `--platforms=web,macos,windows`
- Web: Primary platform for hosted documentation
- macOS/Windows: Desktop development and testing

**Rationale:**
- Follows official Widgetbook recommendations
- Separates concerns: example for quick start, widgetbook for comprehensive exploration
- Allows independent versioning and configuration
- Supports addons (theme switching, device frames) without cluttering main package

### Decision 5: Component Export Strategy
**Choice:** Explicit exports via barrel files

`lib/design_system.dart`:
```dart
// Design Tokens
export 'src/design_tokens/design_tokens.dart';

// Atoms
export 'src/atoms/button/aire_button.dart';
export 'src/atoms/checkbox/aire_checkbox.dart';
// ... all atoms

// Molecules
export 'src/molecules/input/aire_input_text.dart';
// ... all molecules

// Organisms
export 'src/organisms/navigation/aire_appbar.dart';
```

**Rationale:**
- Clear, intentional public API surface
- Easy to control what's exposed
- Simple for consumers: `import 'package:design_system/design_system.dart';`
- Can add `show` clauses for selective imports

## Risks / Trade-offs

### Risk: Import Path Errors
**Description:** Manual find-replace might miss imports or break functionality

**Mitigation:**
- Systematic approach: update one directory at a time
- Test after each component migration
- Use Dart analyzer to catch broken imports
- Run example app frequently during migration

### Risk: Widgetbook Generation Failures
**Description:** build_runner might fail if use case annotations are incorrect

**Mitigation:**
- Start with 2-3 simple use cases (button, input)
- Validate generation before creating all use cases
- Follow official Widgetbook documentation strictly
- Use `--delete-conflicting-outputs` flag if needed

### Trade-off: Platform Scope
**Choice:** Web/macOS/Windows only initially

**Accepted limitation:** No mobile Widgetbook initially
**Benefit:** Faster initial setup, focused on primary use case (web docs)
**Future path:** Can add mobile platforms with `flutter create widgetbook --platforms=ios,android` later

## Migration Plan

### Phase 1: Preparation (In this proposal)
1. Create OpenSpec change proposal
2. Validate spec structure
3. Get approval before implementation

### Phase 2: Core Migration
1. **Backup:** Commit current state before deletion
2. **Clean:** Delete `lib/src/` (keep lib/design_system.dart)
3. **Migrate Tokens:** Copy `widgets/design_tokens/` → `lib/src/design_tokens/`
   - Update imports in each token file
   - Verify barrel export works
4. **Migrate Atoms:** Copy `widgets/atoms/` → `lib/src/atoms/`
   - Update imports in each component
   - Fix token import paths
   - Test each component
5. **Migrate Molecules:** Copy `widgets/molecules/` → `lib/src/molecules/`
   - Update imports
   - Fix atom and token dependencies
6. **Create Organisms:** Create `lib/src/organisms/navigation/`
   - Move `widgets/aire_appbar.dart` → organisms structure
   - Update imports
7. **Update Exports:** Rewrite `lib/design_system.dart`
   - Export all tokens, atoms, molecules, organisms
   - Follow explicit export pattern

### Phase 3: Widgetbook Setup
1. **Create app:** `flutter create widgetbook --empty --platforms=web,macos,windows`
2. **Configure:** Update widgetbook/pubspec.yaml
   - Add widgetbook dependencies
   - Reference parent design_system package
3. **Setup main:** Create widgetbook/lib/main.dart with @widgetbook.App
4. **Generate use cases:** Create use case files for each component
   - Start with atoms
   - Add molecules
   - Add organisms
5. **Build:** Run `flutter pub run build_runner build`
6. **Verify:** Launch widgetbook app and test navigation

### Phase 4: Example Updates
1. Update example/lib/main.dart imports
2. Replace DS component usage with Aire equivalents
3. Test example app functionality

### Rollback Strategy
If issues arise:
1. Git revert to pre-migration commit
2. Keep widgetbook/ branch separate for independent development
3. Migration is atomic (all-or-nothing per component type)

## Open Questions

None. All architectural decisions have been made based on:
- User confirmation of clean slate approach
- User confirmation to keep AIRE prefix
- User confirmation of widgetbook platforms
- Standard Flutter package conventions
