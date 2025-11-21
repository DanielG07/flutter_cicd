import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Widget de radio button atom que soporta múltiples estados
///
/// Estados soportados:
/// - Default (no seleccionado)
/// - Checked (seleccionado)
/// - Disabled (deshabilitado)
/// - Hover (efecto al pasar el mouse)
/// - Focused (efecto al recibir foco)
///
/// Ejemplo de uso:
/// ```dart
/// AireRadioButton<String>(
///   label: 'Text input',
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
/// )
/// ```
class AireRadioButton<T> extends StatefulWidget {
  /// Texto de la etiqueta del radio button
  final String label;

  /// Valor de este radio button
  final T value;

  /// Valor actualmente seleccionado del grupo
  final T? groupValue;

  /// Callback cuando el valor cambia
  final ValueChanged<T?>? onChanged;

  /// Si el radio button está habilitado
  final bool enabled;

  const AireRadioButton({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.enabled = true,
  });

  bool get isSelected => value == groupValue;

  @override
  State<AireRadioButton<T>> createState() => _AireRadioButtonState<T>();
}

class _AireRadioButtonState<T> extends State<AireRadioButton<T>> {
  bool _isHovered = false;
  bool _isFocused = false;

  Color _getBorderColor() {
    if (!widget.enabled) {
      return AireColors.neutral300;
    }

    if (_isFocused) {
      return AireColors.secondary400;
    }

    if (widget.isSelected) {
      return AireColors.primary400;
    }

    return AireColors.neutral600;
  }

  Color _getInnerCircleColor() {
    if (!widget.enabled) {
      return AireColors.neutral400;
    }

    return AireColors.primary400;
  }

  Color _getLabelColor() {
    if (!widget.enabled) {
      return AireColors.neutral400;
    }

    return AireColors.neutral700;
  }

  Color _getHoverBackgroundColor() {
    return AireColors.primary50;
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.enabled && widget.onChanged != null;

    return MouseRegion(
      onEnter: isEnabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: isEnabled ? (_) => setState(() => _isHovered = false) : null,
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: Focus(
        onFocusChange:
            isEnabled ? (focused) => setState(() => _isFocused = focused) : null,
        child: GestureDetector(
          onTap: isEnabled ? () => widget.onChanged!(widget.value) : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Radio button container with hover background
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _isHovered && isEnabled
                      ? _getHoverBackgroundColor()
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _getBorderColor(),
                        width: 2,
                      ),
                    ),
                    child: widget.isSelected
                        ? Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _getInnerCircleColor(),
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(width: AireSpacing.spacing2xs),

              // Label
              Text(
                widget.label,
                style: AireTextStyles.bodyMediumRegular.copyWith(
                  color: _getLabelColor(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
