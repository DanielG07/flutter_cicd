# Specification: Widgetbook Knobs Refactoring and Visual Validation

## ADDED Requirements

### Requirement: Knobs-based Interactive Use Cases (FASE 1 - Priority)
All Widgetbook use cases for Atoms and Molecules components SHALL use knobs for interactive exploration of component properties.

#### Scenario: Interactive variant and property selection
- **GIVEN** a component with multiple variants, sizes, or configurable properties
- **WHEN** the use case is displayed in Widgetbook
- **THEN** knobs SHALL be provided for selecting all major properties (variant, size, color, state, etc.)
- **AND** the component SHALL update in real-time as knobs are changed
- **AND** knob labels SHALL be clear and use UPPERCASE for enum values

#### Scenario: Reduced code duplication
- **GIVEN** a component with multiple variants and properties
- **WHEN** implementing use cases with knobs
- **THEN** a single interactive use case SHALL replace 10+ separate static use case functions
- **AND** all variant combinations SHALL remain testable through knob interactions
- **AND** code reduction SHALL be at least 60% compared to verbose implementation

#### Scenario: Comparison use cases preserved
- **GIVEN** existing comparison use cases that show multiple variants side-by-side
- **WHEN** refactoring to knobs pattern
- **THEN** comparison use cases SHALL be kept for documentation purposes
- **AND** they SHALL be clearly labeled as "Comparison - [description]"

#### Scenario: Atoms components refactored
- **GIVEN** all Atoms components (Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, Tag, Avatar, AvatarGroup)
- **WHEN** knobs refactoring is complete
- **THEN** each component SHALL have at least one interactive use case with knobs
- **AND** Widgetbook SHALL build successfully with all refactored use cases

#### Scenario: Molecules components refactored
- **GIVEN** all Molecules components (InputText, InputSearch, Select, Slider, Toast, List)
- **WHEN** knobs refactoring is complete
- **THEN** each component SHALL have at least one interactive use case with knobs
- **AND** all previously supported configurations SHALL be accessible through knobs

## ADDED Requirements

### Requirement: Visual Validation Workflow
The Design System SHALL provide a workflow for validating Widgetbook components against Figma designs to ensure visual fidelity.

#### Scenario: Validate component against Figma
- **GIVEN** a component is implemented in Widgetbook
- **AND** the corresponding Figma design is available in Figma Desktop
- **WHEN** the validation workflow is executed
- **THEN** screenshots of the Widgetbook component SHALL be captured using Playwright
- **AND** the Figma design SHALL be retrieved using Figma Desktop MCP
- **AND** visual comparison SHALL be performed
- **AND** discrepancies SHALL be documented

#### Scenario: Component passes validation
- **GIVEN** a component implementation in Widgetbook
- **AND** the corresponding Figma design
- **WHEN** visual validation is performed
- **THEN** the component SHALL match the Figma design within acceptable rendering tolerance
- **AND** all design tokens SHALL be correctly applied

#### Scenario: Component fails validation
- **GIVEN** a component implementation in Widgetbook
- **AND** the corresponding Figma design
- **WHEN** visual validation is performed
- **AND** visual discrepancies are detected
- **THEN** the discrepancies SHALL be documented in a validation report
- **AND** the specific areas of mismatch SHALL be identified

### Requirement: Knobs-based Use Cases
Widgetbook use cases SHALL use knobs to allow interactive exploration of component variants and properties.

#### Scenario: Interactive variant selection
- **GIVEN** a component with multiple variants
- **WHEN** the use case is displayed in Widgetbook
- **THEN** knobs SHALL be provided for selecting variant, size, and other configurable properties
- **AND** the component SHALL update in real-time as knobs are changed

#### Scenario: Reduced code duplication
- **GIVEN** a component with multiple variants and sizes
- **WHEN** implementing use cases with knobs
- **THEN** a single use case function SHALL replace multiple separate use case functions
- **AND** all variant combinations SHALL remain testable through knob interactions

### Requirement: Design Tokens Validation
All Design System components SHALL use design tokens from the centralized design tokens directory.

#### Scenario: Verify color usage
- **GIVEN** a component implementation
- **WHEN** design tokens validation is performed
- **THEN** all colors SHALL be sourced from `AireColors` in `lib/src/design_tokens/aire_colors.dart`
- **AND** no hardcoded color values SHALL be present

#### Scenario: Verify spacing usage
- **GIVEN** a component implementation
- **WHEN** design tokens validation is performed
- **THEN** all spacing values SHALL be sourced from `AireSpacing` in `lib/src/design_tokens/aire_spacing.dart`
- **AND** no magic number spacing values SHALL be present

#### Scenario: Verify typography usage
- **GIVEN** a component implementation
- **WHEN** design tokens validation is performed
- **THEN** all text styles SHALL be sourced from `AireTextStyles` in `lib/src/design_tokens/aire_text_styles.dart`
- **AND** no inline TextStyle definitions SHALL be used for design system styles

#### Scenario: Verify border radius usage
- **GIVEN** a component implementation
- **WHEN** design tokens validation is performed
- **THEN** all border radius values SHALL be sourced from `AireBorderRadius` in `lib/src/design_tokens/aire_border_radius.dart`

### Requirement: Atoms Category Validation
All Atoms components SHALL be validated against Figma designs with pixel-perfect accuracy.

#### Scenario: Validate Button component
- **GIVEN** the AireButton component in Widgetbook
- **AND** the Button designs in Figma Desktop
- **WHEN** validation is performed
- **THEN** all button variants (primary, secondary, tertiary, ghost) SHALL be validated
- **AND** all button sizes (large, medium, small, xsmall) SHALL be validated
- **AND** button states (enabled, disabled) SHALL be validated
- **AND** icon configurations (leading, trailing, no icon) SHALL be validated

#### Scenario: Validate remaining Atoms components
- **GIVEN** each Atoms component (Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, Tag)
- **AND** their corresponding Figma designs
- **WHEN** validation is performed
- **THEN** all variants and states for each component SHALL be validated
- **AND** design token usage SHALL be verified
- **AND** any discrepancies SHALL be documented

### Requirement: Validation Documentation
Visual validation results SHALL be documented for review and tracking.

#### Scenario: Generate validation report
- **GIVEN** validation has been performed on all Atoms components
- **WHEN** creating the validation report
- **THEN** the report SHALL include screenshots from both Widgetbook and Figma
- **AND** the report SHALL document any visual discrepancies found
- **AND** the report SHALL list design token usage verification results
- **AND** the report SHALL provide recommendations for addressing discrepancies

#### Scenario: Document validation workflow
- **GIVEN** the completed validation workflow
- **WHEN** documenting for future use
- **THEN** the workflow steps SHALL be documented
- **AND** knobs implementation patterns SHALL be documented
- **AND** reusable validation scripts or patterns SHALL be created for future categories
