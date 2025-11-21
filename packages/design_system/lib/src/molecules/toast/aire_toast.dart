import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los diferentes tipos de Toast
enum ToastType {
  error,
  success,
  warning,
  info,
}

/// Configuración de colores e íconos para cada tipo de Toast
class _ToastConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final IconData icon;

  const _ToastConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.icon,
  });

  static _ToastConfig fromType(ToastType type) {
    switch (type) {
      case ToastType.error:
        return _ToastConfig(
          backgroundColor: AireColors.error100,
          textColor: AireColors.error500,
          iconColor: AireColors.error500,
          icon: Icons.cancel,
        );
      case ToastType.success:
        return _ToastConfig(
          backgroundColor: AireColors.success100,
          textColor: AireColors.success500,
          iconColor: AireColors.success500,
          icon: Icons.check_circle,
        );
      case ToastType.warning:
        return _ToastConfig(
          backgroundColor: AireColors.warning100,
          textColor: AireColors.warning500,
          iconColor: AireColors.warning500,
          icon: Icons.warning,
        );
      case ToastType.info:
        return _ToastConfig(
          backgroundColor: AireColors.info100,
          textColor: AireColors.info500,
          iconColor: AireColors.info500,
          icon: Icons.info,
        );
    }
  }
}

/// Widget Toast/Notificación con soporte para múltiples tipos y variantes
///
/// Soporta 4 tipos: Error, Success, Warning, Info
/// Puede mostrar:
/// - Solo label
/// - Solo descripción
/// - Label + descripción
/// - Cualquiera de las anteriores con botón de cerrar
class AireToast extends StatelessWidget {
  /// Tipo de toast (error, success, warning, info)
  final ToastType type;

  /// Texto principal del toast (ej: "Error", "Success")
  final String? label;

  /// Descripción/mensaje del toast
  final String? description;

  /// Si debe mostrar el botón de cerrar
  final bool showCloseButton;

  /// Callback cuando se presiona el botón de cerrar
  final VoidCallback? onClose;

  /// Padding personalizado (opcional)
  final EdgeInsetsGeometry? padding;

  /// Ancho del widget (opcional, por defecto usa el ancho disponible)
  final double? width;

  const AireToast({
    super.key,
    required this.type,
    this.label,
    this.description,
    this.showCloseButton = false,
    this.onClose,
    this.padding,
    this.width,
  }) : assert(
          label != null || description != null,
          'Debe proporcionar al menos label o description',
        );

  @override
  Widget build(BuildContext context) {
    final config = _ToastConfig.fromType(type);
    final effectivePadding = padding ?? AireSpacing.allSm;

    return Container(
      width: width,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: AireBorderRadius.borderXs,
      ),
      child: Row(
        children: [
          // Icono
          Icon(
            config.icon,
            color: config.iconColor,
            size: AireIconSizes.iconXl,
          ),
          AireSpacing.horizontalSpaceSm,

          // Contenido (label y/o descripción)
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: AireTextStyles.bodyLargeSemibold.copyWith(
                      color: config.textColor,
                    ),
                  ),
                if (label != null && description != null)
                  AireSpacing.verticalSpace2xs,
                if (description != null)
                  Text(
                    description!,
                    style: AireTextStyles.bodyMediumRegular.copyWith(
                      color: config.textColor,
                    ),
                  ),
              ],
            ),
          ),

          // Botón de cerrar (opcional)
          if (showCloseButton) ...[
            AireSpacing.horizontalSpaceSm,
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                color: config.textColor,
                size: AireIconSizes.iconMd,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
