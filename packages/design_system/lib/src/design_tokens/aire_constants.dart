/// Design System Aire - Constants
///
/// Definición centralizada de constantes reutilizables del design system.
/// Incluye duraciones de animación, valores de opacidad, tamaños de componentes, etc.
///
/// Uso:
/// ```dart
/// Container(
///   color: AireColors.black.withValues(alpha: AireConstants.opacityHigh),
/// )
/// ```

/// Clase que contiene todas las constantes del Design System Aire.
class AireConstants {
  // Constructor privado para prevenir instanciación
  AireConstants._();

  // ============================================================================
  // ANIMATION DURATIONS
  // ============================================================================

  /// Duración estándar de animaciones (300ms)
  /// Usado en transiciones de página, botones,etc.
  static const Duration animationDurationStandard = Duration(milliseconds: 300);

  /// Duración rápida de animaciones (150ms)
  static const Duration animationDurationFast = Duration(milliseconds: 150);

  /// Duración lenta de animaciones (500ms)
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // ============================================================================
  // OPACITY VALUES
  // ============================================================================

  /// Opacidad muy baja (10%) - Apenas visible
  static const double opacityVeryLow = 0.1;

  /// Opacidad baja (20%) - Elemento sutil, gradientes iniciales
  static const double opacityLow = 0.2;

  /// Opacidad media-baja (30%) - Deshabilitado/secundario, líneas divisoras
  static const double opacityMediumLow = 0.3;

  /// Opacidad media (50%) - Semi-transparente
  static const double opacityMedium = 0.5;

  /// Opacidad alta (80%) - Casi opaco, overlays oscuros
  static const double opacityHigh = 0.8;

  // ============================================================================
  // COMPONENT SPECIFIC VALUES
  // ============================================================================

  /// Altura de botón pequeño (40px) - Usado en onboarding
  static const double buttonHeightSmall = 40.0;

  /// Altura de botón mediano (48px)
  static const double buttonHeightMedium = 48.0;

  /// Altura de botón grande (56px)
  static const double buttonHeightLarge = 56.0;

  /// Ancho de indicador de progreso activo (24px)
  static const double progressIndicatorActiveWidth = 24.0;

  /// Ancho de indicador de progreso inactivo (8px)
  static const double progressIndicatorInactiveWidth = 8.0;

  /// Altura de indicador de progreso (8px)
  static const double progressIndicatorHeight = 8.0;

  /// Tamaño de botón social (32px x 32px)
  static const double socialButtonSize = 32.0;

  /// Tamaño de icono en botón social (16px)
  static const double socialButtonIconSize = 16.0;

  /// Altura de línea divisora (1px)
  static const double dividerHeight = 1.0;

  /// Bottom padding para slides de onboarding (120px)
  /// Calculado como: botones (24 + 40 + 24 = 88px) + gap (32px) = 120px
  static const double onboardingSlideBottomPadding = 120.0;
}
