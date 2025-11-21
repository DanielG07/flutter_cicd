# Manual Navigation Instructions for Widgetbook Validation

## Context
Flutter Web usa canvas rendering por defecto, lo que impide que Playwright pueda "ver" e interactuar con los elementos de la UI. El flag `--web-renderer html` no está disponible en Flutter 3.35.6.

## Solución Híbrida
**Tú navegas manualmente**, yo capturo screenshots y comparo con Figma.

---

## Paso a Paso para Validar Button Component

### 1. Abrir Widgetbook en el Browser
```
URL: http://localhost:8080
```
Ya está corriendo en segundo plano.

### 2. Navegar al Componente Button

**Ruta de navegación**:
1. Click en el ícono **"Navigation"** (menú inferior izquierdo)
2. Expandir **"Widgets"** o buscar directamente **"AireButton"**
3. Click en **"AireButton"**
4. Seleccionar **"Interactive"** (el nuevo use case con knobs)

### 3. Configurar Knobs para Primary Medium (Estado Default)

**En el panel de Knobs (derecha)**:
- **Variant**: PRIMARY
- **Size**: MEDIUM
- **Text**: "Button"
- **Enabled**: ✓ (checked)
- **Icon Position**: None

### 4. Notificarme cuando estés listo
Dime "listo para screenshot" y yo:
1. Capturaré el screenshot del componente
2. Lo compararé con la imagen de Figma que ya tengo
3. Documentaré cualquier diferencia visual

---

## Variantes a Validar (en orden)

### Variantes Principales (sin íconos)
1. ✅ **Primary Medium** - Default state (PRIMERA)
2. Secondary Medium - Default state
3. Tertiary Medium - Default state
4. Ghost Medium - Default state

### Tamaños (Primary)
5. Primary Large
6. Primary Small
7. Primary XSmall

### Con Íconos (Primary Medium)
8. Icon Left
9. Icon Right

### Estados (Primary Medium)
10. Disabled (toggle Enabled off)

---

## Screenshot de Referencia Figma

Ya tengo capturado el diseño de Figma para **Primary Medium Default**:
- Color de fondo: `#2D59F0` (primary400)
- Texto: "Button"
- Font: Figtree SemiBold, 18px
- Padding: 32px horizontal, 16px vertical
- Border radius: 40px

---

## Cuando termines cada variante
Dime cuál has configurado y yo:
1. Capturo screenshot
2. Comparo con Figma
3. Documento en el reporte de validación
4. Te digo "siguiente" para continuar

---

## Ventajas de este Enfoque
- ✅ Validación visual precisa
- ✅ Puedes ver en tiempo real los componentes
- ✅ Los knobs permiten cambiar rápido entre variantes
- ✅ No necesita reconstruir Flutter con configuraciones especiales

## Desventajas
- ⏳ Requiere navegación manual (1-2 minutos por variante)
- 🔄 No es completamente automatizado

---

## Alternativa Futura
Para automatización completa, consideraría:
1. **Flutter Driver/Integration Tests** - Herramientas nativas de Flutter
2. **Widgetbook Cloud** - Hosting que facilita acceso
3. **Custom renderer plugin** - Solución avanzada pero compleja
