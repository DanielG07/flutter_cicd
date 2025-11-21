## Context

The AIRE design system components are currently documented via Widgetbook use cases that reside in the `vitam_usuario` application directory. This creates a separation between the design system source code (in `design_system/`) and its interactive documentation (in `vitam_usuario/widgetbook/`). This separation complicates maintenance, version synchronization, and makes it harder for new developers to find and understand component usage patterns.

## Goals

- **Centralization**: Consolidate all design system assets (components + documentation) in a single repository
- **Maintainability**: Reduce friction in keeping components and use cases in sync
- **Discoverability**: Make use cases easier to find as part of the design system package
- **Independence**: Remove dependency on vitam_usuario for design system documentation

## Non-Goals

- Refactoring Widgetbook architecture or changing how use cases are defined
- Modifying component implementations themselves
- Creating automated synchronization between multiple repositories
- Changing Widgetbook configuration or build process

## Decisions

### 1. Directory Structure Post-Migration
- **Location**: `design_system/widgetbook/` becomes the canonical location
- **Rationale**: Widgetbook is part of the design system package, not the user application
- **Alternative considered**: Keep in vitam_usuario but symlink (rejected - adds complexity and fragility)

### 2. Import Path Strategy
- **Approach**: Update all imports to reference design_system lib package
- **Rationale**: Ensures widgetbook works standalone and can be published independently if needed
- **Pattern**: Change `import 'package:usuario/...'` to `import 'package:design_system/...'`

### 3. Build Artifacts Handling
- **Approach**: .gitignore build artifacts; exclude `.dart_tool/` and `build/` directories
- **Rationale**: Generated files should not be versioned; developers regenerate locally
- **Update**: Ensure design_system/.gitignore covers widgetbook build artifacts

### 4. File Preservation
- **Approach**: Copy all source files; minimal modifications to preserve original functionality
- **Rationale**: Reduces risk of introducing bugs; changes are surgical and isolated to imports
- **Generated files**: main.directories.g.dart is regenerated on first build

## Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| Import path errors causing build failures | Test build locally in widgetbook before PR; automated tests check import resolution |
| Broken use case references if imports misconfigured | Validate all .dart files parse correctly; run widgetbook UI to confirm |
| CI/CD pipelines still reference old paths | Update all pipeline configurations and document changes |
| Sync issues if changes made in both locations | Single source of truth established in design_system; remove vitam_usuario copy after migration |
| File paths containing spaces on Windows | Verify copy operation handles paths with spaces correctly |

## Migration Plan

### Phase 1: Preparation (Non-breaking)
1. Document current structure and all import patterns
2. Create comprehensive mapping of what needs to move and where
3. Identify all files that reference old paths

### Phase 2: Migration (Implementation)
1. Copy complete widgetbook directory to design_system
2. Systematically update import paths in each file
3. Update configuration files and entry points
4. Test locally to ensure widgetbook builds and runs

### Phase 3: Validation (Testing)
1. Build widgetbook locally and verify no compilation errors
2. Open widgetbook UI and confirm all use cases are visible and functional
3. Run Flutter analysis: `flutter analyze`
4. Verify import statements with static analysis

### Phase 4: Finalization (Cleanup)
1. Update documentation and CI/CD references
2. Create pull request with migration changes
3. Optional: Remove vitam_usuario/widgetbook after approval and merge
4. Create archive entry for this change

### Rollback Plan
If issues arise before merge:
1. Revert git commits
2. Return to previous state with widgetbook in vitam_usuario
3. Investigate and retry with fixes

## Open Questions

- Should vitam_usuario/widgetbook be deleted immediately after migration, or kept for a grace period?
- Are there any CI/CD integrations specific to widgetbook that need updates?
- Should widgetbook be added as a dev dependency to the main pubspec.yaml?
