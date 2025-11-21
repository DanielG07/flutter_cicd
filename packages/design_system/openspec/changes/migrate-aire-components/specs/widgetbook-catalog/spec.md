# Widgetbook Catalog Specification

## ADDED Requirements

### Requirement: Widgetbook Application Structure
The design system SHALL provide a separate Flutter application in the `widgetbook/` directory for comprehensive component documentation and exploration.

#### Scenario: Widgetbook directory creation
- **WHEN** initializing the widgetbook catalog
- **THEN** a sibling directory named `widgetbook/` exists with its own pubspec.yaml and lib/ structure

#### Scenario: Widgetbook dependency configuration
- **WHEN** widgetbook/pubspec.yaml is configured
- **THEN** it includes widgetbook, widgetbook_annotation dependencies and references the parent design_system package via relative path

### Requirement: Platform Support
The widgetbook application SHALL support web, macOS, and Windows platforms for component exploration and documentation.

#### Scenario: Web platform availability
- **WHEN** building the widgetbook application for web
- **THEN** the application runs successfully in a web browser

#### Scenario: Desktop platform availability
- **WHEN** running widgetbook on macOS or Windows
- **THEN** the application launches as a native desktop application

### Requirement: Main Application Entry Point
The widgetbook application SHALL use the @widgetbook.App annotation to configure the catalog with material design support.

#### Scenario: Widgetbook app annotation
- **WHEN** widgetbook/lib/main.dart is evaluated
- **THEN** a StatelessWidget with @widgetbook.App() annotation exists

#### Scenario: Material theme integration
- **WHEN** the widgetbook app builds
- **THEN** it uses Widgetbook.material() constructor with generated directories

### Requirement: Component Use Case Generation
The design system SHALL provide annotated use cases for all atomic components enabling automatic catalog generation.

#### Scenario: Button use case annotation
- **WHEN** a button use case file includes @widgetbook.UseCase annotation
- **THEN** build_runner generates corresponding catalog entries

#### Scenario: Multiple use cases per component
- **WHEN** a component has multiple use case functions
- **THEN** each use case appears as a separate variant in the catalog

### Requirement: Atomic Design Organization in Catalog
The widgetbook catalog SHALL organize components hierarchically by atomic design levels (Atoms, Molecules, Organisms).

#### Scenario: Atom category in catalog
- **WHEN** navigating the widgetbook catalog
- **THEN** all atom components are grouped under an "Atoms" category

#### Scenario: Component navigation hierarchy
- **WHEN** browsing the catalog structure
- **THEN** categories follow the pattern: Atoms → [Component Type] → [Specific Component] → [Use Cases]

### Requirement: Code Generation via Build Runner
The widgetbook application SHALL use build_runner with widgetbook_generator to automatically generate catalog directories from annotated use cases.

#### Scenario: Directories generation
- **WHEN** running `flutter pub run build_runner build` in the widgetbook directory
- **THEN** a `main.directories.g.dart` file is generated with all use case metadata

#### Scenario: Incremental generation
- **WHEN** new use cases are added and build_runner runs with watch mode
- **THEN** the catalog automatically updates with new entries

### Requirement: Use Case File Structure
Each component use case file SHALL follow the widgetbook annotation pattern with proper imports and BuildContext parameter.

#### Scenario: Use case function signature
- **WHEN** defining a use case for a component
- **THEN** the function has signature `Widget buildComponentUseCase(BuildContext context)` with @widgetbook.UseCase annotation

#### Scenario: Use case imports
- **WHEN** a use case file is created
- **THEN** it imports flutter/material.dart, widgetbook_annotation, and the component from design_system package

### Requirement: Component Variant Exploration
The widgetbook catalog SHALL enable exploration of different component variants, sizes, and states.

#### Scenario: Button variant use cases
- **WHEN** viewing button use cases
- **THEN** separate use cases exist for primary, secondary, tertiary, and ghost variants

#### Scenario: Size variant use cases
- **WHEN** exploring a component with multiple sizes
- **THEN** use cases demonstrate all available sizes (large, medium, small, xsmall)

### Requirement: Interactive Component Preview
The widgetbook application SHALL provide real-time interactive previews of components in their use cases.

#### Scenario: Component interaction
- **WHEN** viewing a button use case in widgetbook
- **THEN** clicking the button in the preview triggers its onPressed callback with visible feedback

#### Scenario: Live property changes
- **WHEN** a use case includes dynamic properties
- **THEN** changing those properties updates the component preview in real-time

### Requirement: Development Workflow Integration
The widgetbook application SHALL support hot reload and development workflow for rapid component iteration.

#### Scenario: Hot reload support
- **WHEN** modifying a component file while widgetbook is running
- **THEN** saving the file triggers hot reload and updates the preview

#### Scenario: Watch mode generation
- **WHEN** running build_runner in watch mode
- **THEN** new or modified use cases automatically regenerate the catalog without manual rebuild

### Requirement: Catalog Completeness
The widgetbook catalog SHALL include use cases for all migrated AIRE components covering atoms, molecules, and organisms.

#### Scenario: All atoms cataloged
- **WHEN** viewing the Atoms category
- **THEN** all 9+ atom components have at least one use case

#### Scenario: All molecules cataloged
- **WHEN** viewing the Molecules category
- **THEN** all 7+ molecule components have at least one use case

#### Scenario: Organisms cataloged
- **WHEN** viewing the Organisms category
- **THEN** the AppBar component has use cases demonstrating key configurations
