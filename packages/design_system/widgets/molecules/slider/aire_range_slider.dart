import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Widget de Range Slider con dos valores
///
/// Características:
/// - Rango de valores de 0 a 100 (porcentaje)
/// - Labels personalizables (por defecto 0% - 100%)
/// - Track gris claro con barra activa azul
/// - Thumbs circulares blancos con borde azul
/// - Ancho configurable
class AireRangeSlider extends StatefulWidget {
  /// Valores actual del rango (start, end)
  final RangeValues values;

  /// Callback cuando cambia el rango
  final ValueChanged<RangeValues>? onChanged;

  /// Callback cuando termina de cambiar (al soltar)
  final ValueChanged<RangeValues>? onChangeEnd;

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

  const AireRangeSlider({
    super.key,
    required this.values,
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
  State<AireRangeSlider> createState() => _AireRangeSliderState();
}

class _AireRangeSliderState extends State<AireRangeSlider> {
  late RangeValues _currentValues;

  @override
  void initState() {
    super.initState();
    _currentValues = widget.values;
  }

  @override
  void didUpdateWidget(AireRangeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.values != oldWidget.values) {
      _currentValues = widget.values;
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
          // Range Slider
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
              rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
              valueIndicatorColor: AireColors.primary400,
              valueIndicatorTextStyle: AireTextStyles.bodySmallRegular.copyWith(
                color: AireColors.white,
              ),
            ),
            child: RangeSlider(
              values: RangeValues(
                _currentValues.start.clamp(widget.min, widget.max),
                _currentValues.end.clamp(widget.min, widget.max),
              ),
              min: widget.min,
              max: widget.max,
              onChanged: widget.enabled
                  ? (values) {
                      setState(() {
                        _currentValues = values;
                      });
                      widget.onChanged?.call(values);
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
