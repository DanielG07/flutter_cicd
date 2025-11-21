# Proposal: Complete Figma Use Cases in Widgetbook

## Change ID
`complete-figma-use-cases`

## Status
🟡 PROPOSED

## Author
Claude Code

## Date
2025-10-22

---

## Why

Aunque los use cases de Widgetbook fueron refactorizados exitosamente con knobs interactivos (Fase 1), existe una brecha significativa: **muchos widgets de atoms y molecules no tienen completos todos los use cases exactamente como aparecen en Figma**. Esta inconsistencia impide:

1. **Validación completa del sistema de diseño** - No podemos verificar que todos los estados/variantes de Figma estén implementados
2. **Documentación incompleta** - Desarrolladores no pueden ver todos los casos de uso disponibles en el design system
3. **Inconsistencia entre diseño y código** - Algunos use cases existen en Figma pero no en Widgetbook

**Problemas específicos:**
- No hay verificación sistemática componente por componente contra Figma
- Use cases faltantes para estados/variantes documentados en Figma
- Imposible garantizar cobertura completa sin análisis manual exhaustivo

---

## What Changes

Esta propuesta implementa un workflow sistemático para **completar todos los use cases de Widgetbook** usando Figma Desktop MCP:

### Workflow por Componente
1. **Analizar diseño en Figma** - Usar Figma Desktop MCP para obtener todos los variants, estados, tamaños del componente seleccionado
2. **Auditar use cases actuales de Widgetbook** - Comparar contra lo que existe en el código
3. **Identificar brechas** - Determinar qué use cases faltan
4. **Codificar use cases faltantes** - Implementar los casos faltantes en el archivo `*_use_cases.dart` correspondiente
5. **Validar build** - Ejecutar `dart run build_runner build --delete-conflicting-outputs` y verificar
6. **Siguiente componente** - Repetir el proceso

### Alcance
- **12 Atoms**: Button, Badge, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, DecisionSwitch, Tag, Avatar/AvatarGroup
- **6 Molecules**: InputText, InputSearch, Select, Slider, Toast, List
- **Orden de procesamiento**: Primero todos los Atoms, luego todos los Molecules

### Enfoque Técnico
- Usar **Figma Desktop MCP** - Acceso directo al componente seleccionado en Figma sin necesidad de node-ids hardcoded
- **Desarrollo iterativo** - Un componente a la vez, validación continua
- **Mantener estándares existentes** - Respetar la estructura actual de knobs interactivos + static + comparison use cases
- **Design tokens** - Usar siempre tokens estandarizados de `widgets/design_tokens`

### Requirement: Component Use Case Organization
This change directly fulfills the "Component Use Case Organization" requirement by:
1. Ensuring all atom components (Avatar, Badge, Button, Checkbox, Chip, IconButton, Link, OptionListItem, RadioButton, Switch, DecisionSwitch, Tag, AvatarGroup) have complete use cases in Widgetbook
2. Ensuring all molecule components (InputText, InputSearch, List, Select, Slider, Toast) have complete use cases in Widgetbook
3. Organizing use cases hierarchically with interactive examples, comparison views, and real-world usage patterns
4. Validating that every variant, state, and size documented in Figma has a corresponding use case in Widgetbook

---

## Impact

### Affected Specs
- **widgetbook-documentation** (MODIFIED) - Se completan los requisitos de cobertura de use cases

### Affected Code
- `widgetbook/lib/widgets/atoms/**/*_use_cases.dart` - Se agregan use cases faltantes
- `widgetbook/lib/widgets/molecules/**/*_use_cases.dart` - Se agregan use cases faltantes
- NO se modifican los componentes base en `widgets/atoms/*` ni `widgets/molecules/*`

### Breaking Changes
- **Ninguno** - Solo se agregan use cases, no se cambian APIs ni componentes existentes

### Dependencies
- **Figma Desktop MCP** - Debe estar conectado y funcionando
- **Figma Design File** - Acceso al archivo de diseño con todos los componentes
- **Flutter/Dart SDK** - 3.35.6 / 3.9.2
- **Widgetbook** - 3.16.0
- **Design Tokens** - `C:\Users\chenk\Documents\Vitam\desing_system\widgets\design_tokens`

---

## Success Metrics

### Per Component
- ✅ Todos los variants/estados/tamaños documentados en Figma tienen use case correspondiente en Widgetbook
- ✅ Use cases usan design tokens correctamente
- ✅ Widgetbook compila sin errores
- ✅ Use cases se renderizan correctamente

### Overall
- ✅ Los 12 Atoms completados y validados
- ✅ Las 6 Molecules completadas y validadas
- ✅ Cobertura 100% de use cases respecto a Figma
- ✅ Documentación actualizada con coverage status

---

## Timeline Estimate

- **Per Atom**: ~30-45 minutos (análisis Figma + implementación + validación)
- **Per Molecule**: ~45-60 minutos (mayor complejidad)
- **Total Atoms (12)**: ~6-9 horas
- **Total Molecules (6)**: ~4.5-6 horas
- **Total Effort**: ~10-15 horas

---

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Figma MCP desconectado | Alto | Verificar conexión antes de cada componente, reconectar si es necesario |
| Diseños incompletos en Figma | Medio | Documentar gaps, continuar con componentes completos |
| Build errors por conflictos | Medio | Validar build después de cada componente, rollback si falla |
| Demasiados use cases (code bloat) | Bajo | Priorizar knobs interactivos, limitar casos estáticos redundantes |
| Design tokens incorrectos | Bajo | Revisar `design_tokens` antes de empezar, documentar tokens faltantes |

---

## Alternatives Considered

### Alternative 1: Implementar todos los componentes en batch
- **Pros**: Más rápido overall
- **Cons**: Difícil trackear progreso, riesgoso (un error afecta todo), menos verificación
- **Decisión**: Rechazado - preferir approach incremental componente por componente

### Alternative 2: Solo agregar comentarios de "missing use cases"
- **Pros**: Rápido, no requiere implementación
- **Cons**: No resuelve el problema, Widgetbook sigue incompleto
- **Decisión**: Rechazado - necesitamos use cases funcionales, no solo documentación

### Alternative 3: Automatizar con script de Figma API
- **Pros**: Posiblemente más rápido una vez configurado
- **Cons**: Requiere setup complejo, menos control, difícil manejar edge cases
- **Decisión**: Rechazado para esta fase - MCP manual es más controlable y preciso

---

## Open Questions

1. ❓ ¿Hay algún orden específico preferido dentro de Atoms o Molecules?
   - **Propuesta**: Seguir orden alfabético o por complejidad (simple → complejo)

2. ❓ ¿Qué hacer si un componente en Figma tiene variants que no están implementados en el widget base?
   - **Propuesta**: Documentar como limitación conocida, solo implementar use cases para lo que el widget soporta

3. ❓ ¿Necesitamos crear comparison use cases para TODOS los componentes o solo los principales?
   - **Propuesta**: Crear comparisons solo donde Figma muestra agrupaciones explícitas

---

## Next Steps

1. ✅ Obtener aprobación de esta propuesta
2. Empezar con el primer Atom (ej: Avatar o Badge)
3. Establecer el workflow y template de validación
4. Procesar todos los Atoms secuencialmente
5. Procesar todas las Molecules secuencialmente
6. Build final y commit consolidado
