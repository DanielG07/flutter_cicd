import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para las variantes de botón
enum ButtonVariant {
  primary,
  secondary,
  tertiary,
  ghost,
}

/// Enum para los tamaños de botón
enum ButtonSize {
  large,
  medium,
  small,
  xsmall,
}

/// Configuración de estilo para cada variante de botón
class _ButtonVariantConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const _ButtonVariantConfig({
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

  static _ButtonVariantConfig fromVariant(ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primary:
        return _ButtonVariantConfig(
          backgroundColor: AireColors.primary400,
          textColor: AireColors.white,
          borderColor: AireColors.primary400,
        );
      case ButtonVariant.secondary:
        return _ButtonVariantConfig(
          backgroundColor: AireColors.white,
          textColor: AireColors.primary400,
          borderColor: AireColors.primary400,
        );
      case ButtonVariant.tertiary:
        return _ButtonVariantConfig(
          backgroundColor: AireColors.primary50,
          textColor: AireColors.primary400,
        );
      case ButtonVariant.ghost:
        return _ButtonVariantConfig(
          backgroundColor: Colors.transparent,
          textColor: AireColors.primary400,
        );
    }
  }
}

/// Configuración de tamaño para cada variante de botón
class _ButtonSizeConfig {
  final double height;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  const _ButtonSizeConfig({
    required this.height,
    required this.padding,
    required this.textStyle,
  });

  static _ButtonSizeConfig fromSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return _ButtonSizeConfig(
          height: 64,
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacing2xl,
            vertical: AireSpacing.spacingLg - 4,
          ),
          textStyle: AireTextStyles.buttonLarge,
        );
      case ButtonSize.medium:
        return _ButtonSizeConfig(
          height: 48,
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingXl,
            vertical: AireSpacing.spacingMd,
          ),
          textStyle: AireTextStyles.buttonMedium,
        );
      case ButtonSize.small:
        return _ButtonSizeConfig(
          height: 40,
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingLg,
            vertical: AireSpacing.spacingSm,
          ),
          textStyle: AireTextStyles.buttonSmall,
        );
      case ButtonSize.xsmall:
        return _ButtonSizeConfig(
          height: 28,
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingSm,
            vertical: AireSpacing.spacing2xs + 2,
          ),
          textStyle: AireTextStyles.buttonExtraSmall,
        );
    }
  }
}

/// Widget de botón atom con múltiples variantes y tamaños
///
/// Soporta 4 variantes: Primary, Secondary, Tertiary, Ghost
/// Soporta 4 tamaños: Large, Medium, Small, xSmall
///
/// Ejemplo de uso:
/// ```dart
/// AireButton(
///   text: 'Button',
///   variant: ButtonVariant.primary,
///   size: ButtonSize.medium,
///   onPressed: () => print('Pressed'),
/// )
/// ```
class AireButton extends StatelessWidget {
  /// Texto del botón
  final String text;

  /// Variante del botón (primary, secondary, tertiary, ghost)
  final ButtonVariant variant;

  /// Tamaño del botón (large, medium, small, xsmall)
  final ButtonSize size;

  /// Callback cuando se presiona el botón
  final VoidCallback? onPressed;

  /// Si el botón está habilitado
  final bool enabled;

  /// Ancho del botón (opcional, por defecto se ajusta al contenido)
  final double? width;

  /// Widget opcional para mostrar antes del texto (ej: ícono)
  final Widget? leading;

  /// Widget opcional para mostrar después del texto (ej: ícono)
  final Widget? trailing;

  const AireButton({
    super.key,
    required this.text,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.enabled = true,
    this.width,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final variantConfig = _ButtonVariantConfig.fromVariant(variant);
    final sizeConfig = _ButtonSizeConfig.fromSize(size);

    final isEnabled = enabled && onPressed != null;

    // Disabled colors based on variant per Figma specs
    final disabledBackgroundColor = variant == ButtonVariant.primary
        ? AireColors.primary200
        : AireColors.neutral50;
    final disabledTextColor = variant == ButtonVariant.primary
        ? AireColors.white
        : AireColors.neutral400;

    return SizedBox(
      width: width,
      height: sizeConfig.height,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? variantConfig.backgroundColor
              : disabledBackgroundColor,
          foregroundColor: isEnabled
              ? variantConfig.textColor
              : disabledTextColor,
          disabledBackgroundColor: disabledBackgroundColor,
          disabledForegroundColor: disabledTextColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: sizeConfig.padding,
          shape: RoundedRectangleBorder(
            borderRadius: AireBorderRadius.borderCircular,
            side: variantConfig.borderColor != null
                ? BorderSide(
                    color: isEnabled
                        ? variantConfig.borderColor!
                        : AireColors.neutral200,
                    width: 1,
                  )
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[
              leading!,
              AireSpacing.horizontalSpaceXs,
            ],
            Text(
              text,
              style: sizeConfig.textStyle,
              textAlign: TextAlign.center,
            ),
            if (trailing != null) ...[
              AireSpacing.horizontalSpaceXs,
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
