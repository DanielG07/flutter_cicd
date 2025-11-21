## ADDED Requirements

### Requirement: Figma Design Equivalence Validation
Widgetbook use cases SHALL be validated against Figma designs to ensure visual and functional equivalence for all documented component states, variants, and sizes. Every state, variant, and size documented in Figma MUST have a corresponding representation in Widgetbook.

#### Scenario: All Figma variants represented
- **WHEN** analyzing a component in Figma via MCP
- **THEN** every documented variant (e.g., Primary, Secondary, Tertiary, Ghost) has a corresponding Widgetbook use case
- **AND** every size (e.g., Large, Medium, Small, XSmall) is represented
- **AND** every state (e.g., Default, Hover, Focus, Disabled, Loading) is covered

#### Scenario: Visual property accuracy
- **WHEN** inspecting a Widgetbook use case against its Figma counterpart
- **THEN** visual properties match exactly including colors, spacing, typography, and border radius
- **AND** measurements align with design specifications
- **AND** any deviations are documented as known issues

#### Scenario: Missing states identification
- **WHEN** comparing Widgetbook use cases to Figma designs
- **THEN** any missing states or variants are identified and documented
- **AND** a plan is created to add the missing use cases
- **AND** the component is marked incomplete until all states are added

### Requirement: Design Token Verification
All component implementations SHALL use design tokens from AireColors, AireSpacing, AireTextStyles, and AireBorderRadius. Hardcoded values SHALL NOT be used for design properties that have corresponding tokens.

#### Scenario: Color token usage
- **WHEN** inspecting component color properties in the implementation
- **THEN** all colors reference design tokens from AireColors
- **AND** no hardcoded color values (e.g., Color(0xFF123456)) exist
- **AND** color usage matches Figma specifications

#### Scenario: Spacing token usage
- **WHEN** inspecting component spacing and padding properties
- **THEN** all spacing values reference design tokens from AireSpacing
- **AND** no hardcoded numeric values exist for margins or padding
- **AND** spacing matches Figma specifications

#### Scenario: Typography token usage
- **WHEN** inspecting text style properties
- **THEN** all text styles reference design tokens from AireTextStyles
- **AND** no hardcoded font sizes, weights, or families exist
- **AND** typography matches Figma specifications

#### Scenario: Border radius token usage
- **WHEN** inspecting component border radius properties
- **THEN** all border radius values reference design tokens from AireBorderRadius
- **AND** no hardcoded BorderRadius values exist
- **AND** border radius matches Figma specifications

### Requirement: Interactive Use Case Coverage
Widgetbook SHALL provide interactive use cases with knobs that enable exploration of all major component property combinations. Interactive use cases SHALL be the primary mechanism for demonstrating component flexibility.

#### Scenario: Interactive knobs for primary properties
- **WHEN** a developer views an interactive use case in Widgetbook
- **THEN** knobs are available for all major properties (variant, size, state, icons, labels)
- **AND** changing knob values immediately updates the rendered component
- **AND** all valid combinations are explorable through knobs

#### Scenario: Knob combinations match Figma variants
- **WHEN** comparing interactive knob options to Figma variants
- **THEN** every Figma variant has a corresponding knob value
- **AND** knob combinations can reproduce all documented Figma states
- **AND** knob labels match Figma variant names

### Requirement: Static Use Case Examples
Widgetbook SHALL include static use cases for specific important examples documented in Figma. Static use cases SHALL be used selectively to showcase specific configurations that represent common or critical usage patterns.

#### Scenario: Important examples from Figma
- **WHEN** Figma documents specific important examples (e.g., "Primary Loading Button", "Error State Toast")
- **THEN** corresponding static use cases exist in Widgetbook
- **AND** static use cases are clearly labeled to match Figma examples
- **AND** static use cases supplement (not replace) interactive use cases

#### Scenario: Comparison use cases for grouped views
- **WHEN** Figma shows grouped comparisons of variants or states
- **THEN** corresponding comparison use cases exist showing components side-by-side
- **AND** comparison use cases help visualize differences between variants
- **AND** comparison use cases match the grouping shown in Figma

### Requirement: Component-by-Component Validation Workflow
Validation SHALL be performed one component at a time in sequential order. Each component MUST be fully validated, updated, and committed before moving to the next component.

#### Scenario: Sequential component processing
- **WHEN** validating components against Figma
- **THEN** only one component is analyzed and updated at a time
- **AND** the component passes build validation before moving to the next
- **AND** changes are committed after each component completion

#### Scenario: Validation workflow per component
- **WHEN** validating a single component
- **THEN** Figma designs are analyzed via MCP first
- **AND** current Widgetbook use cases are audited second
- **AND** use cases are updated third
- **AND** Widgetbook build is validated fourth
- **AND** changes are committed fifth

#### Scenario: Build validation checkpoint
- **WHEN** completing use case updates for a component
- **THEN** Widgetbook builds successfully without errors
- **AND** all updated use cases render correctly
- **AND** no regressions are introduced to other components

### Requirement: Validation Scope Definition
Validation SHALL cover all Atoms (12 components) and Molecules (6 components) as defined in the Figma design system. Components outside these categories are out of scope for this validation phase.

#### Scenario: Atoms in scope
- **WHEN** planning validation work
- **THEN** the following Atoms are included: Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, DecisionSwitch, Tag, Avatar, AvatarGroup
- **AND** all 12 Atoms must be validated before moving to Molecules

#### Scenario: Molecules in scope
- **WHEN** planning validation work
- **THEN** the following Molecules are included: InputText, InputSearch, Select, Slider, Toast, List
- **AND** all 6 Molecules are validated after completing Atoms

#### Scenario: Out of scope components
- **WHEN** encountering components outside Atoms/Molecules
- **THEN** they are explicitly excluded from this validation phase
- **AND** they are documented for future validation work
- **AND** no validation effort is spent on out-of-scope components

## MODIFIED Requirements

### Requirement: Component Use Case Organization
Widgetbook SHALL organize component use cases hierarchically by component type: atoms, molecules, and features. Each component SHALL have at least one use case demonstrating its primary usage pattern. Use cases SHALL include interactive use cases with knobs, static use cases for specific examples, and comparison use cases for grouped views.

#### Scenario: Atom use cases present
- **WHEN** viewing the Widgetbook UI under the atoms section
- **THEN** use cases are visible for Avatar, Badge, Button, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, Tag, and all other atom components
- **AND** each atom has at least one interactive use case with knobs
- **AND** important atoms have additional static and comparison use cases as documented in Figma

#### Scenario: Molecule use cases present
- **WHEN** viewing the Widgetbook UI under the molecules section
- **THEN** use cases are visible for Input, InputSearch, List, SelectSingle, Slider, Toast, and all other molecule components
- **AND** each molecule has at least one interactive use case with knobs
- **AND** important molecules have additional static and comparison use cases as documented in Figma

#### Scenario: Feature use cases present
- **WHEN** viewing the Widgetbook UI under the features section
- **THEN** use cases are visible for SuccessDialog and all other feature-level components
- **AND** each feature has use cases demonstrating its primary usage pattern

#### Scenario: Use case types diversity
- **WHEN** examining use cases for a component
- **THEN** at least one interactive use case with comprehensive knobs exists
- **AND** static use cases exist for specific important examples from Figma (if applicable)
- **AND** comparison use cases exist for grouped variant views (if applicable)
