/// Design System Aire - Border Radius Tokens
///
/// Definición centralizada de todos los valores de border radius del design system.
/// Basado en la especificación oficial de tokens de Aire.
///
/// El Radius es un token que agrega un redondeado a las esquinas y se puede
/// aplicar a cualquier forma, relleno, borde o elevación. Sirven para brindar
/// calidez y limpieza a la interfaz.
///
/// Uso:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.blue,
///     borderRadius: AireBorderRadius.borderMd,
///   ),
/// )
/// ```

import 'package:flutter/material.dart';

/// Clase que contiene todos los tokens de border radius del Design System Aire.
///
/// Proporciona valores consistentes para crear interfaces modernas y cohesivas.
class AireBorderRadius {
  // Constructor privado para prevenir instanciación
  AireBorderRadius._();

  // ============================================================================
  // VALORES DE BORDER RADIUS
  // ============================================================================

  /// 2xs - Elementos muy pequeños, badges (4px)
  static const double radius2xs = 4.0;

  /// xs - Botones pequeños, inputs (8px)
  static const double radiusXs = 8.0;

  /// sm - Cards pequeños, chips (12px)
  static const double radiusSm = 12.0;

  /// md - Botones estándar, modales (16px)
  static const double radiusMd = 16.0;

  /// lg - Cards grandes, containers (24px)
  static const double radiusLg = 24.0;

  /// xl - Pill buttons, botones completamente redondeados (40px)
  static const double radiusXl = 40.0;

  /// circular - Avatares, botones circulares (9999px)
  static const double radiusCircular = 9999.0;

  // ============================================================================
  // BORDER RADIUS OBJECTS - Para uso con BorderRadius
  // ============================================================================

  /// Border radius 2xs (4px) - Para usar con BoxDecoration
  static BorderRadius get border2xs => BorderRadius.circular(radius2xs);

  /// Border radius xs (8px) - Para usar con BoxDecoration
  static BorderRadius get borderXs => BorderRadius.circular(radiusXs);

  /// Border radius sm (12px) - Para usar con BoxDecoration
  static BorderRadius get borderSm => BorderRadius.circular(radiusSm);

  /// Border radius md (16px) - Para usar con BoxDecoration
  static BorderRadius get borderMd => BorderRadius.circular(radiusMd);

  /// Border radius lg (24px) - Para usar con BoxDecoration
  static BorderRadius get borderLg => BorderRadius.circular(radiusLg);

  /// Border radius xl (40px) - Para usar con BoxDecoration (pill buttons)
  static BorderRadius get borderXl => BorderRadius.circular(radiusXl);

  /// Border radius circular (9999px) - Para usar con BoxDecoration
  static BorderRadius get borderCircular =>
      BorderRadius.circular(radiusCircular);

  // ============================================================================
  // RADIUS OBJECTS - Para uso con Radius (ClipRRect, etc.)
  // ============================================================================

  /// Radius 2xs (4px) - Para usar con ClipRRect, etc.
  static Radius get radius2xsRadius => Radius.circular(radius2xs);

  /// Radius xs (8px) - Para usar con ClipRRect, etc.
  static Radius get radiusXsRadius => Radius.circular(radiusXs);

  /// Radius sm (12px) - Para usar con ClipRRect, etc.
  static Radius get radiusSmRadius => Radius.circular(radiusSm);

  /// Radius md (16px) - Para usar con ClipRRect, etc.
  static Radius get radiusMdRadius => Radius.circular(radiusMd);

  /// Radius lg (24px) - Para usar con ClipRRect, etc.
  static Radius get radiusLgRadius => Radius.circular(radiusLg);

  /// Radius xl (40px) - Para usar con ClipRRect, etc.
  static Radius get radiusXlRadius => Radius.circular(radiusXl);

  /// Radius circular (9999px) - Para usar con ClipRRect, etc.
  static Radius get radiusCircularRadius => Radius.circular(radiusCircular);

  // ============================================================================
  // BORDER RADIUS PARCIALES - Solo esquinas específicas
  // ============================================================================

  // --- TOP CORNERS ---

  /// Border radius 2xs solo arriba (4px)
  static BorderRadius get borderTop2xs => BorderRadius.only(
        topLeft: radius2xsRadius,
        topRight: radius2xsRadius,
      );

  /// Border radius xs solo arriba (8px)
  static BorderRadius get borderTopXs => BorderRadius.only(
        topLeft: radiusXsRadius,
        topRight: radiusXsRadius,
      );

  /// Border radius sm solo arriba (12px)
  static BorderRadius get borderTopSm => BorderRadius.only(
        topLeft: radiusSmRadius,
        topRight: radiusSmRadius,
      );

  /// Border radius md solo arriba (16px)
  static BorderRadius get borderTopMd => BorderRadius.only(
        topLeft: radiusMdRadius,
        topRight: radiusMdRadius,
      );

  /// Border radius lg solo arriba (24px)
  static BorderRadius get borderTopLg => BorderRadius.only(
        topLeft: radiusLgRadius,
        topRight: radiusLgRadius,
      );

  // --- BOTTOM CORNERS ---

  /// Border radius 2xs solo abajo (4px)
  static BorderRadius get borderBottom2xs => BorderRadius.only(
        bottomLeft: radius2xsRadius,
        bottomRight: radius2xsRadius,
      );

  /// Border radius xs solo abajo (8px)
  static BorderRadius get borderBottomXs => BorderRadius.only(
        bottomLeft: radiusXsRadius,
        bottomRight: radiusXsRadius,
      );

  /// Border radius sm solo abajo (12px)
  static BorderRadius get borderBottomSm => BorderRadius.only(
        bottomLeft: radiusSmRadius,
        bottomRight: radiusSmRadius,
      );

  /// Border radius md solo abajo (16px)
  static BorderRadius get borderBottomMd => BorderRadius.only(
        bottomLeft: radiusMdRadius,
        bottomRight: radiusMdRadius,
      );

  /// Border radius lg solo abajo (24px)
  static BorderRadius get borderBottomLg => BorderRadius.only(
        bottomLeft: radiusLgRadius,
        bottomRight: radiusLgRadius,
      );

  // --- LEFT CORNERS ---

  /// Border radius 2xs solo izquierda (4px)
  static BorderRadius get borderLeft2xs => BorderRadius.only(
        topLeft: radius2xsRadius,
        bottomLeft: radius2xsRadius,
      );

  /// Border radius xs solo izquierda (8px)
  static BorderRadius get borderLeftXs => BorderRadius.only(
        topLeft: radiusXsRadius,
        bottomLeft: radiusXsRadius,
      );

  /// Border radius sm solo izquierda (12px)
  static BorderRadius get borderLeftSm => BorderRadius.only(
        topLeft: radiusSmRadius,
        bottomLeft: radiusSmRadius,
      );

  /// Border radius md solo izquierda (16px)
  static BorderRadius get borderLeftMd => BorderRadius.only(
        topLeft: radiusMdRadius,
        bottomLeft: radiusMdRadius,
      );

  /// Border radius lg solo izquierda (24px)
  static BorderRadius get borderLeftLg => BorderRadius.only(
        topLeft: radiusLgRadius,
        bottomLeft: radiusLgRadius,
      );

  // --- RIGHT CORNERS ---

  /// Border radius 2xs solo derecha (4px)
  static BorderRadius get borderRight2xs => BorderRadius.only(
        topRight: radius2xsRadius,
        bottomRight: radius2xsRadius,
      );

  /// Border radius xs solo derecha (8px)
  static BorderRadius get borderRightXs => BorderRadius.only(
        topRight: radiusXsRadius,
        bottomRight: radiusXsRadius,
      );

  /// Border radius sm solo derecha (12px)
  static BorderRadius get borderRightSm => BorderRadius.only(
        topRight: radiusSmRadius,
        bottomRight: radiusSmRadius,
      );

  /// Border radius md solo derecha (16px)
  static BorderRadius get borderRightMd => BorderRadius.only(
        topRight: radiusMdRadius,
        bottomRight: radiusMdRadius,
      );

  /// Border radius lg solo derecha (24px)
  static BorderRadius get borderRightLg => BorderRadius.only(
        topRight: radiusLgRadius,
        bottomRight: radiusLgRadius,
      );

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Obtiene el BorderRadius apropiado según el tamaño especificado
  ///
  /// Soporta: '2xs', 'xs', 'sm', 'md', 'lg', 'xl', 'circular'
  static BorderRadius getBorderRadius(String size) {
    switch (size.toLowerCase()) {
      case '2xs':
      case 'xxs':
        return border2xs;
      case 'xs':
      case 'extra-small':
        return borderXs;
      case 's':
      case 'sm':
      case 'small':
        return borderSm;
      case 'm':
      case 'md':
      case 'medium':
        return borderMd;
      case 'l':
      case 'lg':
      case 'large':
        return borderLg;
      case 'xl':
      case 'extra-large':
        return borderXl;
      case 'circular':
      case 'circle':
      case 'round':
        return borderCircular;
      default:
        return borderMd;
    }
  }

  /// Obtiene el valor numérico del radius según el tamaño especificado
  static double getRadiusValue(String size) {
    switch (size.toLowerCase()) {
      case '2xs':
      case 'xxs':
        return radius2xs;
      case 'xs':
      case 'extra-small':
        return radiusXs;
      case 's':
      case 'sm':
      case 'small':
        return radiusSm;
      case 'm':
      case 'md':
      case 'medium':
        return radiusMd;
      case 'l':
      case 'lg':
      case 'large':
        return radiusLg;
      case 'xl':
      case 'extra-large':
        return radiusXl;
      case 'circular':
      case 'circle':
      case 'round':
        return radiusCircular;
      default:
        return radiusMd;
    }
  }

  /// Crea un BorderRadius personalizado con valores específicos para cada esquina
  ///
  /// Ejemplo:
  /// ```dart
  /// BorderRadius custom = AireBorderRadius.custom(
  ///   topLeft: AireBorderRadius.radiusLg,
  ///   topRight: AireBorderRadius.radiusLg,
  ///   bottomLeft: AireBorderRadius.radiusXs,
  ///   bottomRight: AireBorderRadius.radiusXs,
  /// );
  /// ```
  static BorderRadius custom({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );
  }
}
