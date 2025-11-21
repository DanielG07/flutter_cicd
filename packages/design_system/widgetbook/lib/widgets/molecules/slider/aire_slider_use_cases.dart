import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/molecules/slider/aire_slider.dart';
import 'package:design_system/src/molecules/slider/aire_range_slider.dart';

/// ============================================================
/// INTERACTIVE SINGLE SLIDER USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive - Single', type: AireSlider)
Widget buildInteractiveSingleUseCase(BuildContext context) {
  final value = context.knobs.double.slider(
    label: 'Value',
    initialValue: 50,
    min: 0,
    max: 100,
  );

  final minValue = context.knobs.double.slider(
    label: 'Min',
    initialValue: 0,
    min: 0,
    max: 50,
  );

  final maxValue = context.knobs.double.slider(
    label: 'Max',
    initialValue: 100,
    min: 50,
    max: 200,
  );

  final showLabels = context.knobs.boolean(
    label: 'Show Labels',
    initialValue: true,
  );

  final hasCustomLabels = context.knobs.boolean(
    label: 'Custom Labels',
    initialValue: false,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AireSlider(
            value: value,
            min: minValue,
            max: maxValue,
            showLabels: showLabels,
            minLabel: hasCustomLabels ? context.knobs.string(
              label: 'Min Label',
              initialValue: 'Low',
            ) : null,
            maxLabel: hasCustomLabels ? context.knobs.string(
              label: 'Max Label',
              initialValue: 'High',
            ) : null,
            enabled: context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            ),
            width: context.knobs.double.slider(
              label: 'Width',
              initialValue: 300,
              min: 200,
              max: 500,
            ),
            onChanged: (value) {
              debugPrint('Slider value: $value');
            },
            onChangeEnd: (value) {
              debugPrint('Slider change ended: $value');
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Current value: ${value.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// INTERACTIVE RANGE SLIDER USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive - Range', type: AireRangeSlider)
Widget buildInteractiveRangeUseCase(BuildContext context) {
  final startValue = context.knobs.double.slider(
    label: 'Start Value',
    initialValue: 25,
    min: 0,
    max: 100,
  );

  final endValue = context.knobs.double.slider(
    label: 'End Value',
    initialValue: 75,
    min: 0,
    max: 100,
  );

  final minValue = context.knobs.double.slider(
    label: 'Min',
    initialValue: 0,
    min: 0,
    max: 50,
  );

  final maxValue = context.knobs.double.slider(
    label: 'Max',
    initialValue: 100,
    min: 50,
    max: 200,
  );

  final showLabels = context.knobs.boolean(
    label: 'Show Labels',
    initialValue: true,
  );

  final hasCustomLabels = context.knobs.boolean(
    label: 'Custom Labels',
    initialValue: false,
  );

  final values = RangeValues(startValue, endValue);

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AireRangeSlider(
            values: values,
            min: minValue,
            max: maxValue,
            showLabels: showLabels,
            minLabel: hasCustomLabels ? context.knobs.string(
              label: 'Min Label',
              initialValue: 'Low',
            ) : null,
            maxLabel: hasCustomLabels ? context.knobs.string(
              label: 'Max Label',
              initialValue: 'High',
            ) : null,
            enabled: context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            ),
            width: context.knobs.double.slider(
              label: 'Width',
              initialValue: 300,
              min: 200,
              max: 500,
            ),
            onChanged: (values) {
              debugPrint('Range: ${values.start} - ${values.end}');
            },
            onChangeEnd: (values) {
              debugPrint('Range change ended: ${values.start} - ${values.end}');
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Current range: ${startValue.toStringAsFixed(0)} - ${endValue.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - Single vs Range', type: AireSlider)
Widget buildComparisonUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Single Slider (50%)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSlider(
            value: 50,
            width: 300,
            onChanged: (value) {
              debugPrint('Value: $value');
            },
          ),
          const SizedBox(height: 32),
          const Text(
            'Range Slider (25% - 75%)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireRangeSlider(
            values: const RangeValues(25, 75),
            width: 300,
            onChanged: (values) {
              debugPrint('Range: ${values.start} - ${values.end}');
            },
          ),
          const SizedBox(height: 32),
          const Text(
            'Custom Labels (0-10)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSlider(
            value: 5,
            min: 0,
            max: 10,
            minLabel: '0',
            maxLabel: '10',
            width: 300,
            onChanged: (value) {
              debugPrint('Value: $value');
            },
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Audio Controls', type: AireSlider)
Widget buildExampleAudioControlsUseCase(BuildContext context) {
  return const _AudioControlsExample();
}

class _AudioControlsExample extends StatefulWidget {
  const _AudioControlsExample();

  @override
  State<_AudioControlsExample> createState() => _AudioControlsExampleState();
}

class _AudioControlsExampleState extends State<_AudioControlsExample> {
  double _volume = 70;
  double _balance = 50;
  RangeValues _eqRange = const RangeValues(30, 80);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Audio Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D59F0),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const Icon(
                    Icons.volume_up,
                    color: Color(0xFF2D59F0),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Volume',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2A2A2A),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${_volume.toInt()}%',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AireSlider(
                value: _volume,
                onChanged: (value) {
                  setState(() {
                    _volume = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Icon(
                    Icons.tune,
                    color: Color(0xFF2D59F0),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2A2A2A),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _balance < 50
                        ? 'L ${(50 - _balance).toInt()}'
                        : _balance > 50
                            ? 'R ${(_balance - 50).toInt()}'
                            : 'Center',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AireSlider(
                value: _balance,
                minLabel: 'L',
                maxLabel: 'R',
                onChanged: (value) {
                  setState(() {
                    _balance = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Icon(
                    Icons.equalizer,
                    color: Color(0xFF2D59F0),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Equalizer Range',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2A2A2A),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${_eqRange.start.toInt()} - ${_eqRange.end.toInt()}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AireRangeSlider(
                values: _eqRange,
                minLabel: 'Bass',
                maxLabel: 'Treble',
                onChanged: (values) {
                  setState(() {
                    _eqRange = values;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
