import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para la posición de la etiqueta
enum SwitchLabelPlacement {
  /// Etiqueta al inicio (izquierda)
  start,

  /// Etiqueta al final (derecha)
  end,
}

/// Widget de switch (toggle) atom que soporta múltiples estados
///
/// Estados soportados:
/// - On (encendido)
/// - Off (apagado)
/// - Disabled (deshabilitado)
/// - Focused (efecto al recibir foco)
///
/// Ejemplo de uso:
/// ```dart
/// AireSwitch(
///   label: 'Texto toggle',
///   value: true,
///   onChanged: (value) => setState(() => isEnabled = value),
/// )
/// ```
class AireSwitch extends StatefulWidget {
  /// Texto de la etiqueta del switch
  final String label;

  /// Valor actual del switch (true = ON, false = OFF)
  final bool value;

  /// Callback cuando el valor cambia
  final ValueChanged<bool>? onChanged;

  /// Si el switch está habilitado
  final bool enabled;

  /// Posición de la etiqueta (start o end)
  final SwitchLabelPlacement labelPlacement;

  const AireSwitch({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.labelPlacement = SwitchLabelPlacement.end,
  });

  @override
  State<AireSwitch> createState() => _AireSwitchState();
}

class _AireSwitchState extends State<AireSwitch> {
  bool _isFocused = false;

  Color _getTrackColor() {
    if (!widget.enabled) {
      return AireColors.neutral500.withOpacity(0.45);
    }

    if (widget.value) {
      return AireColors.primary400;
    } else {
      return AireColors.primary200;
    }
  }

  Color _getThumbBorderColor() {
    if (!widget.enabled) {
      return AireColors.neutral500;
    }

    if (_isFocused) {
      return AireColors.secondary400;
    }

    if (widget.value) {
      return AireColors.primary400;
    } else {
      return AireColors.primary200;
    }
  }

  Color _getTrackBorderColor() {
    if (!widget.enabled) {
      return Colors.transparent;
    }

    if (_isFocused) {
      return AireColors.secondary400;
    }

    return Colors.transparent;
  }

  Color _getLabelColor() {
    if (!widget.enabled) {
      return AireColors.neutral400;
    }

    return AireColors.neutral700;
  }

  Widget _buildSwitch() {
    final isEnabled = widget.enabled && widget.onChanged != null;

    return GestureDetector(
      onTap: isEnabled ? () => widget.onChanged!(!widget.value) : null,
      child: Focus(
        onFocusChange:
            isEnabled ? (focused) => setState(() => _isFocused = focused) : null,
        child: Opacity(
          opacity: widget.enabled ? 1.0 : 0.45,
          child: Container(
            width: 48,
            height: 24,
            decoration: BoxDecoration(
              color: _getTrackColor(),
              borderRadius: BorderRadius.circular(30),
              border: _isFocused
                  ? Border.all(
                      color: _getTrackBorderColor(),
                      width: 2,
                    )
                  : null,
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment:
                  widget.value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _getThumbBorderColor(),
                    width: _isFocused ? 2 : 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      widget.label,
      style: AireTextStyles.bodyMediumRegular.copyWith(
        color: _getLabelColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelPlacement == SwitchLabelPlacement.start) ...[
          _buildLabel(),
          AireSpacing.horizontalSpaceXs,
        ],
        _buildSwitch(),
        if (widget.labelPlacement == SwitchLabelPlacement.end) ...[
          AireSpacing.horizontalSpaceXs,
          _buildLabel(),
        ],
      ],
    );
  }
}
