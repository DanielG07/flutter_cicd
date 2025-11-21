import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los diferentes tamaños del InputSearch
enum InputSearchSize {
  defaultSize,
  small,
  xsmall,
}

/// Configuración de tamaños para cada variante del InputSearch
class _InputSearchConfig {
  final double height;
  final double iconSize;
  final double fontSize;
  final double lineHeight;
  final EdgeInsetsGeometry padding;

  const _InputSearchConfig({
    required this.height,
    required this.iconSize,
    required this.fontSize,
    required this.lineHeight,
    required this.padding,
  });

  static _InputSearchConfig fromSize(InputSearchSize size) {
    switch (size) {
      case InputSearchSize.defaultSize:
        return _InputSearchConfig(
          height: 48,
          iconSize: AireIconSizes.iconMd,
          fontSize: 16,
          lineHeight: 1.5, // 24/16
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingMd,
            vertical: AireSpacing.spacingSm,
          ),
        );
      case InputSearchSize.small:
        return _InputSearchConfig(
          height: 40,
          iconSize: AireIconSizes.iconSm,
          fontSize: 14,
          lineHeight: 1.43, // 20/14
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingMd,
            vertical: AireSpacing.spacingXs,
          ),
        );
      case InputSearchSize.xsmall:
        return _InputSearchConfig(
          height: 24,
          iconSize: AireIconSizes.iconSm,
          fontSize: 12,
          lineHeight: 1.33, // 16/12
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingMd,
            vertical: AireSpacing.spacing2xs,
          ),
        );
    }
  }
}

/// Widget de Input Search con soporte para múltiples tamaños y estados
///
/// Soporta 3 tamaños: Default (48px), Small (40px), Xsmall (24px)
/// Características:
/// - Ícono de búsqueda siempre visible en el lado izquierdo
/// - Ícono de cerrar/limpiar cuando hay valor (lado derecho)
/// - Estados: default, hover, focused, disabled
/// - Cambio de borde según estado
/// - Placeholder personalizable
class AireInputSearch extends StatefulWidget {
  /// Texto del placeholder (hint text)
  final String placeholder;

  /// Controlador del texto
  final TextEditingController? controller;

  /// Callback cuando el texto cambia
  final ValueChanged<String>? onChanged;

  /// Callback cuando se presiona el botón de limpiar
  final VoidCallback? onClear;

  /// Callback cuando se envía el formulario (submit)
  final ValueChanged<String>? onSubmitted;

  /// Si el input está habilitado
  final bool enabled;

  /// Tamaño del input
  final InputSearchSize size;

  /// Ancho del widget (opcional, por defecto usa el ancho disponible)
  final double? width;

  const AireInputSearch({
    super.key,
    this.placeholder = 'Buscar...',
    this.controller,
    this.onChanged,
    this.onClear,
    this.onSubmitted,
    this.enabled = true,
    this.size = InputSearchSize.small,
    this.width,
  });

  @override
  State<AireInputSearch> createState() => _AireInputSearchState();
}

class _AireInputSearchState extends State<AireInputSearch> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  bool get _hasValue => _controller.text.isNotEmpty;

  Color get _borderColor {
    if (!widget.enabled) {
      return AireColors.neutral200;
    }

    if (_isFocused) {
      if (_hasValue) {
        return AireColors.primary400; // Primary color cuando tiene valor
      }
      return AireColors.secondary400; // Secondary color cuando está vacío
    }

    if (_isHovered) {
      return AireColors.neutral400; // Darker grey on hover
    }

    return AireColors.neutral300; // Default grey
  }

  double get _borderWidth {
    return _isFocused ? 2.0 : 1.0;
  }

  Color get _backgroundColor {
    return widget.enabled
        ? AireColors.white
        : AireColors.neutral100;
  }

  Color get _textColor {
    return widget.enabled
        ? AireColors.neutral700
        : AireColors.neutral400;
  }

  Color get _placeholderColor {
    if (!widget.enabled) {
      return AireColors.neutral400;
    }
    return widget.size == InputSearchSize.xsmall
        ? AireColors.primary200
        : AireColors.neutral400;
  }

  Color get _iconColor {
    if (!widget.enabled) {
      return AireColors.neutral400;
    }
    return AireColors.neutral600; // Neutral 600
  }

  void _handleClear() {
    _controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
    setState(() {});
  }

  TextStyle _getTextStyle(_InputSearchConfig config) {
    switch (widget.size) {
      case InputSearchSize.defaultSize:
        return AireTextStyles.bodyLargeRegular;
      case InputSearchSize.small:
        return AireTextStyles.bodyMediumRegular;
      case InputSearchSize.xsmall:
        return AireTextStyles.bodySmallRegular;
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = _InputSearchConfig.fromSize(widget.size);

    return SizedBox(
      width: widget.width,
      child: MouseRegion(
        onEnter: (_) {
          if (widget.enabled) {
            setState(() {
              _isHovered = true;
            });
          }
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Container(
          height: config.height,
          decoration: BoxDecoration(
            color: _backgroundColor,
            border: Border.all(
              color: _borderColor,
              width: _borderWidth,
            ),
            borderRadius: AireBorderRadius.borderXs,
          ),
          child: Row(
            children: [
              // Search icon
              Padding(
                padding: EdgeInsets.only(left: config.padding.horizontal / 2),
                child: Icon(
                  Icons.search,
                  size: config.iconSize,
                  color: _iconColor,
                ),
              ),
              AireSpacing.horizontalSpaceXs,

              // Text field
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  onChanged: (value) {
                    setState(() {}); // Para actualizar el botón de clear
                    widget.onChanged?.call(value);
                  },
                  onSubmitted: widget.onSubmitted,
                  style: _getTextStyle(config).copyWith(
                    color: _textColor,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: _getTextStyle(config).copyWith(
                      color: _placeholderColor,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),

              // Clear button (only when there's a value and enabled)
              if (_hasValue && widget.enabled) ...[
                AireSpacing.horizontalSpaceXs,
                GestureDetector(
                  onTap: _handleClear,
                  child: Container(
                    width: config.iconSize,
                    height: config.iconSize,
                    decoration: BoxDecoration(
                      color: AireColors.neutral200,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: config.iconSize * 0.625, // ~10px for 16px icon
                      color: AireColors.neutral500,
                    ),
                  ),
                ),
                SizedBox(width: config.padding.horizontal / 2),
              ] else
                SizedBox(width: config.padding.horizontal / 2),
            ],
          ),
        ),
      ),
    );
  }
}
