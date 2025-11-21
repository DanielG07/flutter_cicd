# Implementation Tasks

## FASE 1: REFACTORIZACIÓN CON KNOBS (Prioridad)

### 1. Setup and Environment Preparation
- [x] 1.1 Verify Flutter environment and dependencies are installed
- [x] 1.2 Fix dependency conflicts (usuario package)
- [x] 1.3 Run `flutter run` in Widgetbook directory and verify it launches successfully
- [x] 1.4 Verify Widgetbook code generation works

### 2. Refactor Atoms - Button Component
- [x] 2.1 Read current `aire_button_use_cases.dart` implementation (24+ functions)
- [x] 2.2 Analyze component API (ButtonVariant, ButtonSize, enabled, icons)
- [x] 2.3 Create interactive use case with knobs (variant, size, text, enabled, icon position)
- [x] 2.4 Keep comparison use cases for documentation
- [x] 2.5 Test refactored use case and rebuild Widgetbook

### 3. Refactor Atoms - Badge Component
- [x] 3.1 Read current `aire_badge_use_cases.dart` implementation
- [x] 3.2 Analyze component API (BadgeVariant, BadgeColor, count, icon)
- [x] 3.3 Create interactive use case with knobs (variant, color, count slider, icon selector)
- [x] 3.4 Keep comparison and example use cases for documentation
- [x] 3.5 Test refactored use case and rebuild Widgetbook

### 4. Refactor Atoms - Checkbox Component
- [x] 4.1 Read current `aire_checkbox_use_cases.dart` implementation
- [x] 4.2 Analyze component API (value, tristate, enabled, label, error)
- [x] 4.3 Create interactive use case with knobs
- [x] 4.4 Test and rebuild Widgetbook

### 5. Refactor Atoms - Chip Component
- [x] 5.1 Read current `aire_chip_use_cases.dart` implementation
- [x] 5.2 Analyze component API (variant, text, leading, trailing, onDelete)
- [x] 5.3 Create interactive use case with knobs
- [x] 5.4 Test and rebuild Widgetbook

### 6. Refactor Atoms - IconButton Component
- [x] 6.1 Read current `aire_icon_button_use_cases.dart` implementation
- [x] 6.2 Analyze component API (icon, variant, size, enabled)
- [x] 6.3 Create interactive use case with knobs
- [x] 6.4 Test and rebuild Widgetbook

### 7. Refactor Atoms - Link Component
- [x] 7.1 Read current `aire_link_use_cases.dart` implementation
- [x] 7.2 Analyze component API (text, size, underline, icon, url)
- [x] 7.3 Create interactive use case with knobs
- [x] 7.4 Test and rebuild Widgetbook

### 8. Refactor Atoms - OptionListItem Component
- [ ] 8.1 Read current `aire_option_list_item_use_cases.dart` implementation
- [ ] 8.2 Analyze component API
- [ ] 8.3 Create interactive use case with knobs
- [ ] 8.4 Test and rebuild Widgetbook

### 9. Refactor Atoms - RadioButton Component
- [x] 9.1 Read current `aire_radio_button_use_cases.dart` implementation
- [x] 9.2 Analyze component API (value, groupValue, label, enabled)
- [x] 9.3 Create interactive use case with knobs
- [x] 9.4 Test and rebuild Widgetbook

### 10. Refactor Atoms - Switch Components (2 variants)
- [ ] 10.1 Read `aire_switch_use_cases.dart` and `aire_decision_switch_use_cases.dart`
- [ ] 10.2 Analyze both component APIs
- [ ] 10.3 Create interactive use case for AireSwitch with knobs
- [ ] 10.4 Create interactive use case for AireDecisionSwitch with knobs
- [ ] 10.5 Test and rebuild Widgetbook

### 11. Refactor Atoms - Tag Component
- [x] 11.1 Read current `aire_tag_use_cases.dart` implementation
- [x] 11.2 Analyze component API (text, variant, size, icon, onDelete)
- [x] 11.3 Create interactive use case with knobs
- [x] 11.4 Test and rebuild Widgetbook

### 12. Refactor Atoms - Avatar Components
- [ ] 12.1 Read `aire_avatar_use_cases.dart` and `aire_avatar_group_use_cases.dart`
- [ ] 12.2 Analyze both component APIs
- [ ] 12.3 Create interactive use case for AireAvatar with knobs
- [ ] 12.4 Create interactive use case for AireAvatarGroup with knobs
- [ ] 12.5 Test and rebuild Widgetbook

### 13. Refactor Molecules - InputText Component
- [ ] 13.1 Read current `aire_input_text_use_cases.dart` (already has some knobs)
- [ ] 13.2 Consolidate all use cases into comprehensive interactive use case
- [ ] 13.3 Test and rebuild Widgetbook

### 14. Refactor Molecules - InputSearch Component
- [ ] 14.1 Read current `aire_input_search_use_cases.dart`
- [ ] 14.2 Create interactive use case with knobs
- [ ] 14.3 Test and rebuild Widgetbook

### 15. Refactor Molecules - Select Component
- [ ] 15.1 Read current `aire_select_single_use_cases.dart`
- [ ] 15.2 Create interactive use case with knobs
- [ ] 15.3 Test and rebuild Widgetbook

### 16. Refactor Molecules - Slider Component
- [ ] 16.1 Read current `aire_slider_use_cases.dart`
- [ ] 16.2 Create interactive use case with knobs (value, min, max, divisions)
- [ ] 16.3 Test and rebuild Widgetbook

### 17. Refactor Molecules - Toast Component
- [ ] 17.1 Read current `aire_toast_use_cases.dart`
- [ ] 17.2 Create interactive use case with knobs
- [ ] 17.3 Test and rebuild Widgetbook

### 18. Refactor Molecules - List Component
- [ ] 18.1 Read current `aire_list_use_cases.dart`
- [ ] 18.2 Create interactive use case with knobs
- [ ] 18.3 Test and rebuild Widgetbook

### 19. Final Validation and Documentation (FASE 1)
- [ ] 19.1 Run final Widgetbook build and verify all components load correctly
- [ ] 19.2 Document knobs pattern for future components
- [ ] 19.3 Create summary report of code reduction achieved
- [ ] 19.4 Update design system documentation with new interactive use cases

---

## FASE 2: VALIDACIÓN VISUAL CON FIGMA (After FASE 1)

### 20. Figma Integration Setup
- [x] 20.1 Verify Playwright MCP server is configured and accessible
- [x] 20.2 Verify Figma Desktop MCP server is configured with design file open
- [x] 20.3 Document Figma node IDs for all Atoms components
- [ ] 20.4 Document Figma node IDs for all Molecules components

### 21. Visual Validation - Atoms Components
- [ ] 21.1 Create validation workflow script/documentation
- [ ] 21.2 Validate Button component against Figma (all variants)
- [ ] 21.3 Validate Badge component against Figma
- [ ] 21.4 Validate Checkbox component against Figma
- [ ] 21.5 Validate Chip component against Figma
- [ ] 21.6 Validate IconButton component against Figma
- [ ] 21.7 Validate Link component against Figma
- [ ] 21.8 Validate OptionListItem component against Figma
- [ ] 21.9 Validate RadioButton component against Figma
- [ ] 21.10 Validate Switch components against Figma
- [ ] 21.11 Validate Tag component against Figma
- [ ] 21.12 Validate Avatar components against Figma

### 22. Visual Validation - Molecules Components
- [ ] 22.1 Validate InputText component against Figma
- [ ] 22.2 Validate InputSearch component against Figma
- [ ] 22.3 Validate Select component against Figma
- [ ] 22.4 Validate Slider component against Figma
- [ ] 22.5 Validate Toast component against Figma
- [ ] 22.6 Validate List component against Figma

### 23. Design Tokens Verification
- [ ] 23.1 Verify all components use AireColors correctly
- [ ] 23.2 Verify all components use AireSpacing correctly
- [ ] 23.3 Verify all components use AireTextStyles correctly
- [ ] 23.4 Verify all components use AireBorderRadius correctly
- [ ] 23.5 Document any hardcoded values that should use tokens

### 24. Final Validation Report
- [ ] 24.1 Compile visual validation results for all components
- [ ] 24.2 Document discrepancies found between Figma and implementation
- [ ] 24.3 Create recommendations for fixes or acceptable differences
- [ ] 24.4 Generate final validation report with screenshots
