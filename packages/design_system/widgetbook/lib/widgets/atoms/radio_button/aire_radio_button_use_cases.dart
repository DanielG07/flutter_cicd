import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/radio_button/aire_radio_button.dart';

/// ============================================================
/// INTERACTIVE RADIO BUTTON USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireRadioButton)
Widget buildInteractiveRadioButtonUseCase(BuildContext context) {
  // Checked state
  final checked = context.knobs.boolean(
    label: 'Checked',
    initialValue: false,
  );

  // Enabled toggle
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  // Label text
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Text input',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireRadioButton<String>(
        label: label,
        value: 'option1',
        groupValue: checked ? 'option1' : null,
        enabled: enabled,
        onChanged: enabled ? (value) {
          debugPrint('Radio button changed to: $value');
        } : null,
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All States', type: AireRadioButton)
Widget buildComparisonAllStatesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Default',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireRadioButton<String>(
            label: 'Text input',
            value: 'option1',
            groupValue: null,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Checked',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireRadioButton<String>(
            label: 'Text input',
            value: 'option3',
            groupValue: 'option3',
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireRadioButton<String>(
            label: 'Text input',
            value: 'option4',
            groupValue: null,
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled-filled',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireRadioButton<String>(
            label: 'Text input',
            value: 'option5',
            groupValue: 'option5',
            enabled: false,
            onChanged: null,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Enabled vs Disabled', type: AireRadioButton)
Widget buildComparisonEnabledDisabledUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enabled States',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 24),
          AireRadioButton<String>(
            label: 'Unchecked',
            value: 'option1',
            groupValue: 'option2',
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          AireRadioButton<String>(
            label: 'Checked',
            value: 'option2',
            groupValue: 'option2',
            onChanged: (value) {},
          ),
          const SizedBox(height: 48),
          const Text(
            'Disabled States',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 24),
          AireRadioButton<String>(
            label: 'Unchecked',
            value: 'option3',
            groupValue: 'option4',
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 16),
          AireRadioButton<String>(
            label: 'Checked',
            value: 'option4',
            groupValue: 'option4',
            enabled: false,
            onChanged: null,
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// INTERACTIVE EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Radio Group', type: AireRadioButton)
Widget buildInteractiveRadioGroupUseCase(BuildContext context) {
  return const _RadioGroupExample();
}

class _RadioGroupExample extends StatefulWidget {
  const _RadioGroupExample();

  @override
  State<_RadioGroupExample> createState() => _RadioGroupExampleState();
}

class _RadioGroupExampleState extends State<_RadioGroupExample> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select an option',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 24),
            AireRadioButton<String>(
              label: 'Option 1',
              value: 'option1',
              groupValue: _selectedValue,
              onChanged: (value) => setState(() => _selectedValue = value),
            ),
            const SizedBox(height: 16),
            AireRadioButton<String>(
              label: 'Option 2',
              value: 'option2',
              groupValue: _selectedValue,
              onChanged: (value) => setState(() => _selectedValue = value),
            ),
            const SizedBox(height: 16),
            AireRadioButton<String>(
              label: 'Option 3',
              value: 'option3',
              groupValue: _selectedValue,
              onChanged: (value) => setState(() => _selectedValue = value),
            ),
            const SizedBox(height: 16),
            AireRadioButton<String>(
              label: 'Option 4',
              value: 'option4',
              groupValue: _selectedValue,
              onChanged: (value) => setState(() => _selectedValue = value),
            ),
            const SizedBox(height: 24),
            Text(
              _selectedValue != null
                  ? 'Selected: $_selectedValue'
                  : 'No selection',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF6B6B6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Example - Multiple Groups', type: AireRadioButton)
Widget buildInteractiveMultipleGroupsUseCase(BuildContext context) {
  return const _MultipleRadioGroupsExample();
}

class _MultipleRadioGroupsExample extends StatefulWidget {
  const _MultipleRadioGroupsExample();

  @override
  State<_MultipleRadioGroupsExample> createState() =>
      _MultipleRadioGroupsExampleState();
}

class _MultipleRadioGroupsExampleState
    extends State<_MultipleRadioGroupsExample> {
  String? _colorSelection;
  String? _sizeSelection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Color Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 16),
            AireRadioButton<String>(
              label: 'Red',
              value: 'red',
              groupValue: _colorSelection,
              onChanged: (value) => setState(() => _colorSelection = value),
            ),
            const SizedBox(height: 12),
            AireRadioButton<String>(
              label: 'Blue',
              value: 'blue',
              groupValue: _colorSelection,
              onChanged: (value) => setState(() => _colorSelection = value),
            ),
            const SizedBox(height: 12),
            AireRadioButton<String>(
              label: 'Green',
              value: 'green',
              groupValue: _colorSelection,
              onChanged: (value) => setState(() => _colorSelection = value),
            ),
            const SizedBox(height: 32),
            const Text(
              'Size Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 16),
            AireRadioButton<String>(
              label: 'Small',
              value: 'small',
              groupValue: _sizeSelection,
              onChanged: (value) => setState(() => _sizeSelection = value),
            ),
            const SizedBox(height: 12),
            AireRadioButton<String>(
              label: 'Medium',
              value: 'medium',
              groupValue: _sizeSelection,
              onChanged: (value) => setState(() => _sizeSelection = value),
            ),
            const SizedBox(height: 12),
            AireRadioButton<String>(
              label: 'Large',
              value: 'large',
              groupValue: _sizeSelection,
              onChanged: (value) => setState(() => _sizeSelection = value),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selections:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Color: ${_colorSelection ?? "None"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Size: ${_sizeSelection ?? "None"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
