import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para las variantes de badge
enum BadgeVariant {
  dot,
  number,
  icon,
}

/// Enum para los colores de badge
enum BadgeColor {
  error,
  primary,
  success,
  warning,
  info,
}

/// Configuración de color para cada variante de badge
class _BadgeColorConfig {
  final Color backgroundColor;

  const _BadgeColorConfig({
    required this.backgroundColor,
  });

  static _BadgeColorConfig fromColor(BadgeColor color) {
    switch (color) {
      case BadgeColor.error:
        return _BadgeColorConfig(
          backgroundColor: AireColors.error300,
        );
      case BadgeColor.primary:
        return _BadgeColorConfig(
          backgroundColor: AireColors.primary400,
        );
      case BadgeColor.success:
        return _BadgeColorConfig(
          backgroundColor: AireColors.success400,
        );
      case BadgeColor.warning:
        return _BadgeColorConfig(
          backgroundColor: AireColors.warning400,
        );
      case BadgeColor.info:
        return _BadgeColorConfig(
          backgroundColor: AireColors.info500,
        );
    }
  }
}

/// Widget de badge atom con múltiples variantes
///
/// Soporta 3 variantes: Dot, Number, Icon
/// Soporta 5 colores: Error, Primary, Success, Warning, Info
///
/// Ejemplo de uso:
/// ```dart
/// // Badge tipo dot
/// AireBadge.dot(color: BadgeColor.error)
///
/// // Badge con número
/// AireBadge.number(count: 5, color: BadgeColor.error)
///
/// // Badge con ícono
/// AireBadge.icon(icon: Icons.check, color: BadgeColor.success)
/// ```
class AireBadge extends StatelessWidget {
  /// Variante del badge (dot, number, icon)
  final BadgeVariant variant;

  /// Color del badge
  final BadgeColor color;

  /// Número a mostrar (solo para variant number)
  final int? count;

  /// Ícono a mostrar (solo para variant icon)
  final IconData? icon;

  /// Tamaño máximo para el número (por defecto 99+)
  final int maxCount;

  const AireBadge._({
    super.key,
    required this.variant,
    required this.color,
    this.count,
    this.icon,
    this.maxCount = 99,
  });

  /// Constructor para badge tipo dot
  const AireBadge.dot({
    Key? key,
    BadgeColor color = BadgeColor.error,
  }) : this._(
          key: key,
          variant: BadgeVariant.dot,
          color: color,
        );

  /// Constructor para badge tipo number
  const AireBadge.number({
    Key? key,
    required int count,
    BadgeColor color = BadgeColor.error,
    int maxCount = 99,
  }) : this._(
          key: key,
          variant: BadgeVariant.number,
          color: color,
          count: count,
          maxCount: maxCount,
        );

  /// Constructor para badge tipo icon
  const AireBadge.icon({
    Key? key,
    required IconData icon,
    BadgeColor color = BadgeColor.primary,
  }) : this._(
          key: key,
          variant: BadgeVariant.icon,
          color: color,
          icon: icon,
        );

  String _getCountText() {
    if (count == null) return '';
    if (count! > maxCount) return '$maxCount+';
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colorConfig = _BadgeColorConfig.fromColor(color);

    switch (variant) {
      case BadgeVariant.dot:
        return Container(
          width: AireIconSizes.icon2xs,
          height: AireIconSizes.icon2xs,
          decoration: BoxDecoration(
            color: colorConfig.backgroundColor,
            borderRadius: AireBorderRadius.borderSm,
          ),
        );

      case BadgeVariant.number:
        final countText = _getCountText();
        return Container(
          constraints: const BoxConstraints(
            minWidth: 16,
            minHeight: 16,
          ),
          padding: EdgeInsets.symmetric(horizontal: AireSpacing.spacing2xs),
          decoration: BoxDecoration(
            color: colorConfig.backgroundColor,
            borderRadius: AireBorderRadius.borderCircular,
          ),
          child: Center(
            child: Text(
              countText,
              style: AireTextStyles.bodySmallRegular.copyWith(
                color: AireColors.white,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );

      case BadgeVariant.icon:
        return Container(
          width: AireIconSizes.iconXs,
          height: AireIconSizes.iconXs,
          padding: EdgeInsets.all(AireSpacing.spacing2xs / 2),
          decoration: BoxDecoration(
            color: colorConfig.backgroundColor,
            borderRadius: AireBorderRadius.borderCircular,
          ),
          child: Icon(
            icon ?? Icons.circle,
            size: AireIconSizes.icon2xs,
            color: AireColors.white,
          ),
        );
    }
  }
}
