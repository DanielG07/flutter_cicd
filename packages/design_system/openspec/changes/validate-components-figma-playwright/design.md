# Design: Widgetbook Knobs Refactoring and Visual Validation

## Context
The Design System components in Widgetbook need automated visual validation against Figma designs to ensure pixel-perfect accuracy. Currently:
- Use cases are verbose with separate functions for each variant combination
- No automated validation workflow exists
- Manual visual inspection is time-consuming and error-prone
- Design tokens standardization needs verification across components

Stakeholders:
- Design team: Requires high-fidelity implementation of Figma designs
- Engineering team: Needs maintainable, testable component library
- Users: Expect consistent UI matching design specifications

## Goals / Non-Goals

### Goals - FASE 1 (Priority)
- **Refactor ALL Atoms use cases** to use knobs pattern (12 components)
- **Refactor ALL Molecules use cases** to use knobs pattern (6 components)
- **Reduce code duplication by ~70%** through consolidation
- **Follow Widgetbook best practices** for interactive component exploration
- **Maintain comparison use cases** for documentation purposes
- **Ensure backward compatibility** (no API changes to components)

### Goals - FASE 2
- Establish visual validation workflow using Playwright MCP + Figma MCP
- Validate all refactored components against Figma with pixel-perfect accuracy
- Ensure consistent design tokens usage across all components
- Document visual discrepancies and recommendations

### Non-Goals
- Modifying component implementations during refactoring (only use cases)
- Building a generic visual regression testing framework
- Automating Figma design extraction for code generation
- Creating CI/CD integration for validation (future enhancement)
- Validating Organisms category (not in current scope)

## Decisions

### Decision 1: Knobs-based Use Cases Pattern
**What**: Consolidate multiple use case functions into single use cases with Widgetbook knobs for variant selection

**Why**:
- Reduces code duplication (e.g., Button has 24+ separate use case functions)
- Makes it easier to test all combinations interactively
- Follows Widgetbook best practices and standard patterns
- Improves maintainability

**Implementation**:
```dart
// Before: 24+ separate functions
@widgetbook.UseCase(name: 'Primary - Large', type: AireButton)
Widget buildPrimaryLargeUseCase(BuildContext context) { ... }

@widgetbook.UseCase(name: 'Primary - Medium', type: AireButton)
Widget buildPrimaryMediumUseCase(BuildContext context) { ... }
// ... 20+ more functions

// After: 1 consolidated function with knobs
@widgetbook.UseCase(name: 'Interactive', type: AireButton)
Widget buildButtonUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireButton(
        text: context.knobs.string(label: 'Text', initialValue: 'Button'),
        variant: context.knobs.list(
          label: 'Variant',
          options: ButtonVariant.values,
          labelBuilder: (v) => v.name,
        ),
        size: context.knobs.list(
          label: 'Size',
          options: ButtonSize.values,
          labelBuilder: (s) => s.name,
        ),
        enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
        onPressed: () => debugPrint('Button pressed'),
      ),
    ),
  );
}
```

**Alternatives considered**:
- Keep existing verbose pattern: Rejected due to maintenance burden
- Use code generation: Overkill for this use case, adds build complexity
- Hybrid approach (some knobs + some static): Creates inconsistency

### Decision 2: Manual Playwright + Figma Validation Workflow
**What**: Use MCPs interactively to validate components rather than building automated test suite

**Why**:
- Faster implementation for initial validation
- Allows human judgment for acceptable differences (anti-aliasing, rendering differences)
- MCP tools provide sufficient capabilities for component-by-component validation
- Automation can be added later as enhancement if needed

**Implementation Flow**:
1. Start Widgetbook with `flutter run`
2. Navigate to component in browser via Playwright MCP
3. Capture screenshot using Playwright
4. Fetch Figma design using Figma Desktop MCP (with node ID)
5. Visual comparison and human review
6. Document discrepancies if found
7. Repeat for each component

**Alternatives considered**:
- Automated visual regression suite (Percy, Chromatic): Requires infrastructure setup, cost
- Figma API screenshot comparison: Desktop MCP already configured, API adds complexity
- Manual-only validation: Too slow and error-prone

### Decision 3: Component-by-Component Validation Starting with Atoms
**What**: Validate components sequentially by category, starting with Atoms

**Why**:
- Atoms are foundational building blocks
- Allows refinement of workflow before tackling complex components
- Provides immediate value and learning
- User explicitly requested starting with Atoms

**Sequencing**:
1. Atoms (this change): Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, Tag
2. Molecules (future): Input, Select, Slider, Toast, List
3. Avatars (future): Avatar, AvatarGroup
4. Organisms (future): AppBar, etc.

### Decision 4: Design Tokens Verification
**What**: Verify components use design tokens from `lib/src/design_tokens/` correctly

**Why**:
- Ensures consistency across design system
- User explicitly mentioned validating tokens usage
- Tokens are source of truth for spacing, colors, typography, etc.

**Verification points**:
- Colors from `AireColors`
- Spacing from `AireSpacing`
- Typography from `AireTextStyles`
- Border radius from `AireBorderRadius`

## Risks / Trade-offs

### Risk: Figma Node IDs May Change
**Impact**: Medium
**Mitigation**: Document node IDs at start; Figma Desktop MCP can extract current selection

### Risk: Flutter Web Rendering Differences
**Impact**: Low
**Mitigation**: Accept minor anti-aliasing differences; focus on layout, spacing, colors

### Risk: Time Investment for Manual Validation
**Impact**: Medium
**Mitigation**: Start with highest-priority components; automation can be added incrementally

### Trade-off: Manual vs Automated Validation
**Chosen**: Manual interactive validation
**Trade-off**: Faster initial implementation but requires human time per component
**Future path**: Can automate if validation becomes frequent need

## Migration Plan

### Phase 1: Setup (tasks 1.x)
- Verify environment
- Document Figma node IDs
- Start Widgetbook

### Phase 2: Refactor + Validate (tasks 2.x - 11.x)
- For each component:
  1. Refactor use cases to use knobs
  2. Test in Widgetbook
  3. Validate with Playwright + Figma
  4. Verify design tokens
  5. Document any issues

### Phase 3: Documentation (tasks 12.x - 13.x)
- Create validation report
- Document patterns for future use
- Prepare for next categories

### Rollback Plan
- Git revert commit(s) restores original use cases
- No breaking changes to component APIs
- Widgetbook still functional throughout

## Open Questions
- Q: Should we capture validation screenshots for documentation?
  - A: Yes, helpful for validation report (task 12.1)

- Q: What tolerance level for pixel differences due to rendering?
  - A: User specified "pixel-perfect" - document any differences for design team review

- Q: Should comparison use cases be kept or removed?
  - A: Keep as separate use cases for documentation purposes; consolidate only variant/size combinations
