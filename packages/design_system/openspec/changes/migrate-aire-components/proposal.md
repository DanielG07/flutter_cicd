# Migrate AIRE Design System Components

## Why

The design system repository currently contains two parallel structures:
1. Production-ready AIRE components in `widgets/` with comprehensive design tokens (colors, typography, spacing, etc.) and 16+ components organized by atomic design
2. Placeholder demo components in `lib/` with a different naming scheme (DS-prefixed) and incomplete implementation

This creates confusion, prevents the actual AIRE components from being used as a package, and blocks the integration of professional cataloging tools like Widgetbook. The repository needs a single source of truth with the production-ready AIRE components properly structured as the main package export.

## What Changes

- **Delete placeholder structure:** Remove the existing `lib/src/` directory containing DS-prefixed demo components
- **Migrate design tokens:** Move all design token definitions from `widgets/design_tokens/` to `lib/src/design_tokens/`
  - Colors (primary, secondary, neutral, semantic palettes)
  - Typography (text styles for headings, body, buttons, labels)
  - Spacing (2xs through 6xl)
  - Border radius (xs through circular)
  - Breakpoints (responsive layout tokens)
  - Icons (size definitions)
- **Migrate atomic components:** Move all AIRE components from `widgets/` to `lib/src/` organized by atomic design
  - **Atoms** (9 components): AireButton, AireCheckbox, AireChip, AireIconButton, AireLink, AireAvatar, AireSwitch, AireRadioButton, AireTag, AireBadge
  - **Molecules** (7 components): AireInputText, AireToast, AireSlider, AireRangeSlider, AireInputSearch, AireList, AireSelect
  - **Organisms** (1 component): AireAppBar (moved from widgets root to organisms/navigation)
- **Fix import paths:** Update all components to use package-relative imports instead of relative paths
- **Update package exports:** Rewrite `lib/design_system.dart` to export all AIRE design tokens and components
- **Add Widgetbook integration:** Create new `widgetbook/` directory as a sibling Flutter app for comprehensive component cataloging
  - Support web, macOS, and Windows platforms
  - Generate use cases for all AIRE components
  - Configure for theme switching and device previews
- **Update example app:** Modify existing example app to showcase AIRE components instead of placeholder DS components

**BREAKING:** This completely replaces the public API of the design_system package. All DS-prefixed exports are removed and replaced with Aire-prefixed components. Since there are currently no consumers of this package, this breaking change has zero external impact.

## Impact

### Affected Specs
- **NEW:** `design-tokens` - Foundational design token system
- **NEW:** `atomic-components` - Component library organized by atomic design
- **NEW:** `widgetbook-catalog` - Component cataloging and documentation system

### Affected Code
- `lib/design_system.dart` - Complete rewrite of package exports
- `lib/src/` - Complete restructure from DS-prefixed to Aire-prefixed organization
- `example/` - Updated to use AIRE components
- **NEW:** `widgetbook/` - New Flutter app for component catalog
- `widgets/` - Source directory, will be eventually deprecated after successful migration
- `pubspec.yaml` - No changes needed (already Flutter package)
- **NEW:** `widgetbook/pubspec.yaml` - New dependencies for Widgetbook app

### Migration Path for Future Consumers
When this package eventually has consumers:
- Replace all `DS*` imports with `Aire*` equivalents
- Update design token references from `DSColors` → `AireColors`, `DSSpacing` → `AireSpacing`, etc.
- Components retain same functionality, only naming changes
- Consult `widgetbook/` catalog for updated component API documentation
