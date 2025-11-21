# Proposal: Refactor Widgetbook Use Cases with Knobs and Validate Against Figma

## Why
Los componentes del Design System en Widgetbook están definidos de manera verbose con múltiples use cases separados para cada variante, lo que genera código duplicado (~80% de repetición) y dificulta el mantenimiento. Además, no existe un proceso de validación visual contra los diseños de Figma, lo que puede causar inconsistencias entre diseño e implementación.

**Problemas actuales**:
1. **Código duplicado masivo**: Ejemplo Button tiene 24+ funciones separadas para variantes/tamaños
2. **Difícil de mantener**: Cambios requieren actualizar múltiples funciones idénticas
3. **No sigue estándar Widgetbook**: Los knobs son la práctica recomendada para exploración interactiva
4. **Sin validación visual**: No hay proceso sistemático para comparar con Figma

## What Changes

**FASE 1 (Prioridad): Refactorización con Knobs** ⚡
- **Refactorizar TODOS los use cases de Atoms** para usar knobs interactivos siguiendo estándar Widgetbook
- **Refactorizar TODOS los use cases de Molecules** para usar knobs interactivos
- **Mantener use cases de comparación** para documentación visual
- **Reducir código ~70%** eliminando funciones repetitivas

**FASE 2: Validación Visual con Figma**
- **Implementar workflow de validación** usando Playwright MCP + Figma Desktop MCP
- **Validar componentes refactorizados** categoria por categoria (Atoms → Molecules)
- **Documentar discrepancias visuales** y uso de design tokens
- **Asegurar pixel-perfect accuracy** comparando screenshots

**Componentes en scope**:
- **Atoms**: Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch (2 variants), Tag, Avatar, AvatarGroup
- **Molecules**: InputText, InputSearch, Select, Slider, Toast, List

## Impact
- Affected specs:
  - widgetbook-knobs-refactoring (new capability - FASE 1)
  - widgetbook-visual-validation (new capability - FASE 2)
  - design-system-components (modified)
- Affected code:
  - `widgetbook/lib/widgets/atoms/**/*_use_cases.dart` - Complete refactoring to use knobs
  - `widgetbook/lib/widgets/molecules/**/*_use_cases.dart` - Complete refactoring to use knobs
  - Playwright and Figma MCP integration for validation workflow (FASE 2)
- Breaking changes: None (use cases are dev-only, no API changes)
- Dependencies:
  - Widgetbook ^3.16.0 (already configured)
  - Playwright MCP server (for FASE 2)
  - Figma Desktop MCP server (for FASE 2)
  - Flutter environment

## Success Metrics
- **Code reduction**: ~70% less code in use cases
- **Maintainability**: 1 interactive use case vs 20+ static functions per component
- **Consistency**: All components follow same knobs pattern
- **Visual accuracy**: 100% of components validated against Figma (FASE 2)
