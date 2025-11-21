/// Design System Aire - Icon Size Tokens
///
/// Definición centralizada de todos los tamaños de iconos del design system.
/// Basado en la especificación oficial de tokens de Aire.
///
/// Los iconos utilizan Font Awesome con una cuadrícula base de 16x16 píxeles
/// y un desbordamiento horizontal de 4 píxeles para iconos más anchos.
///
/// Uso:
/// ```dart
/// Icon(
///   Icons.home,
///   size: AireIconSizes.medium,
/// )
/// ```

/// Clase que contiene todos los tamaños de iconos del Design System Aire.
///
/// Proporciona valores consistentes para tamaños de iconos en diferentes
/// contextos de la aplicación.
class AireIconSizes {
  // Constructor privado para prevenir instanciación
  AireIconSizes._();

  // ============================================================================
  // TAMAÑOS DE ICONOS
  // ============================================================================

  /// Icon 2xs - Iconos extra extra pequeños (8px)
  /// Uso: Badges
  static const double icon2xs = 8.0;

  /// Icon xs - Iconos extra pequeños (12px)
  /// Uso: Command links (small size), Tags (small size), Category tag,
  /// Buttons (xsmall size)
  static const double iconXs = 12.0;

  /// Icon sm - Iconos pequeños (14px)
  /// Uso: Buttons (small size), Links (small size), Command links (medium size),
  /// Inputs (small size)
  static const double iconSm = 14.0;

  /// Icon md - Iconos medianos (16px) - TAMAÑO POR DEFECTO
  /// Uso: Buttons (Small size), Links (small size), Command links (large size),
  /// Tags (default size), Inputs (default size), Dropdown menu
  static const double iconMd = 16.0;

  /// Icon lg - Iconos grandes (18px)
  /// Uso: Buttons (medium size), Links (large size)
  static const double iconLg = 18.0;

  /// Icon xl - Iconos extra grandes (20px)
  /// Uso: Buttons (large size)
  static const double iconXl = 20.0;

  /// Icon 2xl - Iconos extra extra grandes (24px)
  /// Uso: Alerts, Icons button
  static const double icon2xl = 24.0;

  // ============================================================================
  // GRID SYSTEM
  // ============================================================================

  /// Tamaño de la cuadrícula base para iconos (16px)
  static const double gridSize = 16.0;

  /// Desbordamiento horizontal para iconos anchos (4px)
  static const double horizontalOverflow = 4.0;

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Obtiene el tamaño de icono apropiado según el contexto especificado
  ///
  /// Soporta: '2xs', 'xs', 'sm', 'md', 'lg', 'xl', '2xl'
  static double getIconSize(String size) {
    switch (size.toLowerCase()) {
      case '2xs':
      case 'xxs':
        return icon2xs;
      case 'xs':
      case 'extra-small':
        return iconXs;
      case 's':
      case 'sm':
      case 'small':
        return iconSm;
      case 'm':
      case 'md':
      case 'medium':
        return iconMd;
      case 'l':
      case 'lg':
      case 'large':
        return iconLg;
      case 'xl':
      case 'extra-large':
        return iconXl;
      case '2xl':
      case 'xxl':
        return icon2xl;
      default:
        return iconMd;
    }
  }

  /// Obtiene el tamaño de icono apropiado para un botón según su tamaño
  ///
  /// Ejemplo:
  /// ```dart
  /// double iconSize = AireIconSizes.getIconSizeForButton('small');
  /// ```
  static double getIconSizeForButton(String buttonSize) {
    switch (buttonSize.toLowerCase()) {
      case 'xs':
      case 'extra-small':
        return iconXs; // 12px
      case 's':
      case 'sm':
      case 'small':
        return iconSm; // 14px
      case 'm':
      case 'md':
      case 'medium':
        return iconLg; // 18px
      case 'l':
      case 'lg':
      case 'large':
        return iconXl; // 20px
      default:
        return iconMd; // 16px
    }
  }

  /// Obtiene el tamaño de icono apropiado para un input según su tamaño
  static double getIconSizeForInput(String inputSize) {
    switch (inputSize.toLowerCase()) {
      case 's':
      case 'sm':
      case 'small':
        return iconSm; // 14px
      case 'm':
      case 'md':
      case 'medium':
      case 'default':
        return iconMd; // 16px
      case 'l':
      case 'lg':
      case 'large':
        return iconLg; // 18px
      default:
        return iconMd; // 16px
    }
  }

  // ============================================================================
  // GUÍAS DE USO
  // ============================================================================

  /// Mapeo de componentes a tamaños recomendados de iconos
  static const Map<String, double> componentMapping = {
    // Badges
    'badge': icon2xs, // 8px

    // Tags
    'tag_small': iconXs, // 12px
    'tag_default': iconMd, // 16px

    // Buttons
    'button_xsmall': iconXs, // 12px
    'button_small': iconSm, // 14px
    'button_medium': iconLg, // 18px
    'button_large': iconXl, // 20px

    // Links
    'link_small': iconSm, // 14px
    'link_medium': iconMd, // 16px
    'link_large': iconLg, // 18px

    // Inputs
    'input_small': iconSm, // 14px
    'input_default': iconMd, // 16px

    // Otros componentes
    'dropdown_menu': iconMd, // 16px
    'alert': icon2xl, // 24px
    'icon_button': icon2xl, // 24px
  };
}
