import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los tamaños de icon button
enum IconButtonSize {
  xsmall,
  small,
  medium,
  large,
}

/// Configuración de tamaño para cada variante de icon button
class _IconButtonSizeConfig {
  final double padding;
  final double iconSize;

  const _IconButtonSizeConfig({
    required this.padding,
    required this.iconSize,
  });

  static _IconButtonSizeConfig fromSize(IconButtonSize size) {
    switch (size) {
      case IconButtonSize.xsmall:
        return const _IconButtonSizeConfig(
          padding: 4,
          iconSize: 12,
        );
      case IconButtonSize.small:
        return const _IconButtonSizeConfig(
          padding: 4,
          iconSize: 14,
        );
      case IconButtonSize.medium:
        return const _IconButtonSizeConfig(
          padding: 8,
          iconSize: 16,
        );
      case IconButtonSize.large:
        return const _IconButtonSizeConfig(
          padding: 12,
          iconSize: 24,
        );
    }
  }
}

/// Widget de icon button atom con múltiples tamaños
///
/// Soporta 4 tamaños: Xsmall, Small, Medium, Large
/// Soporta estados: Default, Hover, Pressed, Focus, Disabled
///
/// Ejemplo de uso:
/// ```dart
/// AireIconButton(
///   icon: Icons.home,
///   size: IconButtonSize.medium,
///   onPressed: () => print('Pressed'),
/// )
/// ```
class AireIconButton extends StatefulWidget {
  /// Ícono a mostrar
  final IconData icon;

  /// Tamaño del botón (xsmall, small, medium, large)
  final IconButtonSize size;

  /// Callback cuando se presiona el botón
  final VoidCallback? onPressed;

  /// Si el botón está habilitado
  final bool enabled;

  /// Color del ícono (por defecto Primary #2D59F0)
  final Color? iconColor;

  /// Color de fondo en hover (por defecto #F6F6F6)
  final Color? hoverColor;

  /// Color de fondo en pressed (por defecto #F0F0F0)
  final Color? pressedColor;

  /// Color del borde en focus (por defecto Secondary #00BEA5)
  final Color? focusColor;

  const AireIconButton({
    super.key,
    required this.icon,
    this.size = IconButtonSize.medium,
    this.onPressed,
    this.enabled = true,
    this.iconColor,
    this.hoverColor,
    this.pressedColor,
    this.focusColor,
  });

  @override
  State<AireIconButton> createState() => _AireIconButtonState();
}

class _AireIconButtonState extends State<AireIconButton> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = _IconButtonSizeConfig.fromSize(widget.size);
    final isEnabled = widget.enabled && widget.onPressed != null;

    // Colores
    final Color iconColor = isEnabled
        ? (widget.iconColor ?? AireColors.primary400)
        : AireColors.neutral400;

    final Color hoverColor = widget.hoverColor ?? AireColors.neutral50;
    final Color pressedColor = widget.pressedColor ?? AireColors.neutral100;
    final Color focusColor = widget.focusColor ?? AireColors.secondary400;

    // Determinar color de fondo según estado
    Color? backgroundColor;
    if (isEnabled) {
      if (_isPressed) {
        backgroundColor = pressedColor;
      } else if (_isHovered) {
        backgroundColor = hoverColor;
      } else if (_isFocused) {
        backgroundColor = hoverColor;
      }
    }

    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) {
        if (isEnabled) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (isEnabled) {
          setState(() => _isHovered = false);
        }
      },
      child: Focus(
        onFocusChange: (focused) {
          if (isEnabled) {
            setState(() => _isFocused = focused);
          }
        },
        child: GestureDetector(
          onTapDown: (_) {
            if (isEnabled) {
              setState(() => _isPressed = true);
            }
          },
          onTapUp: (_) {
            if (isEnabled) {
              setState(() => _isPressed = false);
            }
          },
          onTapCancel: () {
            if (isEnabled) {
              setState(() => _isPressed = false);
            }
          },
          onTap: isEnabled ? widget.onPressed : null,
          child: Container(
            padding: EdgeInsets.all(sizeConfig.padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: AireBorderRadius.borderCircular,
              border: _isFocused && isEnabled
                  ? Border.all(
                      color: focusColor,
                      width: 2,
                    )
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: sizeConfig.iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
