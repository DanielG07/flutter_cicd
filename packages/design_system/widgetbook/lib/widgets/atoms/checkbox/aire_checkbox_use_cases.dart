import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/checkbox/aire_checkbox.dart';

/// ============================================================
/// INTERACTIVE CHECKBOX USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireCheckbox)
Widget buildInteractiveCheckboxUseCase(BuildContext context) {
  // State selection
  final stateName = context.knobs.list(
    label: 'State',
    options: ['UNCHECKED', 'CHECKED', 'INDETERMINATE'],
    initialOption: 'UNCHECKED',
  );

  final state = _getStateFromName(stateName);

  // Value based on state
  final value = state == CheckboxState.checked;

  // Enabled toggle
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  // Label text
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Text checkbox',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireCheckbox(
        label: label,
        state: state,
        value: value,
        enabled: enabled,
        onChanged: enabled ? (newValue) {
          debugPrint('Checkbox changed to: $newValue');
        } : null,
      ),
    ),
  );
}

CheckboxState _getStateFromName(String name) {
  switch (name) {
    case 'CHECKED':
      return CheckboxState.checked;
    case 'INDETERMINATE':
      return CheckboxState.indeterminate;
    case 'UNCHECKED':
    default:
      return CheckboxState.unchecked;
  }
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All States', type: AireCheckbox)
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
          AireCheckbox(
            label: 'Text checkbox',
            state: CheckboxState.unchecked,
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Focused',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Text checkbox',
            state: CheckboxState.unchecked,
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Selected',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Text checkbox',
            state: CheckboxState.checked,
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Clear-all',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Text checkbox',
            state: CheckboxState.indeterminate,
            value: false,
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
          AireCheckbox(
            label: 'Text checkbox',
            state: CheckboxState.unchecked,
            value: false,
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled-selected',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Text checkbox',
            state: CheckboxState.checked,
            value: true,
            enabled: false,
            onChanged: null,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Enabled vs Disabled', type: AireCheckbox)
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
          AireCheckbox(
            label: 'Unchecked',
            state: CheckboxState.unchecked,
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Checked',
            state: CheckboxState.checked,
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Indeterminate',
            state: CheckboxState.indeterminate,
            value: false,
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
          AireCheckbox(
            label: 'Unchecked',
            state: CheckboxState.unchecked,
            value: false,
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Checked',
            state: CheckboxState.checked,
            value: true,
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 16),
          AireCheckbox(
            label: 'Indeterminate',
            state: CheckboxState.indeterminate,
            value: false,
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

@widgetbook.UseCase(name: 'Example - Toggle', type: AireCheckbox)
Widget buildInteractiveToggleUseCase(BuildContext context) {
  return const _InteractiveCheckboxExample();
}

/// Widget interactivo para demostrar el comportamiento del checkbox
class _InteractiveCheckboxExample extends StatefulWidget {
  const _InteractiveCheckboxExample();

  @override
  State<_InteractiveCheckboxExample> createState() =>
      _InteractiveCheckboxExampleState();
}

class _InteractiveCheckboxExampleState
    extends State<_InteractiveCheckboxExample> {
  bool _isChecked = false;
  CheckboxState _state = CheckboxState.unchecked;

  void _handleChange(bool value) {
    setState(() {
      _isChecked = value;
      _state = value ? CheckboxState.checked : CheckboxState.unchecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click to toggle the checkbox',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const SizedBox(height: 24),
            AireCheckbox(
              label: 'Interactive checkbox',
              state: _state,
              value: _isChecked,
              onChanged: _handleChange,
            ),
            const SizedBox(height: 24),
            Text(
              'Current state: ${_isChecked ? "Checked" : "Unchecked"}',
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

@widgetbook.UseCase(name: 'Example - Checkbox Group', type: AireCheckbox)
Widget buildInteractiveGroupUseCase(BuildContext context) {
  return const _CheckboxGroupExample();
}

/// Widget para demostrar un grupo de checkboxes
class _CheckboxGroupExample extends StatefulWidget {
  const _CheckboxGroupExample();

  @override
  State<_CheckboxGroupExample> createState() => _CheckboxGroupExampleState();
}

class _CheckboxGroupExampleState extends State<_CheckboxGroupExample> {
  final Map<String, bool> _options = {
    'Option 1': false,
    'Option 2': false,
    'Option 3': false,
    'Option 4': false,
  };

  bool get _allSelected => _options.values.every((selected) => selected);
  bool get _someSelected =>
      _options.values.any((selected) => selected) && !_allSelected;

  CheckboxState get _selectAllState {
    if (_allSelected) return CheckboxState.checked;
    if (_someSelected) return CheckboxState.indeterminate;
    return CheckboxState.unchecked;
  }

  void _handleSelectAll(bool value) {
    setState(() {
      _options.updateAll((key, _) => value);
    });
  }

  void _handleOptionChange(String key, bool value) {
    setState(() {
      _options[key] = value;
    });
  }

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
              'Checkbox Group Example',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 24),
            AireCheckbox(
              label: 'Select all',
              state: _selectAllState,
              value: _allSelected,
              onChanged: _handleSelectAll,
            ),
            const SizedBox(height: 8),
            Container(
              height: 1,
              width: 200,
              color: const Color(0xFFEAEAEA),
            ),
            const SizedBox(height: 8),
            ..._options.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 8),
                child: AireCheckbox(
                  label: entry.key,
                  state: entry.value
                      ? CheckboxState.checked
                      : CheckboxState.unchecked,
                  value: entry.value,
                  onChanged: (value) => _handleOptionChange(entry.key, value),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Selected: ${_options.values.where((v) => v).length}/${_options.length}',
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
