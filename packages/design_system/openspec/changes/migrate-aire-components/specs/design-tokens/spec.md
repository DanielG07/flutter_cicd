# Design Tokens Specification

## ADDED Requirements

### Requirement: Color Token System
The design system SHALL provide a comprehensive color palette organized into primary, secondary, neutral, and semantic categories following WCAG 2.1 accessibility standards.

#### Scenario: Primary color usage
- **WHEN** a component requires the main brand color
- **THEN** `AireColors.primary400` provides the primary blue color (#2D59F0)

#### Scenario: Semantic error color
- **WHEN** displaying an error state
- **THEN** `AireColors.error400` provides the standard error red (#EE1616)

#### Scenario: Contrast calculation
- **WHEN** determining text color for a background
- **THEN** `AireColors.getTextColorForBackground()` returns appropriate contrasting color (white or neutral700)

### Requirement: Typography Token System
The design system SHALL provide a complete typography scale with predefined text styles for headings, body text, buttons, labels, and placeholders.

#### Scenario: Heading text style
- **WHEN** rendering a large heading
- **THEN** `AireTextStyles.heading1Bold` provides appropriate font size, weight, and line height

#### Scenario: Button text style
- **WHEN** rendering a medium button
- **THEN** `AireTextStyles.buttonMedium` provides the correct typography for button labels

#### Scenario: Body text style
- **WHEN** displaying regular content
- **THEN** `AireTextStyles.bodyMediumRegular` provides readable body text styling

### Requirement: Spacing Token System
The design system SHALL provide consistent spacing values ranging from 2xs (4px) to 6xl (120px) for layouts, padding, and margins.

#### Scenario: Standard padding
- **WHEN** adding padding to a container
- **THEN** `AireSpacing.spacingMd` provides 16px spacing value

#### Scenario: Horizontal spacing widget
- **WHEN** adding horizontal space between elements
- **THEN** `AireSpacing.horizontalSpaceMd` provides a SizedBox with 16px width

#### Scenario: Vertical spacing widget
- **WHEN** adding vertical space between elements
- **THEN** `AireSpacing.verticalSpaceLg` provides a SizedBox with 24px height

### Requirement: Border Radius Token System
The design system SHALL provide predefined border radius values from xs (4px) to circular (9999px) for consistent component styling.

#### Scenario: Small border radius
- **WHEN** styling an input field
- **THEN** `AireBorderRadius.borderXs` provides 4px rounded corners

#### Scenario: Circular border radius
- **WHEN** styling a button or avatar
- **THEN** `AireBorderRadius.borderCircular` provides fully rounded borders

### Requirement: Breakpoint Token System
The design system SHALL provide responsive breakpoint definitions for mobile, tablet, desktop, and desktop XL layouts with corresponding margin values.

#### Scenario: Mobile breakpoint detection
- **WHEN** screen width is less than 768px
- **THEN** `AireBreakpoints.mobile` threshold identifies mobile layout

#### Scenario: Desktop margin
- **WHEN** applying page margins on desktop
- **THEN** `AireBreakpoints.marginDesktop` provides appropriate spacing (40px)

### Requirement: Icon Size Token System
The design system SHALL provide standardized icon sizes from 2xs (12px) to 2xl (40px) compatible with Font Awesome and material icons.

#### Scenario: Small icon size
- **WHEN** rendering an icon in a button
- **THEN** `AireIconSizes.iconSm` provides 16px icon size

#### Scenario: Large icon size
- **WHEN** displaying a prominent icon
- **THEN** `AireIconSizes.iconXl` provides 32px icon size

### Requirement: Design Token Barrel Export
The design system SHALL provide a single import point for all design tokens via a barrel file.

#### Scenario: Importing all tokens
- **WHEN** a component file needs multiple token types
- **THEN** importing `package:design_system/src/design_tokens/design_tokens.dart` provides access to all token classes

#### Scenario: Token availability
- **WHEN** using the barrel export
- **THEN** all token classes (AireColors, AireTextStyles, AireSpacing, AireBorderRadius, AireBreakpoints, AireIconSizes) are accessible
