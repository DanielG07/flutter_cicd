import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Widget de Slider simple con un solo valor
///
/// Características:
/// - Valor de 0 a 100 (porcentaje)
/// - Labels personalizables (por defecto 0% - 100%)
/// - Track gris claro con barra activa azul
/// - Thumb circular blanco con borde azul
/// - Ancho configurable
class AireSlider extends StatefulWidget {
  /// Valor actual del slider (0.0 - 100.0)
  final double value;

  /// Callback cuando cambia el valor
  final ValueChanged<double>? onChanged;

  /// Callback cuando termina de cambiar (al soltar)
  final ValueChanged<double>? onChangeEnd;

  /// Label mínimo (por defecto "0%")
  final String? minLabel;

  /// Label máximo (por defecto "100%")
  final String? maxLabel;

  /// Ancho del slider (por defecto 300px)
  final double? width;

  /// Valor mínimo (por defecto 0)
  final double min;

  /// Valor máximo (por defecto 100)
  final double max;

  /// Si muestra los labels
  final bool showLabels;

  /// Si el slider está habilitado
  final bool enabled;

  const AireSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.onChangeEnd,
    this.minLabel,
    this.maxLabel,
    this.width = 300,
    this.min = 0,
    this.max = 100,
    this.showLabels = true,
    this.enabled = true,
  });

  @override
  State<AireSlider> createState() => _AireSliderState();
}

class _AireSliderState extends State<AireSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(AireSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _currentValue = widget.value;
    }
  }

  String get _minLabel => widget.minLabel ?? '${widget.min.toInt()}%';
  String get _maxLabel => widget.maxLabel ?? '${widget.max.toInt()}%';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Slider
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              activeTrackColor: AireColors.primary400,
              inactiveTrackColor: AireColors.primary50,
              thumbColor: AireColors.white,
              overlayColor: AireColors.primary400.withOpacity(0.1),
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 8,
                elevation: 2,
              ),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 16,
              ),
              trackShape: const RoundedRectSliderTrackShape(),
              valueIndicatorColor: AireColors.primary400,
              valueIndicatorTextStyle: AireTextStyles.bodySmallRegular.copyWith(
                color: AireColors.white,
              ),
            ),
            child: Slider(
              value: _currentValue.clamp(widget.min, widget.max),
              min: widget.min,
              max: widget.max,
              onChanged: widget.enabled
                  ? (value) {
                      setState(() {
                        _currentValue = value;
                      });
                      widget.onChanged?.call(value);
                    }
                  : null,
              onChangeEnd: widget.onChangeEnd,
            ),
          ),

          // Labels
          if (widget.showLabels) ...[
            AireSpacing.verticalSpace2xs,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AireSpacing.spacing2xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _minLabel,
                    style: AireTextStyles.bodyMediumRegular.copyWith(
                      color: widget.enabled
                          ? AireColors.neutral700
                          : AireColors.neutral400,
                    ),
                  ),
                  Text(
                    _maxLabel,
                    style: AireTextStyles.bodyMediumRegular.copyWith(
                      color: widget.enabled
                          ? AireColors.neutral700
                          : AireColors.neutral400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
