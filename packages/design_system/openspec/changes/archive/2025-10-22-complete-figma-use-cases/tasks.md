# Implementation Tasks: Complete Figma Use Cases

## Overview
Esta implementación se realiza en **orden secuencial estricto**: un componente a la vez, validación completa antes de continuar al siguiente.

**Workflow por Componente:**
1. Seleccionar componente en Figma Desktop
2. Usar Figma MCP para extraer todos los variants/estados/tamaños
3. Auditar use cases actuales en Widgetbook
4. Identificar brechas (use cases faltantes)
5. Implementar use cases faltantes en `*_use_cases.dart`
6. Validar build: `dart run build_runner build --delete-conflicting-outputs`
7. Verificar renders en Widgetbook UI
8. Commit cambios

---

## Phase 1: Atoms (12 components)

### 1.1 Avatar
- [x] 1.1.1 Select Avatar component in Figma Desktop
- [x] 1.1.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.1.3 Audit `widgetbook/lib/widgets/atoms/avatar/aire_avatar_use_cases.dart`
- [x] 1.1.4 Identify missing use cases (compare Figma vs current file)
- [x] 1.1.5 Implement missing use cases following existing patterns (interactive/static/comparison)
- [x] 1.1.6 Use design tokens from `widgets/design_tokens` exclusively
- [x] 1.1.7 Run `dart run build_runner build --delete-conflicting-outputs`
- [x] 1.1.8 Verify all Avatar use cases render correctly in Widgetbook
- [x] 1.1.9 Commit changes with message: "feat(widgetbook): complete Avatar use cases from Figma"

### 1.2 AvatarGroup
- [x] 1.2.1 Select AvatarGroup component in Figma Desktop
- [x] 1.2.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.2.3 Audit `widgetbook/lib/widgets/atoms/avatar/aire_avatar_group_use_cases.dart`
- [x] 1.2.4 Identify missing use cases
- [x] 1.2.5 Implement missing use cases
- [x] 1.2.6 Use design tokens exclusively
- [x] 1.2.7 Run build
- [x] 1.2.8 Verify renders
- [x] 1.2.9 Commit: "feat(widgetbook): complete AvatarGroup use cases from Figma"

### 1.3 Badge
- [x] 1.3.1 Select Badge component in Figma Desktop
- [x] 1.3.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.3.3 Audit `widgetbook/lib/widgets/atoms/badge/aire_badge_use_cases.dart`
- [x] 1.3.4 Identify missing use cases
- [x] 1.3.5 Implement missing use cases
- [x] 1.3.6 Use design tokens exclusively
- [x] 1.3.7 Run build
- [x] 1.3.8 Verify renders
- [x] 1.3.9 Commit: "feat(widgetbook): complete Badge use cases from Figma"

### 1.4 Button
- [x] 1.4.1 Select Button component in Figma Desktop
- [x] 1.4.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.4.3 Audit `widgetbook/lib/widgets/atoms/button/aire_button_use_cases.dart`
- [x] 1.4.4 Identify missing use cases (especially loading states if implemented)
- [x] 1.4.5 Implement missing use cases
- [x] 1.4.6 Use design tokens exclusively
- [x] 1.4.7 Run build
- [x] 1.4.8 Verify renders
- [x] 1.4.9 Commit: "feat(widgetbook): complete Button use cases from Figma"

### 1.5 Checkbox
- [x] 1.5.1 Select Checkbox component in Figma Desktop
- [x] 1.5.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.5.3 Audit `widgetbook/lib/widgets/atoms/checkbox/aire_checkbox_use_cases.dart`
- [x] 1.5.4 Identify missing use cases
- [x] 1.5.5 Implement missing use cases
- [x] 1.5.6 Use design tokens exclusively
- [x] 1.5.7 Run build
- [x] 1.5.8 Verify renders
- [x] 1.5.9 Commit: "feat(widgetbook): complete Checkbox use cases from Figma"

### 1.6 Chip
- [x] 1.6.1 Select Chip component in Figma Desktop
- [x] 1.6.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.6.3 Audit `widgetbook/lib/widgets/atoms/chip/aire_chip_use_cases.dart`
- [x] 1.6.4 Identify missing use cases
- [x] 1.6.5 Implement missing use cases
- [x] 1.6.6 Use design tokens exclusively
- [x] 1.6.7 Run build
- [x] 1.6.8 Verify renders
- [x] 1.6.9 Commit: "feat(widgetbook): complete Chip use cases from Figma"

### 1.7 DecisionSwitch
- [x] 1.7.1 Select DecisionSwitch component in Figma Desktop
- [x] 1.7.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.7.3 Audit `widgetbook/lib/widgets/atoms/switch/aire_decision_switch_use_cases.dart`
- [x] 1.7.4 Identify missing use cases
- [x] 1.7.5 Implement missing use cases
- [x] 1.7.6 Use design tokens exclusively
- [x] 1.7.7 Run build
- [x] 1.7.8 Verify renders
- [x] 1.7.9 Commit: "feat(widgetbook): complete DecisionSwitch use cases from Figma"

### 1.8 IconButton
- [x] 1.8.1 Select IconButton component in Figma Desktop
- [x] 1.8.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.8.3 Audit `widgetbook/lib/widgets/atoms/icon_button/aire_icon_button_use_cases.dart`
- [x] 1.8.4 Identify missing use cases
- [x] 1.8.5 Implement missing use cases
- [x] 1.8.6 Use design tokens exclusively
- [x] 1.8.7 Run build
- [x] 1.8.8 Verify renders
- [x] 1.8.9 Commit: "feat(widgetbook): complete IconButton use cases from Figma"

### 1.9 Link
- [x] 1.9.1 Select Link component in Figma Desktop
- [x] 1.9.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.9.3 Audit `widgetbook/lib/widgets/atoms/link/aire_link_use_cases.dart`
- [x] 1.9.4 Identify missing use cases
- [x] 1.9.5 Implement missing use cases
- [x] 1.9.6 Use design tokens exclusively
- [x] 1.9.7 Run build
- [x] 1.9.8 Verify renders
- [x] 1.9.9 Commit: "feat(widgetbook): complete Link use cases from Figma"

### 1.10 OptionListItem
- [x] 1.10.1 Select OptionListItem component in Figma Desktop
- [x] 1.10.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.10.3 Audit `widgetbook/lib/widgets/atoms/option_list_item/aire_option_list_item_use_cases.dart`
- [x] 1.10.4 Identify missing use cases
- [x] 1.10.5 Implement missing use cases
- [x] 1.10.6 Use design tokens exclusively
- [x] 1.10.7 Run build
- [x] 1.10.8 Verify renders
- [x] 1.10.9 Commit: "feat(widgetbook): complete OptionListItem use cases from Figma"

### 1.11 RadioButton
- [x] 1.11.1 Select RadioButton component in Figma Desktop
- [x] 1.11.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.11.3 Audit `widgetbook/lib/widgets/atoms/radio_button/aire_radio_button_use_cases.dart`
- [x] 1.11.4 Identify missing use cases
- [x] 1.11.5 Implement missing use cases
- [x] 1.11.6 Use design tokens exclusively
- [x] 1.11.7 Run build
- [x] 1.11.8 Verify renders
- [x] 1.11.9 Commit: "feat(widgetbook): complete RadioButton use cases from Figma"

### 1.12 Switch
- [x] 1.12.1 Select Switch component in Figma Desktop
- [x] 1.12.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.12.3 Audit `widgetbook/lib/widgets/atoms/switch/aire_switch_use_cases.dart`
- [x] 1.12.4 Identify missing use cases
- [x] 1.12.5 Implement missing use cases
- [x] 1.12.6 Use design tokens exclusively
- [x] 1.12.7 Run build
- [x] 1.12.8 Verify renders
- [x] 1.12.9 Commit: "feat(widgetbook): complete Switch use cases from Figma"

### 1.13 Tag
- [x] 1.13.1 Select Tag component in Figma Desktop
- [x] 1.13.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 1.13.3 Audit `widgetbook/lib/widgets/atoms/tag/aire_tag_use_cases.dart`
- [x] 1.13.4 Identify missing use cases
- [x] 1.13.5 Implement missing use cases
- [x] 1.13.6 Use design tokens exclusively
- [x] 1.13.7 Run build
- [x] 1.13.8 Verify renders
- [x] 1.13.9 Commit: "feat(widgetbook): complete Tag use cases from Figma"

---

## Phase 2: Molecules (6 components)

### 2.1 InputText
- [x] 2.1.1 Select InputText component in Figma Desktop
- [x] 2.1.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 2.1.3 Audit `widgetbook/lib/widgets/molecules/input/aire_input_text_use_cases.dart`
- [x] 2.1.4 Identify missing use cases
- [x] 2.1.5 Implement missing use cases
- [x] 2.1.6 Use design tokens exclusively
- [x] 2.1.7 Run build
- [x] 2.1.8 Verify renders
- [x] 2.1.9 Commit: "feat(widgetbook): complete InputText use cases from Figma"

### 2.2 InputSearch
- [x] 2.2.1 Select InputSearch component in Figma Desktop
- [x] 2.2.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 2.2.3 Audit `widgetbook/lib/widgets/molecules/input_search/aire_input_search_use_cases.dart`
- [x] 2.2.4 Identify missing use cases
- [x] 2.2.5 Implement missing use cases
- [x] 2.2.6 Use design tokens exclusively
- [x] 2.2.7 Run build
- [x] 2.2.8 Verify renders
- [x] 2.2.9 Commit: "feat(widgetbook): complete InputSearch use cases from Figma"

### 2.3 List
- [x] 2.3.1 Select List component in Figma Desktop
- [x] 2.3.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 2.3.3 Audit `widgetbook/lib/widgets/molecules/list/aire_list_use_cases.dart`
- [x] 2.3.4 Identify missing use cases
- [x] 2.3.5 Implement missing use cases
- [x] 2.3.6 Use design tokens exclusively
- [x] 2.3.7 Run build
- [x] 2.3.8 Verify renders
- [x] 2.3.9 Commit: "feat(widgetbook): complete List use cases from Figma"

### 2.4 Select
- [x] 2.4.1 Select (SelectSingle) component in Figma Desktop
- [x] 2.4.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 2.4.3 Audit `widgetbook/lib/widgets/molecules/select/aire_select_single_use_cases.dart`
- [x] 2.4.4 Identify missing use cases
- [x] 2.4.5 Implement missing use cases
- [x] 2.4.6 Use design tokens exclusively
- [x] 2.4.7 Run build
- [x] 2.4.8 Verify renders
- [x] 2.4.9 Commit: "feat(widgetbook): complete Select use cases from Figma"

### 2.5 Slider
- [x] 2.5.1 Select Slider component in Figma Desktop
- [x] 2.5.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 2.5.3 Audit `widgetbook/lib/widgets/molecules/slider/aire_slider_use_cases.dart`
- [x] 2.5.4 Identify missing use cases (may include RangeSlider too)
- [x] 2.5.5 Implement missing use cases
- [x] 2.5.6 Use design tokens exclusively
- [x] 2.5.7 Run build
- [x] 2.5.8 Verify renders
- [x] 2.5.9 Commit: "feat(widgetbook): complete Slider use cases from Figma"

### 2.6 Toast
- [x] 2.6.1 Select Toast component in Figma Desktop
- [x] 2.6.2 Use Figma MCP `get_design_context` to extract all variants/states/sizes
- [x] 2.6.3 Audit `widgetbook/lib/widgets/molecules/toast/aire_toast_use_cases.dart`
- [x] 2.6.4 Identify missing use cases
- [x] 2.6.5 Implement missing use cases
- [x] 2.6.6 Use design tokens exclusively
- [x] 2.6.7 Run build
- [x] 2.6.8 Verify renders
- [x] 2.6.9 Commit: "feat(widgetbook): complete Toast use cases from Figma"

---

## Phase 3: Final Validation & Documentation

### 3.1 Complete Build Validation
- [x] 3.1.1 Run full Widgetbook build from clean state
- [x] 3.1.2 Verify no build errors or warnings
- [x] 3.1.3 Launch Widgetbook and spot-check all components
- [x] 3.1.4 Verify all use cases render without runtime errors

### 3.2 Coverage Documentation
- [x] 3.2.1 Create summary document of completed work
- [x] 3.2.2 Document any limitations or edge cases encountered
- [x] 3.2.3 List any Figma variants that couldn't be implemented (with reasons)
- [x] 3.2.4 Update any relevant README or documentation files

### 3.3 Final Commit & Archive
- [x] 3.3.1 Create final consolidated commit if needed
- [x] 3.3.2 Update all task checkboxes in this file to [x]
- [x] 3.3.3 Archive this change using `openspec archive complete-figma-use-cases`

---

## Notes

**Order of Execution**: Strictly sequential - complete each component fully before starting the next.

**Design Token Reference**: `C:\Users\chenk\Documents\Vitam\desing_system\widgets\design_tokens`
- AireColors
- AireSpacing
- AireTextStyles
- AireBorderRadius

**Build Command**: `dart run build_runner build --delete-conflicting-outputs`

**Commit Message Format**: `feat(widgetbook): complete [ComponentName] use cases from Figma`

**Figma MCP Tool**: `get_design_context` (no nodeId parameter needed when component is selected in Figma Desktop)

**Dependencies**:
- Figma Desktop app running
- Figma MCP server connected
- Component selected in Figma before calling MCP tool
