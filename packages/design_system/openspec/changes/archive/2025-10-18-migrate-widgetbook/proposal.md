## Why

The Widgetbook component use cases and documentation are currently scattered in the `vitam_usuario` repository, making it difficult to maintain design tokens, components, and their use cases in a centralized location. Migrating the widgetbook to the `design_system` repository centralizes all design system resources, enabling better visibility, consistency, and maintainability across all AIRE design system components.

## What Changes

- Migrate complete widgetbook directory from `vitam_usuario/widgetbook/` to `design_system/widgetbook/`
- Move all component use case files (Dart files under `lib/widgets/` and `lib/features/`)
- Update all import paths and references to align with the new centralized location
- Preserve all use case documentation and examples for atoms, molecules, and features
- Ensure widgetbook build configuration remains functional

## Impact

- **Affected specs**: `widgetbook-documentation` (new capability)
- **Affected code**:
  - All use case files in `lib/widgets/atoms/`, `lib/widgets/molecules/`, `lib/features/`
  - Import statements throughout widgetbook Dart files
  - Build configuration and pubspec.yaml references
  - Main widgetbook entry point (`lib/main.dart`)
- **Breaking changes**: None for end users; internal reorganization
- **Dependencies**: No external dependencies changed
