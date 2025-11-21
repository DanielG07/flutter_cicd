import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para las variantes de link
enum LinkVariant {
  inline,
  standalone,
  command,
}

/// Enum para los tamaños de link
enum LinkSize {
  small,
  medium,
  large,
}

/// Configuración de estilo para cada variante de link
class _LinkVariantConfig {
  final bool showUnderline;
  final FontWeight fontWeight;
  final bool iconAtStart;

  const _LinkVariantConfig({
    required this.showUnderline,
    required this.fontWeight,
    required this.iconAtStart,
  });

  static _LinkVariantConfig fromVariant(LinkVariant variant) {
    switch (variant) {
      case LinkVariant.inline:
        return const _LinkVariantConfig(
          showUnderline: true,
          fontWeight: FontWeight.w600, // SemiBold
          iconAtStart: false,
        );
      case LinkVariant.standalone:
        return const _LinkVariantConfig(
          showUnderline: false,
          fontWeight: FontWeight.w600, // SemiBold
          iconAtStart: false,
        );
      case LinkVariant.command:
        return const _LinkVariantConfig(
          showUnderline: false,
          fontWeight: FontWeight.w400, // Regular
          iconAtStart: true,
        );
    }
  }
}

/// Configuración de tamaño para cada variante de link
class _LinkSizeConfig {
  final TextStyle textStyle;
  final double iconSize;

  const _LinkSizeConfig({
    required this.textStyle,
    required this.iconSize,
  });

  static _LinkSizeConfig fromSize(LinkSize size, LinkVariant variant) {
    // Inline tiene lineHeight diferente que standalone/command
    final bool isInline = variant == LinkVariant.inline;

    switch (size) {
      case LinkSize.small:
        return _LinkSizeConfig(
          textStyle: isInline ? AireTextStyles.linkSmall : AireTextStyles.linkSmallStandalone,
          iconSize: AireIconSizes.iconSm,
        );
      case LinkSize.medium:
        return _LinkSizeConfig(
          textStyle: isInline ? AireTextStyles.linkMedium : AireTextStyles.linkMediumStandalone,
          iconSize: AireIconSizes.iconMd,
        );
      case LinkSize.large:
        return _LinkSizeConfig(
          textStyle: isInline ? AireTextStyles.linkLarge : AireTextStyles.linkLargeStandalone,
          iconSize: AireIconSizes.iconLg,
        );
    }
  }
}

/// Widget de link atom con múltiples variantes y tamaños
///
/// Soporta 3 variantes: Inline, Standalone, Command
/// Soporta 3 tamaños: Small, Medium, Large
///
/// Ejemplo de uso:
/// ```dart
/// AireLink(
///   text: 'Click here',
///   variant: LinkVariant.inline,
///   size: LinkSize.medium,
///   onTap: () => print('Tapped'),
/// )
/// ```
class AireLink extends StatelessWidget {
  /// Texto del link
  final String text;

  /// Variante del link (inline, standalone, command)
  final LinkVariant variant;

  /// Tamaño del link (small, medium, large)
  final LinkSize size;

  /// Callback cuando se presiona el link
  final VoidCallback? onTap;

  /// Si el link está habilitado
  final bool enabled;

  /// Widget opcional para ícono personalizado (standalone usa arrow_forward, command usa edit por defecto)
  final Widget? customIcon;

  const AireLink({
    super.key,
    required this.text,
    this.variant = LinkVariant.standalone,
    this.size = LinkSize.medium,
    this.onTap,
    this.enabled = true,
    this.customIcon,
  });

  Widget? _buildIcon(
      _LinkVariantConfig variantConfig, _LinkSizeConfig sizeConfig) {
    if (variant == LinkVariant.inline) return null;

    if (customIcon != null) return customIcon;

    // Ícono por defecto según variante
    IconData iconData;
    if (variant == LinkVariant.standalone) {
      iconData = Icons.arrow_forward;
    } else {
      // command
      iconData = Icons.edit;
    }

    return Icon(
      iconData,
      size: sizeConfig.iconSize,
      color: enabled ? AireColors.primary400 : AireColors.neutral400,
    );
  }

  @override
  Widget build(BuildContext context) {
    final variantConfig = _LinkVariantConfig.fromVariant(variant);
    final sizeConfig = _LinkSizeConfig.fromSize(size, variant);

    final Color textColor =
        enabled ? AireColors.primary400 : AireColors.neutral400;

    final icon = _buildIcon(variantConfig, sizeConfig);

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícono al inicio (command)
            if (icon != null && variantConfig.iconAtStart) ...[
              icon,
              AireSpacing.horizontalSpaceXs,
            ],

            // Texto
            Text(
              text,
              style: sizeConfig.textStyle.copyWith(
                color: textColor,
                decoration: variantConfig.showUnderline
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: textColor,
              ),
            ),

            // Ícono al final (standalone)
            if (icon != null && !variantConfig.iconAtStart) ...[
              AireSpacing.horizontalSpaceXs,
              icon,
            ],
          ],
        ),
      ),
    );
  }
}
