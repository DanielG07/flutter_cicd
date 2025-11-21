import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para el estado del checkbox
enum CheckboxState {
  /// Checkbox no seleccionado
  unchecked,

  /// Checkbox seleccionado
  checked,

  /// Checkbox en estado indeterminado (parcialmente seleccionado)
  indeterminate,
}

/// Widget de checkbox atom que soporta múltiples estados
///
/// Estados soportados:
/// - Default (unchecked)
/// - Checked (seleccionado)
/// - Indeterminate (parcialmente seleccionado)
/// - Disabled (deshabilitado)
/// - Hover (efecto al pasar el mouse)
/// - Focused (efecto al recibir foco)
///
/// Ejemplo de uso:
/// ```dart
/// AireCheckbox(
///   label: 'Text checkbox',
///   state: CheckboxState.unchecked,
///   value: false,
///   onChanged: (value) => print('Changed to: $value'),
/// )
/// ```
class AireCheckbox extends StatefulWidget {
  /// Texto de la etiqueta del checkbox
  final String label;

  /// Estado del checkbox (unchecked, checked, indeterminate)
  final CheckboxState state;

  /// Valor actual del checkbox
  final bool value;

  /// Callback cuando el valor cambia
  final ValueChanged<bool>? onChanged;

  /// Si el checkbox está habilitado
  final bool enabled;

  const AireCheckbox({
    super.key,
    required this.label,
    this.state = CheckboxState.unchecked,
    required this.value,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<AireCheckbox> createState() => _AireCheckboxState();
}

class _AireCheckboxState extends State<AireCheckbox> {
  bool _isHovered = false;
  bool _isFocused = false;

  Color _getBorderColor() {
    if (!widget.enabled) {
      return AireColors.neutral300;
    }

    if (_isFocused) {
      return AireColors.secondary400;
    }

    return AireColors.neutral600;
  }

  Color _getBackgroundColor() {
    if (!widget.enabled) {
      if (widget.state == CheckboxState.checked ||
          widget.state == CheckboxState.indeterminate) {
        return AireColors.primary100;
      }
      return AireColors.neutral200;
    }

    if (widget.state == CheckboxState.checked ||
        widget.state == CheckboxState.indeterminate) {
      return AireColors.primary400;
    }

    return Colors.transparent;
  }

  Color _getCheckColor() {
    if (!widget.enabled) {
      return AireColors.neutral500;
    }

    return AireColors.white;
  }

  Color _getLabelColor() {
    if (!widget.enabled) {
      if (widget.state == CheckboxState.checked ||
          widget.state == CheckboxState.indeterminate) {
        return AireColors.neutral500;
      }
      return AireColors.neutral400;
    }

    return AireColors.neutral700;
  }

  Widget _buildCheckIcon() {
    if (widget.state == CheckboxState.indeterminate) {
      return Container(
        width: 10,
        height: 2,
        decoration: BoxDecoration(
          color: _getCheckColor(),
          borderRadius: BorderRadius.circular(1),
        ),
      );
    } else if (widget.state == CheckboxState.checked) {
      return Icon(
        Icons.check,
        size: 12,
        color: _getCheckColor(),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.enabled && widget.onChanged != null;

    return MouseRegion(
      onEnter: isEnabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: isEnabled ? (_) => setState(() => _isHovered = false) : null,
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: Focus(
        onFocusChange: isEnabled ? (focused) => setState(() => _isFocused = focused) : null,
        child: GestureDetector(
          onTap: isEnabled
              ? () => widget.onChanged!(!widget.value)
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Label
              Text(
                widget.label,
                style: AireTextStyles.bodyMediumRegular.copyWith(
                  color: _getLabelColor(),
                ),
              ),
              AireSpacing.horizontalSpaceXs,

              // Checkbox container
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _isHovered && isEnabled
                      ? AireColors.primary50
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      border: Border.all(
                        color: _getBorderColor(),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: _buildCheckIcon(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
