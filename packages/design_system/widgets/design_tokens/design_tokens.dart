/// Design System Aire - Design Tokens
///
/// Barrel file que exporta todos los tokens del design system de Aire.
///
/// Este archivo facilita la importación de todos los tokens mediante una
/// única declaración de import.
///
/// ## Uso
///
/// En lugar de importar cada archivo individualmente:
/// ```dart
/// import 'package:vitam_usuario/src/core/design_tokens/aire_colors.dart';
/// import 'package:vitam_usuario/src/core/design_tokens/aire_text_styles.dart';
/// import 'package:vitam_usuario/src/core/design_tokens/aire_border_radius.dart';
/// import 'package:vitam_usuario/src/core/design_tokens/aire_spacing.dart';
/// ```
///
/// Puedes importar todo con:
/// ```dart
/// import 'package:vitam_usuario/src/core/design_tokens/design_tokens.dart';
/// ```
///
/// ## Tokens Disponibles
///
/// - **AireColors**: Todos los colores del sistema (primarios, secundarios,
///   neutrales, semánticos)
/// - **AireTextStyles**: Todos los estilos tipográficos (headings, body,
///   buttons, links, labels)
/// - **AireBorderRadius**: Todos los valores de border radius (2xs a circular)
/// - **AireSpacing**: Todos los valores de espaciado (2xs a 6xl)
/// - **AireBreakpoints**: Breakpoints responsivos y configuración de layout
///   (mobile, tablet, desktop, desktop XL)
/// - **AireIconSizes**: Tamaños de iconos para diferentes contextos
///   (2xs a 2xl, basados en Font Awesome)
///
/// ## Ejemplo de Uso
///
/// ```dart
/// import 'package:vitam_usuario/src/core/design_tokens/design_tokens.dart';
///
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Container(
///       padding: AireSpacing.allMd,
///       decoration: BoxDecoration(
///         color: AireColors.primary400,
///         borderRadius: AireBorderRadius.borderMd,
///       ),
///       child: Text(
///         'Hola Aire',
///         style: AireTextStyles.heading4Bold.copyWith(
///           color: AireColors.white,
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// ## Ejemplo de Uso Responsivo
///
/// ```dart
/// import 'package:vitam_usuario/src/core/design_tokens/design_tokens.dart';
///
/// class MyResponsiveWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return ResponsiveBuilder(
///       mobile: (context) => Container(
///         padding: EdgeInsets.all(AireBreakpoints.marginMobile),
///         child: Text('Mobile View'),
///       ),
///       desktop: (context) => Container(
///         padding: EdgeInsets.all(AireBreakpoints.marginDesktop),
///         child: Text('Desktop View'),
///       ),
///     );
///   }
/// }
/// ```
///
/// ## Principios del Sistema de Tokens
///
/// 1. **Consistencia**: Usar siempre los tokens en lugar de valores hardcodeados
/// 2. **Centralización**: Todos los valores visuales definidos en un solo lugar
/// 3. **Escalabilidad**: Fácil actualización de la identidad visual
/// 4. **Mantenibilidad**: Cambios globales desde archivos centralizados
/// 5. **Accesibilidad**: Tokens diseñados siguiendo WCAG 2.1
///
/// ## Estructura de Archivos
///
/// ```
/// lib/src/core/design_tokens/
/// ├── design_tokens.dart         (este archivo - barrel export)
/// ├── aire_colors.dart           (tokens de colores)
/// ├── aire_text_styles.dart      (tokens de tipografía)
/// ├── aire_border_radius.dart    (tokens de border radius)
/// ├── aire_spacing.dart          (tokens de espaciado)
/// ├── aire_breakpoints.dart      (tokens de breakpoints y layout)
/// └── aire_icons.dart            (tokens de tamaños de iconos)
/// ```

library design_tokens;

// Exportar todos los tokens del design system
export 'aire_colors.dart';
export 'aire_text_styles.dart';
export 'aire_border_radius.dart';
export 'aire_spacing.dart';
export 'aire_breakpoints.dart';
export 'aire_icons.dart';
