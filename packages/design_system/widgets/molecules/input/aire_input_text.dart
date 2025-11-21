import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los diferentes estados de validación del Input
enum InputStatus {
  normal,
  success,
  warning,
  error,
}

/// Configuración de colores e íconos para cada estado del Input
class _InputConfig {
  final Color borderColor;
  final Color textColor;
  final IconData? icon;

  const _InputConfig({
    required this.borderColor,
    required this.textColor,
    this.icon,
  });

  static _InputConfig fromStatus(InputStatus status) {
    switch (status) {
      case InputStatus.normal:
        return _InputConfig(
          borderColor: AireColors.neutral300,
          textColor: AireColors.neutral700,
        );
      case InputStatus.success:
        return _InputConfig(
          borderColor: AireColors.success400,
          textColor: AireColors.neutral700,
          icon: Icons.check_circle,
        );
      case InputStatus.warning:
        return _InputConfig(
          borderColor: AireColors.warning500,
          textColor: AireColors.neutral700,
          icon: Icons.warning,
        );
      case InputStatus.error:
        return _InputConfig(
          borderColor: AireColors.error400,
          textColor: AireColors.neutral700,
          icon: Icons.cancel,
        );
    }
  }

  Color get iconColor {
    return borderColor;
  }
}

/// Widget de Input Text con soporte para múltiples estados y variantes
///
/// Soporta 4 estados de validación: Normal, Success, Warning, Error
/// Características:
/// - Label flotante que aparece al tener foco o valor
/// - Ícono de estado opcional (success, warning, error)
/// - Ícono personalizado opcional
/// - Estados: default, hover, focused, disabled
/// - Cambio de borde según estado
class AireInputText extends StatefulWidget {
  /// Texto del label flotante (aparece cuando hay foco o valor)
  final String? label;

  /// Texto del placeholder (hint text)
  final String placeholder;

  /// Controlador del texto
  final TextEditingController? controller;

  /// Callback cuando el texto cambia
  final ValueChanged<String>? onChanged;

  /// Si el input está habilitado
  final bool enabled;

  /// Estado de validación del input
  final InputStatus status;

  /// Ícono personalizado a mostrar al final del input (opcional)
  final Widget? suffixIcon;

  /// Ancho del widget (opcional, por defecto usa el ancho disponible)
  final double? width;

  /// Padding personalizado (opcional)
  final EdgeInsetsGeometry? padding;

  const AireInputText({
    super.key,
    this.label,
    required this.placeholder,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.status = InputStatus.normal,
    this.suffixIcon,
    this.width,
    this.padding,
  });

  @override
  State<AireInputText> createState() => _AireInputTextState();
}

class _AireInputTextState extends State<AireInputText> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;

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
  bool get _showFloatingLabel => _isFocused || _hasValue;

  Color get _borderColor {
    if (!widget.enabled) {
      return AireColors.neutral200;
    }

    final config = _InputConfig.fromStatus(widget.status);

    if (_isFocused && widget.status == InputStatus.normal) {
      return AireColors.primary400; // Primary color cuando está focused
    }

    return config.borderColor;
  }

  double get _borderWidth {
    return (_isFocused && widget.status == InputStatus.normal) ? 2.0 : 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final config = _InputConfig.fromStatus(widget.status);

    return SizedBox(
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Input field
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: widget.enabled
                  ? AireColors.white
                  : AireColors.neutral100,
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              borderRadius: AireBorderRadius.borderXs,
            ),
            child: Row(
              children: [
                // Text field
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    onChanged: (value) {
                      setState(() {}); // Para actualizar el label flotante
                      widget.onChanged?.call(value);
                    },
                    style: AireTextStyles.bodyMediumRegular.copyWith(
                      color: widget.enabled
                          ? config.textColor
                          : AireColors.neutral400,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      hintStyle: AireTextStyles.placeholderMedium.copyWith(
                        color: AireColors.neutral500,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AireSpacing.spacingMd,
                        vertical: AireSpacing.spacingXs,
                      ),
                      isDense: true,
                    ),
                  ),
                ),

                // Suffix icon (status icon or custom icon)
                if (widget.status != InputStatus.normal && config.icon != null)
                  Padding(
                    padding: EdgeInsets.only(right: AireSpacing.spacingMd),
                    child: Icon(
                      config.icon,
                      size: AireIconSizes.iconSm,
                      color: config.iconColor,
                    ),
                  )
                else if (widget.suffixIcon != null)
                  Padding(
                    padding: EdgeInsets.only(right: AireSpacing.spacingMd),
                    child: SizedBox(
                      width: AireIconSizes.iconSm,
                      height: AireIconSizes.iconSm,
                      child: widget.suffixIcon,
                    ),
                  ),
              ],
            ),
          ),

          // Floating label
          if (_showFloatingLabel && widget.label != null)
            Positioned(
              left: 12,
              top: -6,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AireSpacing.spacing2xs),
                color: widget.enabled
                    ? AireColors.white
                    : AireColors.neutral100,
                child: Text(
                  widget.label!,
                  style: AireTextStyles.labelSmall.copyWith(
                    color: AireColors.neutral500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
