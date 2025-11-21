import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los tipos de tag
enum TagType {
  category,
  status,
}

/// Enum para los tamaños de tag
enum TagSize {
  medium,
  small,
}

/// Enum para las variantes de color de status tag
enum StatusTagVariant {
  active,
  pause,
  cancel,
  register,
  defaultVariant,
}

/// Configuración de color para status tag
class _StatusTagColorConfig {
  final Color backgroundColor;
  final Color textColor;

  const _StatusTagColorConfig({
    required this.backgroundColor,
    required this.textColor,
  });

  static _StatusTagColorConfig fromVariant(StatusTagVariant variant) {
    switch (variant) {
      case StatusTagVariant.active:
        return _StatusTagColorConfig(
          backgroundColor: AireColors.success100,
          textColor: AireColors.success500,
        );
      case StatusTagVariant.pause:
        return _StatusTagColorConfig(
          backgroundColor: AireColors.warning100,
          textColor: AireColors.warning500,
        );
      case StatusTagVariant.cancel:
        return _StatusTagColorConfig(
          backgroundColor: AireColors.error100,
          textColor: AireColors.error500,
        );
      case StatusTagVariant.register:
        return _StatusTagColorConfig(
          backgroundColor: AireColors.info100,
          textColor: AireColors.info500,
        );
      case StatusTagVariant.defaultVariant:
        return _StatusTagColorConfig(
          backgroundColor: AireColors.neutral100,
          textColor: AireColors.neutral700,
        );
    }
  }
}

/// Configuración de tamaño para tag
class _TagSizeConfig {
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final double lineHeight;
  final double borderRadius;
  final double iconSize;
  final double statusIconSize;

  const _TagSizeConfig({
    required this.padding,
    required this.fontSize,
    required this.lineHeight,
    required this.borderRadius,
    required this.iconSize,
    required this.statusIconSize,
  });

  static _TagSizeConfig fromSize(TagSize size, TagType type) {
    switch (size) {
      case TagSize.medium:
        return _TagSizeConfig(
          padding: type == TagType.category
              ? EdgeInsets.symmetric(horizontal: AireSpacing.spacingXs, vertical: AireSpacing.spacing2xs)
              : EdgeInsets.symmetric(horizontal: AireSpacing.spacingMd, vertical: AireSpacing.spacing2xs),
          fontSize: type == TagType.category ? 12 : 14,
          lineHeight: type == TagType.category ? 16 : 20,
          borderRadius: AireBorderRadius.radiusXs,
          iconSize: AireIconSizes.iconXs,
          statusIconSize: AireIconSizes.iconMd,
        );
      case TagSize.small:
        return _TagSizeConfig(
          padding: EdgeInsets.symmetric(horizontal: AireSpacing.spacingXs, vertical: 0),
          fontSize: 12,
          lineHeight: 16,
          borderRadius: AireBorderRadius.radius2xs,
          iconSize: 10,
          statusIconSize: AireIconSizes.iconSm,
        );
    }
  }
}

/// Widget de tag atom con múltiples tipos y variantes
///
/// Soporta 2 tipos: Category (con ícono), Status (con/sin ícono)
/// Soporta 2 tamaños: Medium, Small
/// Status tag soporta 5 variantes de color
///
/// Ejemplo de uso:
/// ```dart
/// // Category tag (con ícono obligatorio)
/// AireTag.category(
///   text: 'Text',
///   icon: Icons.label,
/// )
///
/// // Status tag sin ícono
/// AireTag.status(
///   text: 'Aprobada',
///   variant: StatusTagVariant.active,
/// )
///
/// // Status tag con ícono
/// AireTag.status(
///   text: 'Aprobada',
///   variant: StatusTagVariant.active,
///   icon: Icons.check,
/// )
/// ```
class AireTag extends StatefulWidget {
  /// Tipo de tag (category o status)
  final TagType type;

  /// Texto del tag
  final String text;

  /// Tamaño del tag
  final TagSize size;

  /// Ícono (solo para category tag)
  final IconData? icon;

  /// Variante de color (solo para status tag)
  final StatusTagVariant? statusVariant;

  /// Si el tag tiene foco (muestra borde)
  final bool focused;

  /// Callback cuando se presiona el tag (opcional)
  final VoidCallback? onTap;

  const AireTag._({
    super.key,
    required this.type,
    required this.text,
    this.size = TagSize.medium,
    this.icon,
    this.statusVariant,
    this.focused = false,
    this.onTap,
  });

  /// Constructor para category tag
  const AireTag.category({
    Key? key,
    required String text,
    required IconData icon,
    TagSize size = TagSize.medium,
    bool focused = false,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          type: TagType.category,
          text: text,
          icon: icon,
          size: size,
          focused: focused,
          onTap: onTap,
        );

  /// Constructor para status tag
  const AireTag.status({
    Key? key,
    required String text,
    StatusTagVariant variant = StatusTagVariant.active,
    TagSize size = TagSize.medium,
    IconData? icon,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          type: TagType.status,
          text: text,
          statusVariant: variant,
          icon: icon,
          size: size,
          onTap: onTap,
        );

  @override
  State<AireTag> createState() => _AireTagState();
}

class _AireTagState extends State<AireTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = _TagSizeConfig.fromSize(widget.size, widget.type);

    Widget content;

    if (widget.type == TagType.category) {
      // Category tag: fondo azul, texto blanco, con ícono
      content = Container(
        padding: sizeConfig.padding,
        decoration: BoxDecoration(
          color: AireColors.primary400,
          borderRadius: BorderRadius.circular(sizeConfig.borderRadius),
          border: widget.focused
              ? Border.all(
                  color: AireColors.secondary400,
                  width: 2,
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon ?? Icons.tag,
              size: sizeConfig.iconSize,
              color: AireColors.white,
            ),
            SizedBox(width: AireSpacing.spacing2xs),
            Text(
              widget.text,
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: sizeConfig.fontSize,
                fontWeight: FontWeight.w600,
                height: sizeConfig.lineHeight / sizeConfig.fontSize,
                color: AireColors.white,
              ),
            ),
          ],
        ),
      );
    } else {
      // Status tag: fondo de color según variante, con ícono opcional
      final colorConfig = _StatusTagColorConfig.fromVariant(
        widget.statusVariant ?? StatusTagVariant.defaultVariant,
      );

      content = Container(
        padding: sizeConfig.padding,
        decoration: BoxDecoration(
          color: colorConfig.backgroundColor,
          borderRadius: BorderRadius.circular(sizeConfig.borderRadius),
        ),
        child: widget.icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: sizeConfig.statusIconSize,
                    color: colorConfig.textColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontSize: sizeConfig.fontSize,
                      fontWeight: FontWeight.w400, // Regular
                      height: sizeConfig.lineHeight / sizeConfig.fontSize,
                      color: colorConfig.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                widget.text,
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontSize: sizeConfig.fontSize,
                  fontWeight: FontWeight.w400, // Regular
                  height: sizeConfig.lineHeight / sizeConfig.fontSize,
                  color: colorConfig.textColor,
                ),
                textAlign: TextAlign.center,
              ),
      );
    }

    if (widget.onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Opacity(
            opacity: _isHovered ? 0.9 : 1.0,
            child: content,
          ),
        ),
      );
    }

    return content;
  }
}
