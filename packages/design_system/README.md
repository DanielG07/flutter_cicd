# AIRE Design System

Este es el repositorio centralizado para el **AIRE Design System**, que contiene todos los componentes del sistema de diseño, tokens, y documentación interactiva.

## 📖 Explorar Componentes con Widgetbook

El **Widgetbook** es la documentación interactiva central del sistema de diseño. Puedes explorar todos los componentes con sus diferentes variantes y casos de uso:

```bash
cd widgetbook
flutter pub get
flutter run
```

El Widgetbook incluye:
- **Atoms** (Átomos): Avatar, Badge, Button, Checkbox, Chip, IconButton, Link, RadioButton, Switch, Tag, etc.
- **Molecules** (Moléculas): InputText, InputSearch, List, SelectSingle, Slider, Toast, etc.
- **Features** (Características): SuccessDialog y otros componentes de nivel superior

Cada componente tiene múltiples casos de uso demostrando diferentes variantes, estados y configuraciones.

---

La aplicación incluye una **navegación por categorías** que te permite explorar cada nivel de Atomic Design:

- **🔬 Átomos**: Tokens de diseño y primitivos básicos
- **⚛️ Moléculas**: Combinaciones funcionales simples  
- **🦠 Organismos**: Componentes complejos del negocio
- **📄 Templates**: Estructuras de página reutilizables
- **📱 Páginas**: Implementaciones específicas completas

## 🏗️ Arquitectura: Atomic Design

### **⚛️ Átomos** (`lib/src/atoms/`)
**Elementos básicos e indivisibles del sistema:**

- **Tokens de Diseño:**
  - `color_tokens.dart` - Paleta de colores del sistema
  - `spacing_tokens.dart` - Espaciados consistentes
  - `typography_tokens.dart` - Escalas tipográficas

- **Primitivos:**
  - `ds_button.dart` - Botón básico del sistema
  - `ds_text.dart` - Componente de texto con variantes
  - `ds_icon.dart` - Iconos del sistema

### **🧬 Moléculas** (`lib/src/molecules/`)
**Combinaciones simples de átomos:**

- `ds_icon_button.dart` - Botón con icono y texto
- `ds_text_field.dart` - Campo de entrada con validación
- `ds_card.dart` - Tarjetas básicas y especializadas

### **🦠 Organismos** (`lib/src/organisms/`)
**Componentes complejos con funcionalidad específica:**

- `ds_contact_form.dart` - Formulario de contacto completo
- `ds_product_list.dart` - Lista de productos con modelo de datos
- `ds_navigation.dart` - Componentes de navegación (AppBar, BottomNav)

### **📄 Templates** (`lib/src/templates/`)
**Estructuras de página reutilizables:**

- `ds_page_templates.dart` - Plantillas de página, lista y formulario

### **📱 Pages** (`lib/src/pages/`)
**Implementaciones específicas de páginas:**

- `ds_home_page.dart` - Página principal con navegación por categorías
- `examples/` - Páginas de demostración para cada nivel

## 🎨 Navegación por Categorías

La aplicación principal (`DSHomePage`) presenta **tarjetas interactivas** para cada categoría:

```dart
// Cada tarjeta navega a una página de ejemplos específica
DSCard(
  onTap: () => Navigator.push(context, AtomsExamplesPage()),
  child: CategoryInfo(
    title: "🔬 Átomos",
    subtitle: "Elementos Básicos", 
    description: "Tokens y primitivos...",
  ),
)
```

### Páginas de Ejemplos:

1. **AtomsExamplesPage**: Muestra tokens de color, tipografía, espaciado y todos los primitivos
2. **MoleculesExamplesPage**: Demuestra botones con íconos, campos de texto y cards interactivos
3. **OrganismsExamplesPage**: Presenta formularios completos, listas y navegación funcional
4. **TemplatesExamplesPage**: Exhibe las diferentes plantillas de página disponibles
5. **PagesExamplesPage**: Explica la arquitectura completa y ejemplos de páginas

## 🚀 Uso

### Instalación
```yaml
dependencies:
  design_system:
    path: ../design_system
```

### Uso básico
```dart
import 'package:design_system/design_system.dart';

MaterialApp(
  theme: DSTheme.lightTheme,
  home: DSHomePage(), // Página principal con navegación
)
```

### Explorar componentes individualmente
```dart
// Átomos
DSButton(text: 'Acción', onPressed: () {})
DSText.headlineLarge('Título')
DSIcon.large(Icons.star)

// Moléculas  
DSIconButton(icon: Icons.add, text: 'Agregar', onPressed: () {})
DSTextField(hint: 'Email', label: 'Correo electrónico')
DSCard(child: contenido, onTap: () {})

// Organismos
DSContactForm(onSubmit: (name, email, msg) {})
DSProductList(products: lista, onProductTap: (producto) {})

// Templates
DSPageTemplate(title: 'Mi Página', body: contenido)
DSListTemplate(title: 'Lista', listContent: contenido)
```

## 🧪 Testing

```bash
flutter test
```

Todos los componentes incluyen pruebas unitarias que verifican:
- Renderizado correcto
- Comportamiento de callbacks
- Estados de loading y error
- Validación de propiedades

## 📱 Ejecutar Demo

```bash
cd example
flutter run
```

La demo presenta:
- Navegación intuitiva por categorías
- Ejemplos interactivos de cada componente
- Explicaciones de la metodología Atomic Design
- Demostraciones funcionales en tiempo real

## 🎯 Características del Explorer

### Navegación Intuitiva
- **Tarjetas de categorías** con descripciones claras
- **Iconos distintivos** para cada nivel
- **Transiciones suaves** entre páginas

### Ejemplos Interactivos
- **Botones funcionales** con feedback
- **Campos de texto** con validación en tiempo real
- **Formularios completos** con envío simulado
- **Cards** con interacciones táctiles

### Documentación Integrada
- **Explicaciones contextuales** en cada página
- **Beneficios de Atomic Design** explicados
- **Casos de uso** específicos para cada componente

## 🎨 Principios del Design System

1. **Consistencia**: Todos los componentes usan los mismos tokens
2. **Reutilización**: Componentes modulares y combinables
3. **Escalabilidad**: Arquitectura que permite crecimiento
4. **Mantenibilidad**: Código limpio y bien documentado
5. **Accesibilidad**: Diseño inclusivo desde el inicio
6. **Interactividad**: Ejemplos que puedes tocar y probar

## 📚 Metodología Atomic Design

```
Páginas (Pages)
    ↓ compuestas por
Templates
    ↓ compuestos por  
Organismos (Organisms)
    ↓ compuestos por
Moléculas (Molecules)
    ↓ compuestas por
Átomos (Atoms)
```

**¡Explora cada nivel interactivamente en la aplicación!**

---

**Creado con Atomic Design**
```dart
  Widget build(BuildContext context) {
    final theme = DesignSystemThemeProvider.of(context);
    
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(theme.spacing.lg),
        child: Column(
          children: [
            // Botones
            DSButton.primary(
              text: 'Botón Primario',
              onPressed: () {},
            ),
            
            SizedBox(height: theme.spacing.md),
            
            // Campos de texto
            DSTextField.email(
              label: 'Email',
              hint: 'tu@email.com',
            ),
            
            SizedBox(height: theme.spacing.md),
            
            // Cards
            DSCard(
              child: Text(
                'Contenido del card',
                style: theme.typography.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
```

