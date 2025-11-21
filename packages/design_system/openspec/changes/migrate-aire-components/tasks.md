# Implementation Tasks: AIRE Component Migration

## 1. Preparation and Cleanup
- [ ] 1.1 Commit current state to git as pre-migration snapshot
- [ ] 1.2 Delete `lib/src/atoms/` directory
- [ ] 1.3 Delete `lib/src/molecules/` directory
- [ ] 1.4 Delete `lib/src/organisms/` directory
- [ ] 1.5 Delete `lib/src/templates/` directory
- [ ] 1.6 Delete `lib/src/pages/` directory
- [ ] 1.7 Delete `lib/src/core/` directory
- [ ] 1.8 Keep `lib/design_system.dart` (will be rewritten)

## 2. Migrate Design Tokens
- [ ] 2.1 Create `lib/src/design_tokens/` directory
- [ ] 2.2 Copy `widgets/design_tokens/aire_colors.dart` to `lib/src/design_tokens/`
- [ ] 2.3 Copy `widgets/design_tokens/aire_text_styles.dart` to `lib/src/design_tokens/`
- [ ] 2.4 Copy `widgets/design_tokens/aire_spacing.dart` to `lib/src/design_tokens/`
- [ ] 2.5 Copy `widgets/design_tokens/aire_border_radius.dart` to `lib/src/design_tokens/`
- [ ] 2.6 Copy `widgets/design_tokens/aire_breakpoints.dart` to `lib/src/design_tokens/`
- [ ] 2.7 Copy `widgets/design_tokens/aire_icons.dart` to `lib/src/design_tokens/`
- [ ] 2.8 Copy `widgets/design_tokens/design_tokens.dart` (barrel file) to `lib/src/design_tokens/`
- [ ] 2.9 Update import paths in design_tokens.dart to use package imports
- [ ] 2.10 Run dart analyzer to verify no import errors in design_tokens/

## 3. Migrate Atom Components
- [ ] 3.1 Create `lib/src/atoms/` directory structure
- [ ] 3.2 Copy and update `widgets/atoms/button/aire_button.dart`
  - [ ] 3.2.1 Copy file to `lib/src/atoms/button/`
  - [ ] 3.2.2 Update import path: `../../../design_tokens/` → `package:design_system/src/design_tokens/design_tokens.dart`
  - [ ] 3.2.3 Verify component renders correctly
- [ ] 3.3 Copy and update `widgets/atoms/checkbox/aire_checkbox.dart`
  - [ ] 3.3.1 Copy file to `lib/src/atoms/checkbox/`
  - [ ] 3.3.2 Update import paths
  - [ ] 3.3.3 Verify component functionality
- [ ] 3.4 Copy and update `widgets/atoms/chip/aire_chip.dart`
  - [ ] 3.4.1 Copy file to `lib/src/atoms/chip/`
  - [ ] 3.4.2 Update import paths
  - [ ] 3.4.3 Verify component functionality
- [ ] 3.5 Copy and update `widgets/atoms/icon_button/aire_icon_button.dart`
  - [ ] 3.5.1 Copy file to `lib/src/atoms/icon_button/`
  - [ ] 3.5.2 Update import paths
  - [ ] 3.5.3 Verify component functionality
- [ ] 3.6 Copy and update `widgets/atoms/link/aire_link.dart`
  - [ ] 3.6.1 Copy file to `lib/src/atoms/link/`
  - [ ] 3.6.2 Update import paths
  - [ ] 3.6.3 Verify component functionality
- [ ] 3.7 Copy and update `widgets/atoms/avatar/` directory
  - [ ] 3.7.1 Copy both aire_avatar.dart and aire_avatar_group.dart to `lib/src/atoms/avatar/`
  - [ ] 3.7.2 Update import paths in both files
  - [ ] 3.7.3 Verify both components render correctly
- [ ] 3.8 Copy and update `widgets/atoms/switch/` directory
  - [ ] 3.8.1 Copy both aire_switch.dart and aire_decision_switch.dart to `lib/src/atoms/switch/`
  - [ ] 3.8.2 Update import paths in both files
  - [ ] 3.8.3 Verify both components function correctly
- [ ] 3.9 Copy and update `widgets/atoms/radio_button/aire_radio_button.dart`
  - [ ] 3.9.1 Copy file to `lib/src/atoms/radio_button/`
  - [ ] 3.9.2 Update import paths
  - [ ] 3.9.3 Verify component functionality
- [ ] 3.10 Copy and update `widgets/atoms/tag/aire_tag.dart`
  - [ ] 3.10.1 Copy file to `lib/src/atoms/tag/`
  - [ ] 3.10.2 Update import paths
  - [ ] 3.10.3 Verify component functionality
- [ ] 3.11 Copy and update `widgets/atoms/badge/aire_badge.dart`
  - [ ] 3.11.1 Copy file to `lib/src/atoms/badge/`
  - [ ] 3.11.2 Update import paths
  - [ ] 3.11.3 Verify component functionality
- [ ] 3.12 Copy and update `widgets/atoms/option_list_item/aire_option_list_item.dart`
  - [ ] 3.12.1 Copy file to `lib/src/atoms/option_list_item/`
  - [ ] 3.12.2 Update import paths
  - [ ] 3.12.3 Verify component functionality
- [ ] 3.13 Run dart analyzer on all atom components

## 4. Migrate Molecule Components
- [ ] 4.1 Create `lib/src/molecules/` directory structure
- [ ] 4.2 Copy and update `widgets/molecules/input/aire_input_text.dart`
  - [ ] 4.2.1 Copy file to `lib/src/molecules/input/`
  - [ ] 4.2.2 Update import path to design tokens
  - [ ] 4.2.3 Verify input functionality and validation states
- [ ] 4.3 Copy and update `widgets/molecules/toast/aire_toast.dart`
  - [ ] 4.3.1 Copy file to `lib/src/molecules/toast/`
  - [ ] 4.3.2 Update import paths
  - [ ] 4.3.3 Verify toast displays correctly
- [ ] 4.4 Copy and update `widgets/molecules/slider/` directory
  - [ ] 4.4.1 Copy both aire_slider.dart and aire_range_slider.dart to `lib/src/molecules/slider/`
  - [ ] 4.4.2 Update import paths in both files
  - [ ] 4.4.3 Verify slider interactions work correctly
- [ ] 4.5 Copy and update `widgets/molecules/input_search/aire_input_search.dart`
  - [ ] 4.5.1 Copy file to `lib/src/molecules/input_search/`
  - [ ] 4.5.2 Update import paths
  - [ ] 4.5.3 Verify search functionality
- [ ] 4.6 Copy and update `widgets/molecules/list/aire_list.dart`
  - [ ] 4.6.1 Copy file to `lib/src/molecules/list/`
  - [ ] 4.6.2 Update import paths
  - [ ] 4.6.3 Verify list rendering and interactions
- [ ] 4.7 Copy and update `widgets/molecules/select/aire_select_single.dart`
  - [ ] 4.7.1 Copy file to `lib/src/molecules/select/`
  - [ ] 4.7.2 Update import paths
  - [ ] 4.7.3 Verify select dropdown functionality
- [ ] 4.8 Run dart analyzer on all molecule components

## 5. Create Organism Structure and Migrate AppBar
- [ ] 5.1 Create `lib/src/organisms/navigation/` directory
- [ ] 5.2 Copy `widgets/aire_appbar.dart` to `lib/src/organisms/navigation/aire_appbar.dart`
- [ ] 5.3 Update import paths in aire_appbar.dart to use package imports
- [ ] 5.4 Verify AppBar renders correctly with actions and navigation
- [ ] 5.5 Check `widgets/aire_outlined_button.dart` - determine if it's an atom or molecule
- [ ] 5.6 If aire_outlined_button should be migrated, place in appropriate directory and update imports
- [ ] 5.7 Run dart analyzer on organism components

## 6. Update Package Exports
- [ ] 6.1 Rewrite `lib/design_system.dart` with new export structure
- [ ] 6.2 Export design tokens: `export 'src/design_tokens/design_tokens.dart';`
- [ ] 6.3 Export all atom components (button, checkbox, chip, icon_button, link, avatar, switch, radio_button, tag, badge, option_list_item)
- [ ] 6.4 Export all molecule components (input_text, toast, slider, range_slider, input_search, list, select_single)
- [ ] 6.5 Export all organism components (appbar, and outlined_button if included)
- [ ] 6.6 Run `flutter analyze` on the entire package
- [ ] 6.7 Fix any analyzer warnings or errors

## 7. Create Widgetbook Application
- [ ] 7.1 Run `flutter create widgetbook --empty --platforms=web,macos,windows` in repository root
- [ ] 7.2 Rename project in `widgetbook/pubspec.yaml` to `widgetbook_workspace`
- [ ] 7.3 Add widgetbook dependencies to `widgetbook/pubspec.yaml`
  - [ ] 7.3.1 Add `widgetbook: ^latest` to dependencies
  - [ ] 7.3.2 Add `widgetbook_annotation: ^latest` to dependencies
  - [ ] 7.3.3 Add `widgetbook_generator: ^latest` to dev_dependencies
  - [ ] 7.3.4 Add `build_runner: ^latest` to dev_dependencies
- [ ] 7.4 Add design_system package reference to `widgetbook/pubspec.yaml` dependencies: `design_system: path: ../`
- [ ] 7.5 Run `flutter pub get` in widgetbook directory
- [ ] 7.6 Create `widgetbook/lib/main.dart` with @widgetbook.App() annotation
- [ ] 7.7 Configure Widgetbook.material() with directories parameter

## 8. Generate Widgetbook Use Cases for Atoms
- [ ] 8.1 Create `widgetbook/lib/atoms/` directory
- [ ] 8.2 Create button use cases in `widgetbook/lib/atoms/button_use_cases.dart`
  - [ ] 8.2.1 Create use case for primary button
  - [ ] 8.2.2 Create use case for secondary button
  - [ ] 8.2.3 Create use case for button sizes
- [ ] 8.3 Create checkbox use cases in `widgetbook/lib/atoms/checkbox_use_cases.dart`
- [ ] 8.4 Create chip use cases in `widgetbook/lib/atoms/chip_use_cases.dart`
- [ ] 8.5 Create icon_button use cases in `widgetbook/lib/atoms/icon_button_use_cases.dart`
- [ ] 8.6 Create link use cases in `widgetbook/lib/atoms/link_use_cases.dart`
- [ ] 8.7 Create avatar use cases in `widgetbook/lib/atoms/avatar_use_cases.dart`
- [ ] 8.8 Create switch use cases in `widgetbook/lib/atoms/switch_use_cases.dart`
- [ ] 8.9 Create radio_button use cases in `widgetbook/lib/atoms/radio_button_use_cases.dart`
- [ ] 8.10 Create tag use cases in `widgetbook/lib/atoms/tag_use_cases.dart`
- [ ] 8.11 Create badge use cases in `widgetbook/lib/atoms/badge_use_cases.dart`

## 9. Generate Widgetbook Use Cases for Molecules
- [ ] 9.1 Create `widgetbook/lib/molecules/` directory
- [ ] 9.2 Create input_text use cases in `widgetbook/lib/molecules/input_text_use_cases.dart`
  - [ ] 9.2.1 Create use case for normal state
  - [ ] 9.2.2 Create use case for error state
  - [ ] 9.2.3 Create use case for success state
  - [ ] 9.2.4 Create use case for disabled state
- [ ] 9.3 Create toast use cases in `widgetbook/lib/molecules/toast_use_cases.dart`
- [ ] 9.4 Create slider use cases in `widgetbook/lib/molecules/slider_use_cases.dart`
- [ ] 9.5 Create input_search use cases in `widgetbook/lib/molecules/input_search_use_cases.dart`
- [ ] 9.6 Create list use cases in `widgetbook/lib/molecules/list_use_cases.dart`
- [ ] 9.7 Create select use cases in `widgetbook/lib/molecules/select_use_cases.dart`

## 10. Generate Widgetbook Use Cases for Organisms
- [ ] 10.1 Create `widgetbook/lib/organisms/` directory
- [ ] 10.2 Create appbar use cases in `widgetbook/lib/organisms/appbar_use_cases.dart`
  - [ ] 10.2.1 Create use case for basic appbar with title
  - [ ] 10.2.2 Create use case for appbar with back button
  - [ ] 10.2.3 Create use case for appbar with action buttons

## 11. Build and Verify Widgetbook
- [ ] 11.1 Run `flutter pub run build_runner build --delete-conflicting-outputs` in widgetbook directory
- [ ] 11.2 Verify `widgetbook/lib/main.directories.g.dart` is generated
- [ ] 11.3 Run widgetbook app for web: `flutter run -d chrome` in widgetbook directory
- [ ] 11.4 Verify all component categories appear in navigation
- [ ] 11.5 Verify all use cases render correctly
- [ ] 11.6 Test widgetbook on macOS (if available)
- [ ] 11.7 Test widgetbook on Windows (if available)

## 12. Update Example Application
- [ ] 12.1 Update `example/lib/main.dart` imports to use AIRE components
- [ ] 12.2 Update example pages to showcase AIRE components instead of DS components
- [ ] 12.3 Create example pages for each atomic level if they don't exist
- [ ] 12.4 Run example app: `flutter run` in example directory
- [ ] 12.5 Verify all AIRE components render correctly in example
- [ ] 12.6 Test navigation through all example pages

## 13. Final Validation and Cleanup
- [ ] 13.1 Run `flutter analyze` in root directory
- [ ] 13.2 Run `flutter analyze` in widgetbook directory
- [ ] 13.3 Run `flutter analyze` in example directory
- [ ] 13.4 Fix any remaining analyzer warnings
- [ ] 13.5 Run `flutter test` in root directory (if tests exist)
- [ ] 13.6 Verify no broken imports or references
- [ ] 13.7 Update README.md with new component names and structure
- [ ] 13.8 Create git commit with migration changes
- [ ] 13.9 Consider deprecating `widgets/` directory (add deprecation notice or move to archive)
- [ ] 13.10 Run `openspec validate migrate-aire-components --strict` to ensure spec compliance
