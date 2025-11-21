# Proposal: Validate Widgetbook Components Against Figma Designs

## Change ID
`validate-widgetbook-against-figma`

## Status
🟡 PROPOSED

## Author
Claude Code

## Date
2025-10-20

---

## Problem Statement

The current Widgetbook use cases were refactored in Phase 1 to use interactive knobs, achieving a 66% reduction in code (229→77 use cases). However, there's no systematic validation that these use cases accurately represent the design specifications in Figma. Additionally, some components like Button are missing important use cases that exist in Figma (e.g., loading states, specific interaction patterns).

**Key Issues:**
1. No validation that Widgetbook components visually match Figma designs
2. Missing use cases for states/variants documented in Figma
3. No verification of design token usage (colors, spacing, typography, border radius)
4. Inconsistent coverage across components

---

## Proposed Solution

Implement a systematic, component-by-component validation workflow using Figma MCP to:

1. **Analyze Figma designs** - Extract all documented states, variants, and specifications per component
2. **Compare with Widgetbook** - Verify visual equivalence and property accuracy (colors, sizes, spacing)
3. **Complete use cases** - Add missing states/variants as:
   - **Interactive use cases with knobs** for complex combinations
   - **Static use cases** only for specific important examples from Figma
   - **Comparison use cases** for grouped side-by-side views
4. **One component at a time** - Complete validation before moving to next component

**Validation Criteria:**
- ✅ Every state/variant in Figma exists in Widgetbook
- ✅ Visual properties match exactly (via Figma MCP inspection)
- ✅ Design tokens are used correctly throughout
- ✅ Interactive knobs enable exploration of all combinations
- ✅ Important specific cases have dedicated static use cases

---

## Success Criteria

### Per Component
- [ ] All Figma states/variants have corresponding Widgetbook use cases
- [ ] Visual properties (colors, spacing, typography, border radius) match Figma specs
- [ ] Interactive use cases with knobs cover all combinations
- [ ] Important specific examples have static use cases
- [ ] Component use case file is updated and builds successfully

### Overall Phase 2
- [ ] All 12 Atoms validated and completed (Button → Tag)
- [ ] All 6 Molecules validated and completed (InputText → List)
- [ ] Design token usage verified across all components
- [ ] Widgetbook builds without errors
- [ ] All changes committed to repository

---

## Scope

### In Scope
- **12 Atoms**: Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, DecisionSwitch, Tag, Avatar, AvatarGroup
- **6 Molecules**: InputText, InputSearch, Select, Slider, Toast, List
- Validation using Figma MCP only (no Playwright screenshots)
- Interactive use cases with knobs
- Static use cases for specific important examples
- Comparison use cases for grouped views
- Design token verification

### Out of Scope
- Playwright visual regression testing
- Automated screenshot comparison
- CI/CD integration
- Components outside Atoms/Molecules categories
- Creating new Figma designs (only implementing what exists)
- Modifying component implementation code (only use cases)

---

## Approach

### Workflow Per Component

1. **Analyze Figma** (via Figma MCP)
   - Identify all variants (e.g., Primary, Secondary, Tertiary, Ghost)
   - Identify all sizes (e.g., Large, Medium, Small, XSmall)
   - Identify all states (e.g., Default, Hover, Focus, Disabled, Loading, Pressed)
   - Identify all configurations (e.g., Icon positions, label variations)
   - Extract design specifications (colors, spacing, typography, border radius)

2. **Audit Current Widgetbook Use Cases**
   - List existing use cases
   - Identify missing states/variants
   - Check design token usage in component implementation

3. **Update Use Cases**
   - Enhance/maintain interactive use case with comprehensive knobs
   - Add static use cases for important specific examples from Figma
   - Add/update comparison use cases for grouped views
   - Ensure all Figma states/variants are represented

4. **Validate**
   - Build Widgetbook: `dart run build_runner build --delete-conflicting-outputs`
   - Verify all use cases render correctly
   - Visual spot-check key states match Figma

5. **Commit & Move to Next Component**

### Processing Order (Sequential)

**Atoms (12 components):**
1. Button
2. Badge
3. Checkbox
4. Chip
5. IconButton
6. Link
7. OptionListItem
8. RadioButton
9. Switch
10. DecisionSwitch
11. Tag
12. Avatar + AvatarGroup

**Molecules (6 components):**
1. InputText
2. InputSearch
3. Select
4. Slider
5. Toast
6. List

---

## Dependencies

### External Tools
- **Figma MCP Server** - Must be running and connected
- **Figma Design File** - Access to complete design system file
- **Flutter/Dart SDK** - 3.35.6 / 3.9.2
- **Widgetbook** - 3.16.0

### Internal Dependencies
- Phase 1 completion (knobs refactoring) ✅ DONE
- Component implementation code (no changes needed)
- Design tokens (AireColors, AireSpacing, AireTextStyles, AireBorderRadius)

---

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Figma MCP connection issues | High | Test connection before starting each component |
| Figma designs incomplete/inconsistent | Medium | Document gaps, skip missing states, continue |
| Too many use cases (code bloat) | Medium | Prioritize interactive knobs, limit static cases |
| Design token violations in implementation | Low | Document violations but don't modify component code |
| Build errors during refactoring | Low | Test build after each component, rollback if needed |

---

## Timeline Estimate

- **Per Atom Component**: 30-45 minutes (analysis + implementation + validation)
- **Per Molecule Component**: 45-60 minutes (more complex)
- **Total Atoms (12)**: ~6-9 hours
- **Total Molecules (6)**: ~4.5-6 hours
- **Total Phase 2**: ~10-15 hours

---

## Alternatives Considered

### Alternative 1: Automated Visual Regression with Screenshots
- **Pros**: Pixel-perfect validation, automated comparison
- **Cons**: Requires Playwright setup, Flutter Web limitations, complex infrastructure
- **Decision**: Deferred to future phase; focus on structural completeness first

### Alternative 2: All Static Use Cases (No Knobs)
- **Pros**: Explicit coverage, easy to spot-check
- **Cons**: Code explosion (hundreds of use cases), unmaintainable
- **Decision**: Rejected; use interactive knobs with selective static cases

### Alternative 3: Batch All Components at Once
- **Pros**: Faster overall
- **Cons**: Hard to track progress, risky (build errors affect all), less thorough
- **Decision**: Rejected; one-at-a-time ensures quality and checkpoints

---

## Open Questions

1. ✅ **RESOLVED**: Use Figma MCP only (no Playwright)
2. ✅ **RESOLVED**: Validate both visual equivalence AND exact properties
3. ✅ **RESOLVED**: Interactive knobs + selective static cases
4. ✅ **RESOLVED**: One component at a time, sequential processing
5. ✅ **RESOLVED**: Deliverable is updated use case files only

---

## Next Steps

1. ✅ Get approval for this proposal
2. Start with Button component (first Atom)
3. Establish validation workflow and template
4. Process remaining Atoms sequentially
5. Process Molecules sequentially
6. Final build and commit
