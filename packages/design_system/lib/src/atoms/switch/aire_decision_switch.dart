import 'package:flutter/material.dart';

/// Widget de decision switch atom con textos "Sí" y "No"
///
/// Este switch muestra opciones de decisión con etiquetas internas
/// que indican "Sí" (cuando está a la izquierda) y "No" (cuando está a la derecha)
///
/// Estados soportados:
/// - Selected (Sí seleccionado)
/// - Unselected (No seleccionado)
/// - Disabled (deshabilitado)
/// - Focused (efecto al recibir foco)
///
/// Ejemplo de uso:
/// ```dart
/// AireDecisionSwitch(
///   label: 'Texto toggle',
///   value: true, // true = Sí, false = No
///   onChanged: (value) => setState(() => accepted = value),
/// )
/// ```
class AireDecisionSwitch extends StatefulWidget {
  /// Texto de la etiqueta del switch
  final String label;

  /// Valor actual del switch (true = Sí, false = No)
  final bool value;

  /// Callback cuando el valor cambia
  final ValueChanged<bool>? onChanged;

  /// Si el switch está habilitado
  final bool enabled;

  /// Texto para la opción afirmativa (por defecto "Sí")
  final String yesText;

  /// Texto para la opción negativa (por defecto "No")
  final String noText;

  const AireDecisionSwitch({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.yesText = 'Sí',
    this.noText = 'No',
  });

  @override
  State<AireDecisionSwitch> createState() => _AireDecisionSwitchState();
}

class _AireDecisionSwitchState extends State<AireDecisionSwitch> {
  bool _isFocused = false;

  Color _getBorderColor() {
    if (!widget.enabled) {
      return const Color(0xFFD5D5D5); // Neutral 300
    }

    if (_isFocused) {
      return const Color(0xFF00BEA5); // Secondary 400
    }

    return const Color(0xFF698BFF); // Primary 300
  }

  Color _getSelectedSideColor() {
    if (!widget.enabled) {
      return const Color(0xFFAAAAAA); // Neutral 400
    }

    return const Color(0xFF2D59F0); // Primary 400
  }

  Color _getSelectedTextColor() {
    return Colors.white;
  }

  Color _getUnselectedTextColor() {
    if (!widget.enabled) {
      return const Color(0xFFD5D5D5); // Neutral 300
    }

    return const Color(0xFF6B6B6B); // Neutral 500
  }

  Color _getLabelColor() {
    if (!widget.enabled) {
      return const Color(0xFFAAAAAA); // Neutral 400
    }

    return const Color(0xFF2A2A2A); // Neutral 700
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.enabled && widget.onChanged != null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decision switch container
        Focus(
          onFocusChange:
              isEnabled ? (focused) => setState(() => _isFocused = focused) : null,
          child: GestureDetector(
            onTap: isEnabled ? () => widget.onChanged!(!widget.value) : null,
            child: Container(
              width: 70,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: _getBorderColor(),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  // Selected side background
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    left: widget.value ? 0 : 35,
                    top: 0,
                    bottom: 0,
                    width: 35,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getSelectedSideColor(),
                        borderRadius: BorderRadius.horizontal(
                          left: widget.value
                              ? const Radius.circular(4)
                              : Radius.zero,
                          right: !widget.value
                              ? const Radius.circular(4)
                              : Radius.zero,
                        ),
                      ),
                    ),
                  ),

                  // "Sí" text
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 35,
                    child: Center(
                      child: Text(
                        widget.yesText,
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 16 / 14,
                          color: widget.value
                              ? _getSelectedTextColor()
                              : _getUnselectedTextColor(),
                        ),
                      ),
                    ),
                  ),

                  // "No" text
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    width: 35,
                    child: Center(
                      child: Text(
                        widget.noText,
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 16 / 14,
                          color: !widget.value
                              ? _getSelectedTextColor()
                              : _getUnselectedTextColor(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Label
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 16 / 14,
            color: _getLabelColor(),
          ),
        ),
      ],
    );
  }
}
