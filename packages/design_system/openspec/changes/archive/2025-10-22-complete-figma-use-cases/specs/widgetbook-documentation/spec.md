## MODIFIED Requirements

### Requirement: Component Use Case Organization
Widgetbook SHALL organize component use cases hierarchically by component type: atoms, molecules, and features. Each component SHALL have complete coverage of ALL states, variants, and sizes documented in Figma. Use cases SHALL include interactive use cases with knobs, static use cases for specific examples, and comparison use cases for grouped views, ensuring 100% parity with Figma designs.

#### Scenario: Complete Atom use cases coverage
- **WHEN** analyzing any atom component (Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, DecisionSwitch, Tag, Avatar, AvatarGroup)
- **THEN** every state, variant, and size documented in Figma has a corresponding use case in Widgetbook
- **AND** interactive use cases with knobs cover all explorable combinations
- **AND** static use cases exist for specific important Figma examples
- **AND** comparison use cases exist where Figma shows grouped views
- **AND** no use cases from Figma are missing

#### Scenario: Complete Molecule use cases coverage
- **WHEN** analyzing any molecule component (InputText, InputSearch, Select, Slider, Toast, List)
- **THEN** every state, variant, and size documented in Figma has a corresponding use case in Widgetbook
- **AND** interactive use cases with knobs cover all explorable combinations
- **AND** static use cases exist for specific important Figma examples
- **AND** comparison use cases exist where Figma shows grouped views
- **AND** no use cases from Figma are missing

#### Scenario: Feature use cases present
- **WHEN** viewing the Widgetbook UI under the features section
- **THEN** use cases are visible for all feature-level components
- **AND** each feature has use cases demonstrating its primary usage pattern

#### Scenario: Use case types diversity
- **WHEN** examining use cases for a component
- **THEN** at least one interactive use case with comprehensive knobs exists
- **AND** static use cases exist for specific important examples from Figma (if applicable)
- **AND** comparison use cases exist for grouped variant views (if applicable)
- **AND** the combination of use case types provides complete coverage of all Figma-documented variations

## ADDED Requirements

### Requirement: Figma-Widgetbook Use Case Completeness
For every component in scope (12 Atoms, 6 Molecules), Widgetbook use cases SHALL achieve 100% coverage of all states, variants, sizes, and configurations documented in the Figma design file. This SHALL be verified component by component using Figma Desktop MCP.

#### Scenario: Component-by-component Figma analysis
- **WHEN** starting work on a specific component (e.g., Badge, Button, Checkbox)
- **THEN** Figma Desktop MCP is used to access the selected component in Figma
- **AND** all variants are extracted (e.g., Primary, Secondary, Tertiary)
- **AND** all sizes are extracted (e.g., Large, Medium, Small, XSmall)
- **AND** all states are extracted (e.g., Default, Hover, Disabled, Loading)
- **AND** all configurations are extracted (e.g., with icon, without icon, icon-only)

#### Scenario: Gap identification between Figma and Widgetbook
- **WHEN** comparing Figma variants to existing Widgetbook use cases
- **THEN** missing use cases are identified and documented
- **AND** redundant or obsolete use cases are noted
- **AND** a specific action plan is created for that component

#### Scenario: Use case implementation for missing variants
- **WHEN** implementing missing use cases for a component
- **THEN** new use case functions are added to the component's `*_use_cases.dart` file
- **AND** use cases follow existing patterns (interactive with knobs, static, or comparison)
- **AND** design tokens from `widgets/design_tokens` are used exclusively
- **AND** code is formatted and follows Dart/Flutter best practices

#### Scenario: Build validation after use case additions
- **WHEN** completing use case additions for a component
- **THEN** `dart run build_runner build --delete-conflicting-outputs` executes successfully
- **AND** Widgetbook compiles without errors
- **AND** all new use cases render correctly in Widgetbook UI
- **AND** no regressions are introduced to existing use cases

### Requirement: Sequential Component Processing
Components SHALL be completed one at a time in a defined order. No component shall be started until the previous component's use cases are fully implemented, validated, and committed.

#### Scenario: Atoms processed before Molecules
- **WHEN** executing the complete-figma-use-cases workflow
- **THEN** all 12 Atoms are completed before starting any Molecule
- **AND** Atoms are processed in a consistent order (alphabetical or by complexity)

#### Scenario: Single component focus
- **WHEN** working on a specific component
- **THEN** only that component's use case file is modified
- **AND** the component is fully completed (analysis → implementation → validation)
- **AND** changes are committed before moving to the next component

#### Scenario: Progress tracking per component
- **WHEN** completing each component
- **THEN** progress is documented in tasks.md with checkboxes
- **AND** completion status includes: Figma analyzed, gaps identified, use cases added, build validated
- **AND** the next component is explicitly identified

### Requirement: Figma Desktop MCP Integration
Figma design analysis SHALL be performed using Figma Desktop MCP, which provides direct access to the currently selected component in the Figma desktop app. No hardcoded node-ids are required.

#### Scenario: Accessing Figma component via MCP
- **WHEN** analyzing a component (e.g., Button)
- **THEN** the component is selected in Figma Desktop app
- **AND** Figma Desktop MCP tool `get_design_context` is called without nodeId parameter
- **AND** the MCP returns complete design metadata for the selected component
- **AND** all variants, properties, and specifications are extracted from the MCP response

#### Scenario: MCP connection verification
- **WHEN** starting work on a component
- **THEN** Figma Desktop MCP connection is verified as active
- **AND** if disconnected, instructions are provided to reconnect
- **AND** work proceeds only after successful MCP connection

#### Scenario: Extracting component specifications from MCP
- **WHEN** receiving Figma design context from MCP
- **THEN** variant names are extracted (e.g., "Primary", "Secondary")
- **AND** size options are extracted (e.g., "Large", "Medium", "Small")
- **AND** state variations are extracted (e.g., "Default", "Hover", "Disabled")
- **AND** visual properties are extracted (colors, spacing, typography, border radius)

### Requirement: Design Token Consistency
All use case implementations SHALL use design tokens from the standardized design_tokens directory. Hardcoded values SHALL NOT be introduced.

#### Scenario: Color token usage in new use cases
- **WHEN** implementing use cases that specify colors
- **THEN** colors reference AireColors tokens exclusively (e.g., AireColors.primary400, AireColors.neutral200)
- **AND** no hardcoded Color() values are used
- **AND** color choices match Figma specifications

#### Scenario: Spacing token usage in new use cases
- **WHEN** implementing use cases that specify spacing or padding
- **THEN** spacing references AireSpacing tokens (e.g., AireSpacing.spacing16, AireSpacing.spacing8)
- **AND** no hardcoded numeric padding/margin values are used
- **AND** spacing choices match Figma specifications

#### Scenario: Typography token usage in new use cases
- **WHEN** implementing use cases that specify text styles
- **THEN** text styles reference AireTextStyles tokens (e.g., AireTextStyles.bodyMedium, AireTextStyles.heading2)
- **AND** no hardcoded fontSize, fontWeight, or fontFamily values are used
- **AND** typography choices match Figma specifications

#### Scenario: Border radius token usage in new use cases
- **WHEN** implementing use cases that specify border radius
- **THEN** border radius references AireBorderRadius tokens (e.g., AireBorderRadius.small, AireBorderRadius.full)
- **AND** no hardcoded BorderRadius.circular() values are used
- **AND** border radius choices match Figma specifications

### Requirement: Component Scope Definition
The scope of this change SHALL be limited to 12 Atoms and 6 Molecules. Components outside this scope SHALL be explicitly excluded.

#### Scenario: Atoms in scope
- **WHEN** planning work for this change
- **THEN** the following 12 Atoms are included: Avatar, AvatarGroup, Badge, Button, Checkbox, Chip, DecisionSwitch, IconButton, Link, OptionListItem, RadioButton, Switch, Tag
- **AND** all 12 must be completed

#### Scenario: Molecules in scope
- **WHEN** planning work for this change
- **THEN** the following 6 Molecules are included: InputText, InputSearch, List, Select, Slider, Toast
- **AND** all 6 must be completed

#### Scenario: Out of scope components
- **WHEN** encountering components outside the defined Atoms/Molecules list
- **THEN** they are explicitly excluded from this change
- **AND** no effort is spent analyzing or implementing use cases for them
- **AND** they are documented for potential future work
