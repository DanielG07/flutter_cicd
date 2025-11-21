# Tasks: Validate Widgetbook Components Against Figma

## Change ID
`validate-widgetbook-against-figma`

---

## Task Breakdown

### Phase 1: Setup & Template (1 task)
- [x] **T1.1** Create OpenSpec proposal and get approval
- [x] **T1.2** Establish validation workflow template with first component (Button)

### Phase 2: Atoms Validation (12 components × 4-5 tasks each)

#### Button Component
- [x] **T2.1** Analyze Figma Button designs via MCP (variants, states, sizes, specs)
- [x] **T2.2** Audit current Button use cases in Widgetbook
- [x] **T2.3** Update Button use cases (interactive knobs + static + comparison)
- [x] **T2.4** Build and validate Button component
- [x] **T2.5** Commit Button changes

#### Badge Component
- [x] **T2.6** Analyze Figma Badge designs via MCP
- [x] **T2.7** Audit current Badge use cases
- [x] **T2.8** Update Badge use cases
- [x] **T2.9** Build and validate Badge component
- [x] **T2.10** Commit Badge changes

#### Checkbox Component
- [x] **T2.11** Analyze Figma Checkbox designs via MCP
- [x] **T2.12** Audit current Checkbox use cases
- [x] **T2.13** Update Checkbox use cases
- [x] **T2.14** Build and validate Checkbox component
- [x] **T2.15** Commit Checkbox changes

#### Chip Component
- [x] **T2.16** Analyze Figma Chip designs via MCP
- [x] **T2.17** Audit current Chip use cases
- [x] **T2.18** Update Chip use cases
- [x] **T2.19** Build and validate Chip component
- [x] **T2.20** Commit Chip changes

#### IconButton Component
- [x] **T2.21** Analyze Figma IconButton designs via MCP
- [x] **T2.22** Audit current IconButton use cases
- [x] **T2.23** Update IconButton use cases
- [x] **T2.24** Build and validate IconButton component
- [x] **T2.25** Commit IconButton changes

#### Link Component
- [x] **T2.26** Analyze Figma Link designs via MCP
- [x] **T2.27** Audit current Link use cases
- [x] **T2.28** Update Link use cases
- [x] **T2.29** Build and validate Link component
- [x] **T2.30** Commit Link changes

#### OptionListItem Component
- [x] **T2.31** Analyze Figma OptionListItem designs via MCP
- [x] **T2.32** Audit current OptionListItem use cases
- [x] **T2.33** Update OptionListItem use cases
- [x] **T2.34** Build and validate OptionListItem component
- [x] **T2.35** Commit OptionListItem changes

#### RadioButton Component
- [x] **T2.36** Analyze Figma RadioButton designs via MCP
- [x] **T2.37** Audit current RadioButton use cases
- [x] **T2.38** Update RadioButton use cases
- [x] **T2.39** Build and validate RadioButton component
- [x] **T2.40** Commit RadioButton changes

#### Switch Component
- [x] **T2.41** Analyze Figma Switch designs via MCP
- [x] **T2.42** Audit current Switch use cases
- [x] **T2.43** Update Switch use cases
- [x] **T2.44** Build and validate Switch component
- [x] **T2.45** Commit Switch changes

#### DecisionSwitch Component
- [x] **T2.46** Analyze Figma DecisionSwitch designs via MCP
- [x] **T2.47** Audit current DecisionSwitch use cases
- [x] **T2.48** Update DecisionSwitch use cases
- [x] **T2.49** Build and validate DecisionSwitch component
- [x] **T2.50** Commit DecisionSwitch changes

#### Tag Component
- [x] **T2.51** Analyze Figma Tag designs via MCP
- [x] **T2.52** Audit current Tag use cases
- [x] **T2.53** Update Tag use cases
- [x] **T2.54** Build and validate Tag component
- [x] **T2.55** Commit Tag changes

#### Avatar + AvatarGroup Components
- [x] **T2.56** Analyze Figma Avatar/AvatarGroup designs via MCP
- [x] **T2.57** Audit current Avatar/AvatarGroup use cases
- [x] **T2.58** Update Avatar/AvatarGroup use cases
- [x] **T2.59** Build and validate Avatar/AvatarGroup components
- [x] **T2.60** Commit Avatar/AvatarGroup changes

### Phase 3: Molecules Validation (6 components × 4-5 tasks each)

#### InputText Component
- [x] **T3.1** Analyze Figma InputText designs via MCP
- [x] **T3.2** Audit current InputText use cases
- [x] **T3.3** Update InputText use cases
- [x] **T3.4** Build and validate InputText component
- [x] **T3.5** Commit InputText changes

#### InputSearch Component
- [x] **T3.6** Analyze Figma InputSearch designs via MCP
- [x] **T3.7** Audit current InputSearch use cases
- [x] **T3.8** Update InputSearch use cases
- [x] **T3.9** Build and validate InputSearch component
- [x] **T3.10** Commit InputSearch changes

#### Select Component
- [x] **T3.11** Analyze Figma Select designs via MCP
- [x] **T3.12** Audit current Select use cases
- [x] **T3.13** Update Select use cases
- [x] **T3.14** Build and validate Select component
- [x] **T3.15** Commit Select changes

#### Slider Component
- [x] **T3.16** Analyze Figma Slider designs via MCP
- [x] **T3.17** Audit current Slider use cases
- [x] **T3.18** Update Slider use cases
- [x] **T3.19** Build and validate Slider component
- [x] **T3.20** Commit Slider changes

#### Toast Component
- [x] **T3.21** Analyze Figma Toast designs via MCP
- [x] **T3.22** Audit current Toast use cases
- [x] **T3.23** Update Toast use cases
- [x] **T3.24** Build and validate Toast component
- [x] **T3.25** Commit Toast changes

#### List Component
- [x] **T3.26** Analyze Figma List designs via MCP
- [x] **T3.27** Audit current List use cases
- [x] **T3.28** Update List use cases
- [x] **T3.29** Build and validate List component
- [x] **T3.30** Commit List changes

### Phase 4: Finalization
- [x] **T4.1** Final full Widgetbook build verification
- [x] **T4.2** Final commit with all Phase 2 changes
- [x] **T4.3** Create summary report of validation work

---

## Task Dependencies

```
T1.1 (Proposal) → T1.2 (Template with Button)
  ↓
T2.1-T2.5 (Button) → T2.6-T2.10 (Badge) → ... → T2.56-T2.60 (Avatar)
  ↓
T3.1-T3.5 (InputText) → ... → T3.26-T3.30 (List)
  ↓
T4.1-T4.3 (Finalization)
```

**Sequential Processing**: Each component must be completed and committed before starting the next.

---

## Validation Checklist (Per Component)

For each component, verify:

- [x] Figma analysis complete (all states/variants documented)
- [x] Interactive use case has knobs for all major properties
- [x] Static use cases added for specific Figma examples
- [x] Comparison use cases show grouped variants side-by-side
- [x] Design tokens verified in implementation (colors, spacing, typography, border radius)
- [x] Widgetbook builds successfully
- [x] Visual spot-check matches Figma
- [x] Changes committed to repository

---

## Progress Tracking

**Total Tasks**: 103 tasks
**Completed**: 103 (100%)
**Remaining**: 0
**Current Phase**: COMPLETED
**Current Component**: All components validated and complete

---

## Notes

- Each component follows the same 4-5 task pattern: Analyze → Audit → Update → Build → Commit
- Commits after each component provide safe checkpoints
- Build validation after each component prevents accumulating errors
- Sequential processing ensures quality and thoroughness
