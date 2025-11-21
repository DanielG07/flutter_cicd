/// Design System Aire - Spacing Tokens
///
/// Definición centralizada de todos los valores de espaciado del design system.
///
/// El sistema de spacing proporciona valores consistentes para mantener
/// una jerarquía visual clara y un ritmo vertical/horizontal uniforme en toda
/// la aplicación.
///
/// Todos los valores están basados en múltiplos de 4px para mantener
/// consistencia y facilitar cálculos.
///
/// Uso:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(AireSpacing.spacingMd),
///   child: Text('Contenido'),
/// )
/// ```

import 'package:flutter/material.dart';

/// Clase que contiene todos los tokens de espaciado del Design System Aire.
///
/// Proporciona valores consistentes basados en múltiplos de 4px para crear
/// interfaces con ritmo visual coherente.
class AireSpacing {
  // Constructor privado para prevenir instanciación
  AireSpacing._();

  // ============================================================================
  // VALORES DE ESPACIADO BASE
  // ============================================================================

  /// Spacing 2xs - Espaciado extra extra pequeño (4px)
  /// Uso: Separación mínima entre elementos muy relacionados
  static const double spacing2xs = 4.0;

  /// Spacing xs - Espaciado extra pequeño (8px)
  /// Uso: Separación entre elementos relacionados, padding interno de chips/badges
  static const double spacingXs = 8.0;

  /// Spacing sm - Espaciado pequeño (12px)
  /// Uso: Separación entre elementos de un grupo, padding de botones pequeños
  static const double spacingSm = 12.0;

  /// Spacing md - Espaciado medio (16px) - VALOR POR DEFECTO
  /// Uso: Separación estándar entre elementos, padding de containers
  static const double spacingMd = 16.0;

  /// Spacing lg - Espaciado grande (24px)
  /// Uso: Separación entre secciones relacionadas, padding de cards
  static const double spacingLg = 24.0;

  /// Spacing xl - Espaciado extra grande (32px)
  /// Uso: Separación entre secciones principales
  static const double spacingXl = 32.0;

  /// Spacing 2xl - Espaciado extra extra grande (40px)
  /// Uso: Separación entre bloques de contenido importantes
  static const double spacing2xl = 40.0;

  /// Spacing 3xl - Espaciado extra extra extra grande (48px)
  /// Uso: Separación entre secciones relacionadas, márgenes externos
  static const double spacing3xl = 48.0;

  /// Spacing 4xl - Espaciado extra grande (64px)
  /// Uso: Separación entre secciones principales de página
  static const double spacing4xl = 64.0;

  /// Spacing 5xl - Espaciado máximo (80px)
  /// Uso: Separación en layouts especiales, héroes
  static const double spacing5xl = 80.0;

  /// Spacing 6xl - Espaciado extra máximo (96px)
  /// Uso: Separación en landing pages, espacios dramáticos
  static const double spacing6xl = 96.0;

  // ============================================================================
  // EDGE INSETS - Para uso con Padding y Margin
  // ============================================================================

  /// EdgeInsets con spacing 2xs en todos los lados (4px)
  static const EdgeInsets all2xs = EdgeInsets.all(spacing2xs);

  /// EdgeInsets con spacing xs en todos los lados (8px)
  static const EdgeInsets allXs = EdgeInsets.all(spacingXs);

  /// EdgeInsets con spacing sm en todos los lados (12px)
  static const EdgeInsets allSm = EdgeInsets.all(spacingSm);

  /// EdgeInsets con spacing md en todos los lados (16px)
  static const EdgeInsets allMd = EdgeInsets.all(spacingMd);

  /// EdgeInsets con spacing lg en todos los lados (24px)
  static const EdgeInsets allLg = EdgeInsets.all(spacingLg);

  /// EdgeInsets con spacing xl en todos los lados (32px)
  static const EdgeInsets allXl = EdgeInsets.all(spacingXl);

  /// EdgeInsets con spacing 2xl en todos los lados (48px)
  static const EdgeInsets all2xl = EdgeInsets.all(spacing2xl);

  /// EdgeInsets con spacing 3xl en todos los lados (48px)
  static const EdgeInsets all3xl = EdgeInsets.all(spacing3xl);

  /// EdgeInsets con spacing 4xl en todos los lados (64px)
  static const EdgeInsets all4xl = EdgeInsets.all(spacing4xl);

  /// EdgeInsets con spacing 5xl en todos los lados (80px)
  static const EdgeInsets all5xl = EdgeInsets.all(spacing5xl);

  /// EdgeInsets con spacing 6xl en todos los lados (96px)
  static const EdgeInsets all6xl = EdgeInsets.all(spacing6xl);

  // ============================================================================
  // EDGE INSETS - HORIZONTAL
  // ============================================================================

  /// EdgeInsets horizontal con spacing 2xs (4px)
  static const EdgeInsets horizontal2xs =
      EdgeInsets.symmetric(horizontal: spacing2xs);

  /// EdgeInsets horizontal con spacing xs (8px)
  static const EdgeInsets horizontalXs =
      EdgeInsets.symmetric(horizontal: spacingXs);

  /// EdgeInsets horizontal con spacing sm (12px)
  static const EdgeInsets horizontalSm =
      EdgeInsets.symmetric(horizontal: spacingSm);

  /// EdgeInsets horizontal con spacing md (16px)
  static const EdgeInsets horizontalMd =
      EdgeInsets.symmetric(horizontal: spacingMd);

  /// EdgeInsets horizontal con spacing lg (24px)
  static const EdgeInsets horizontalLg =
      EdgeInsets.symmetric(horizontal: spacingLg);

  /// EdgeInsets horizontal con spacing xl (32px)
  static const EdgeInsets horizontalXl =
      EdgeInsets.symmetric(horizontal: spacingXl);

  /// EdgeInsets horizontal con spacing 2xl (48px)
  static const EdgeInsets horizontal2xl =
      EdgeInsets.symmetric(horizontal: spacing2xl);

  /// EdgeInsets horizontal con spacing 3xl (48px)
  static const EdgeInsets horizontal3xl =
      EdgeInsets.symmetric(horizontal: spacing3xl);

  /// EdgeInsets horizontal con spacing 4xl (64px)
  static const EdgeInsets horizontal4xl =
      EdgeInsets.symmetric(horizontal: spacing4xl);

  /// EdgeInsets horizontal con spacing 5xl (80px)
  static const EdgeInsets horizontal5xl =
      EdgeInsets.symmetric(horizontal: spacing5xl);

  /// EdgeInsets horizontal con spacing 6xl (96px)
  static const EdgeInsets horizontal6xl =
      EdgeInsets.symmetric(horizontal: spacing6xl);

  // ============================================================================
  // EDGE INSETS - VERTICAL
  // ============================================================================

  /// EdgeInsets vertical con spacing 2xs (4px)
  static const EdgeInsets vertical2xs =
      EdgeInsets.symmetric(vertical: spacing2xs);

  /// EdgeInsets vertical con spacing xs (8px)
  static const EdgeInsets verticalXs =
      EdgeInsets.symmetric(vertical: spacingXs);

  /// EdgeInsets vertical con spacing sm (12px)
  static const EdgeInsets verticalSm =
      EdgeInsets.symmetric(vertical: spacingSm);

  /// EdgeInsets vertical con spacing md (16px)
  static const EdgeInsets verticalMd =
      EdgeInsets.symmetric(vertical: spacingMd);

  /// EdgeInsets vertical con spacing lg (24px)
  static const EdgeInsets verticalLg =
      EdgeInsets.symmetric(vertical: spacingLg);

  /// EdgeInsets vertical con spacing xl (32px)
  static const EdgeInsets verticalXl =
      EdgeInsets.symmetric(vertical: spacingXl);

  /// EdgeInsets vertical con spacing 2xl (48px)
  static const EdgeInsets vertical2xl =
      EdgeInsets.symmetric(vertical: spacing2xl);

  /// EdgeInsets vertical con spacing 3xl (48px)
  static const EdgeInsets vertical3xl =
      EdgeInsets.symmetric(vertical: spacing3xl);

  /// EdgeInsets vertical con spacing 4xl (64px)
  static const EdgeInsets vertical4xl =
      EdgeInsets.symmetric(vertical: spacing4xl);

  /// EdgeInsets vertical con spacing 5xl (80px)
  static const EdgeInsets vertical5xl =
      EdgeInsets.symmetric(vertical: spacing5xl);

  /// EdgeInsets vertical con spacing 6xl (96px)
  static const EdgeInsets vertical6xl =
      EdgeInsets.symmetric(vertical: spacing6xl);

  // ============================================================================
  // SIZEDBOX - Para espaciado vertical y horizontal
  // ============================================================================

  /// SizedBox vertical con spacing 2xs (4px)
  static const SizedBox verticalSpace2xs = SizedBox(height: spacing2xs);

  /// SizedBox vertical con spacing xs (8px)
  static const SizedBox verticalSpaceXs = SizedBox(height: spacingXs);

  /// SizedBox vertical con spacing sm (12px)
  static const SizedBox verticalSpaceSm = SizedBox(height: spacingSm);

  /// SizedBox vertical con spacing md (16px)
  static const SizedBox verticalSpaceMd = SizedBox(height: spacingMd);

  /// SizedBox vertical con spacing lg (24px)
  static const SizedBox verticalSpaceLg = SizedBox(height: spacingLg);

  /// SizedBox vertical con spacing xl (32px)
  static const SizedBox verticalSpaceXl = SizedBox(height: spacingXl);

  /// SizedBox vertical con spacing 2xl (48px)
  static const SizedBox verticalSpace2xl = SizedBox(height: spacing2xl);

  /// SizedBox vertical con spacing 3xl (48px)
  static const SizedBox verticalSpace3xl = SizedBox(height: spacing3xl);

  /// SizedBox vertical con spacing 4xl (64px)
  static const SizedBox verticalSpace4xl = SizedBox(height: spacing4xl);

  /// SizedBox vertical con spacing 5xl (80px)
  static const SizedBox verticalSpace5xl = SizedBox(height: spacing5xl);

  /// SizedBox vertical con spacing 6xl (96px)
  static const SizedBox verticalSpace6xl = SizedBox(height: spacing6xl);

  /// SizedBox horizontal con spacing 2xs (4px)
  static const SizedBox horizontalSpace2xs = SizedBox(width: spacing2xs);

  /// SizedBox horizontal con spacing xs (8px)
  static const SizedBox horizontalSpaceXs = SizedBox(width: spacingXs);

  /// SizedBox horizontal con spacing sm (12px)
  static const SizedBox horizontalSpaceSm = SizedBox(width: spacingSm);

  /// SizedBox horizontal con spacing md (16px)
  static const SizedBox horizontalSpaceMd = SizedBox(width: spacingMd);

  /// SizedBox horizontal con spacing lg (24px)
  static const SizedBox horizontalSpaceLg = SizedBox(width: spacingLg);

  /// SizedBox horizontal con spacing xl (32px)
  static const SizedBox horizontalSpaceXl = SizedBox(width: spacingXl);

  /// SizedBox horizontal con spacing 2xl (48px)
  static const SizedBox horizontalSpace2xl = SizedBox(width: spacing2xl);

  /// SizedBox horizontal con spacing 3xl (48px)
  static const SizedBox horizontalSpace3xl = SizedBox(width: spacing3xl);

  /// SizedBox horizontal con spacing 4xl (64px)
  static const SizedBox horizontalSpace4xl = SizedBox(width: spacing4xl);

  /// SizedBox horizontal con spacing 5xl (80px)
  static const SizedBox horizontalSpace5xl = SizedBox(width: spacing5xl);

  /// SizedBox horizontal con spacing 6xl (96px)
  static const SizedBox horizontalSpace6xl = SizedBox(width: spacing6xl);

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Obtiene el valor de spacing apropiado según el tamaño especificado
  ///
  /// Soporta: '2xs', 'xs', 'sm', 'md', 'lg', 'xl', '2xl', '3xl', '4xl', '5xl', '6xl'
  static double getSpacing(String size) {
    switch (size.toLowerCase()) {
      case '2xs':
      case 'xxs':
        return spacing2xs;
      case 'xs':
      case 'extra-small':
        return spacingXs;
      case 's':
      case 'sm':
      case 'small':
        return spacingSm;
      case 'm':
      case 'md':
      case 'medium':
        return spacingMd;
      case 'l':
      case 'lg':
      case 'large':
        return spacingLg;
      case 'xl':
      case 'extra-large':
        return spacingXl;
      case '2xl':
      case 'xxl':
        return spacing2xl;
      case '3xl':
      case 'xxxl':
        return spacing3xl;
      case '4xl':
        return spacing4xl;
      case '5xl':
        return spacing5xl;
      case '6xl':
        return spacing6xl;
      default:
        return spacingMd;
    }
  }

  /// Crea un EdgeInsets con valores específicos para cada lado
  ///
  /// Ejemplo:
  /// ```dart
  /// EdgeInsets custom = AireSpacing.custom(
  ///   top: AireSpacing.spacingLg,
  ///   bottom: AireSpacing.spacingMd,
  ///   left: AireSpacing.spacingXs,
  ///   right: AireSpacing.spacingXs,
  /// );
  /// ```
  static EdgeInsets custom({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    return EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }

  /// Crea un EdgeInsets simétrico con valores específicos
  ///
  /// Ejemplo:
  /// ```dart
  /// EdgeInsets symmetric = AireSpacing.symmetric(
  ///   horizontal: AireSpacing.spacingLg,
  ///   vertical: AireSpacing.spacingMd,
  /// );
  /// ```
  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  /// Crea un SizedBox vertical con un tamaño específico
  static SizedBox verticalSpace(double height) => SizedBox(height: height);

  /// Crea un SizedBox horizontal con un tamaño específico
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);

  // ============================================================================
  // GUÍAS DE USO
  // ============================================================================

  /// Mapeo de casos de uso comunes a espaciados recomendados
  static const Map<String, double> useCaseMapping = {
    // Padding interno de componentes
    'badge_padding': spacingXs, // 8px
    'button_padding_sm': spacingSm, // 12px
    'button_padding_md': spacingMd, // 16px
    'chip_padding': spacingXs, // 8px
    'card_padding': spacingLg, // 24px

    // Separación entre elementos
    'icon_text_gap': spacingXs, // 8px
    'list_item_gap': spacingMd, // 16px
    'section_gap': spacingXl, // 32px
    'page_section_gap': spacing2xl, // 48px

    // Márgenes
    'page_margin': spacingLg, // 24px
    'container_margin': spacingMd, // 16px
    'element_margin': spacingXs, // 8px
  };
}
