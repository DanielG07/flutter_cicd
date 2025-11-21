# Atomic Components Specification

## ADDED Requirements

### Requirement: Button Atom Component
The design system SHALL provide a button component with four variants (primary, secondary, tertiary, ghost) and four sizes (large, medium, small, xsmall).

#### Scenario: Primary button rendering
- **WHEN** creating an AireButton with variant=primary and size=medium
- **THEN** the button renders with primary400 background, white text, and 48px height

#### Scenario: Disabled button state
- **WHEN** AireButton has enabled=false or onPressed=null
- **THEN** the button displays with neutral50 background and neutral400 text

#### Scenario: Button with leading icon
- **WHEN** AireButton includes a leading widget
- **THEN** the icon displays before the text with xs spacing between them

### Requirement: Checkbox Atom Component
The design system SHALL provide a checkbox component with checked, unchecked, and disabled states.

#### Scenario: Checkbox state change
- **WHEN** user taps an enabled AireCheckbox
- **THEN** the onChanged callback fires with the new boolean value

#### Scenario: Disabled checkbox
- **WHEN** AireCheckbox has enabled=false
- **THEN** the checkbox displays grayed out and does not respond to taps

### Requirement: Chip Atom Component
The design system SHALL provide a chip component for displaying compact information with optional remove action.

#### Scenario: Chip with remove action
- **WHEN** AireChip includes an onRemove callback
- **THEN** a close icon button is displayed that triggers the callback when pressed

### Requirement: Icon Button Atom Component
The design system SHALL provide an icon-only button component with multiple size variants.

#### Scenario: Icon button press
- **WHEN** user taps an enabled AireIconButton
- **THEN** the onPressed callback is triggered

### Requirement: Link Atom Component
The design system SHALL provide a text link component with hover and pressed states.

#### Scenario: Link navigation
- **WHEN** user taps an AireLink
- **THEN** the onTap callback is triggered

### Requirement: Avatar Atom Component
The design system SHALL provide circular avatar components for displaying user images or initials, including group avatar support.

#### Scenario: Avatar with image
- **WHEN** AireAvatar receives an image URL
- **THEN** the image displays in a circular frame

#### Scenario: Avatar with initials
- **WHEN** AireAvatar has no image but has initials text
- **THEN** initials display centered in a colored circle

#### Scenario: Avatar group overlap
- **WHEN** AireAvatarGroup contains multiple avatars
- **THEN** avatars overlap with controlled spacing and z-index

### Requirement: Switch Atom Component
The design system SHALL provide toggle switch components including standard switch and decision switch variants.

#### Scenario: Switch state toggle
- **WHEN** user taps an enabled AireSwitch
- **THEN** the onChanged callback fires with the new boolean value

#### Scenario: Decision switch with labels
- **WHEN** AireDecisionSwitch displays
- **THEN** both the "yes" and "no" labels are visible with appropriate styling

### Requirement: Radio Button Atom Component
The design system SHALL provide radio button components for single selection within groups.

#### Scenario: Radio button selection
- **WHEN** user taps an unselected AireRadioButton
- **THEN** the onChanged callback fires with the button's value

### Requirement: Tag Atom Component
The design system SHALL provide tag components for categorization and labeling.

#### Scenario: Tag with color variant
- **WHEN** AireTag is rendered with a specific color scheme
- **THEN** the tag displays with appropriate background and text colors

### Requirement: Badge Atom Component
The design system SHALL provide badge components for notifications and status indicators.

#### Scenario: Numeric badge
- **WHEN** AireBadge displays a number
- **THEN** the badge shows the count in a small colored circle

### Requirement: Input Text Molecule Component
The design system SHALL provide a text input component with validation states (normal, success, warning, error) and floating labels.

#### Scenario: Input focus with floating label
- **WHEN** AireInputText gains focus or contains text
- **THEN** the label floats above the input field

#### Scenario: Input validation error state
- **WHEN** AireInputText has status=error
- **THEN** the border displays error400 color and error icon appears

#### Scenario: Input disabled state
- **WHEN** AireInputText has enabled=false
- **THEN** the background is neutral100 and input does not accept focus

### Requirement: Toast Molecule Component
The design system SHALL provide toast notification components for temporary messages.

#### Scenario: Success toast display
- **WHEN** AireToast displays with success type
- **THEN** success colors and icon are shown

#### Scenario: Toast auto-dismiss
- **WHEN** AireToast is shown with a duration
- **THEN** the toast automatically dismisses after the specified time

### Requirement: Slider Molecule Component
The design system SHALL provide slider components for single value and range selection.

#### Scenario: Slider value change
- **WHEN** user drags AireSlider thumb
- **THEN** onChanged callback fires with updated value

#### Scenario: Range slider selection
- **WHEN** user adjusts AireRangeSlider endpoints
- **THEN** onChanged callback fires with updated range values

### Requirement: Input Search Molecule Component
The design system SHALL provide a search input component with search icon and clear functionality.

#### Scenario: Search text entry
- **WHEN** user types in AireInputSearch
- **THEN** onChanged callback fires with search query

#### Scenario: Search clear button
- **WHEN** AireInputSearch contains text and user taps clear icon
- **THEN** input is cleared and onChanged fires with empty string

### Requirement: List Molecule Component
The design system SHALL provide list components for displaying collections of items.

#### Scenario: List item selection
- **WHEN** user taps an AireList item
- **THEN** the onItemTap callback fires with the item data

### Requirement: Select Single Molecule Component
The design system SHALL provide dropdown select components for single-choice selection.

#### Scenario: Select option chosen
- **WHEN** user selects an option from AireSelectSingle
- **THEN** the onChanged callback fires with selected value

### Requirement: AppBar Organism Component
The design system SHALL provide an application bar component with title, leading icon, and action buttons.

#### Scenario: AppBar with back navigation
- **WHEN** AireAppBar includes a leading back button
- **THEN** tapping the button triggers the onLeadingPressed callback

#### Scenario: AppBar with actions
- **WHEN** AireAppBar includes action buttons
- **THEN** all actions are displayed in the trailing position

### Requirement: Atomic Component Organization
The design system SHALL organize components following atomic design principles with atoms, molecules, and organisms in separate directories.

#### Scenario: Component import path structure
- **WHEN** importing an atom component
- **THEN** the import path follows pattern `package:design_system/src/atoms/[component-name]/aire_[component-name].dart`

#### Scenario: Molecule component dependencies
- **WHEN** a molecule component renders
- **THEN** it correctly imports and uses atom components and design tokens

### Requirement: Component Export API
The design system SHALL export all atomic components through the main package barrel file.

#### Scenario: Single import for all components
- **WHEN** consuming application imports `package:design_system/design_system.dart`
- **THEN** all Aire-prefixed components and design tokens are accessible
