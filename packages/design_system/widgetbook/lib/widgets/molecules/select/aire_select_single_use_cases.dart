import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/molecules/select/aire_select_single.dart';

// Opciones de ejemplo para las demos
final _exampleOptions = [
  const SelectOption(value: 'option1', label: 'Opción 1'),
  const SelectOption(value: 'option2', label: 'Opción 2'),
  const SelectOption(value: 'option3', label: 'Opción 3'),
  const SelectOption(value: 'option4', label: 'Opción 4'),
  const SelectOption(value: 'option5', label: 'Opción 5'),
];

final _statesOptions = [
  const SelectOption(value: 'aguascalientes', label: 'Aguascalientes'),
  const SelectOption(value: 'bajacalifornia', label: 'Baja California'),
  const SelectOption(value: 'chiapas', label: 'Chiapas'),
  const SelectOption(value: 'estadodemexico', label: 'Estado de México'),
  const SelectOption(value: 'jalisco', label: 'Jalisco'),
  const SelectOption(value: 'nuevoleon', label: 'Nuevo León'),
];

/// ============================================================
/// INTERACTIVE SELECT USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireSelectSingle)
Widget buildInteractiveUseCase(BuildContext context) {
  final sizeOptions = {
    'Medium (48px)': SelectSize.medium,
    'Small (40px)': SelectSize.small,
  };

  final statusOptions = {
    'Normal': SelectStatus.normal,
    'Warning': SelectStatus.warning,
    'Error': SelectStatus.error,
  };

  final selectedSize = context.knobs.list(
    label: 'Size',
    options: sizeOptions.keys.toList(),
    initialOption: 'Medium (48px)',
  );

  final selectedStatus = context.knobs.list(
    label: 'Status',
    options: statusOptions.keys.toList(),
    initialOption: 'Normal',
  );

  final valueOptions = {
    'None': null,
    'Estado de México': 'estadodemexico',
    'Jalisco': 'jalisco',
    'Nuevo León': 'nuevoleon',
  };

  final selectedValue = context.knobs.list(
    label: 'Value',
    options: valueOptions.keys.toList(),
    initialOption: 'None',
  );

  final hasLabel = context.knobs.boolean(
    label: 'Has Label',
    initialValue: true,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireSelectSingle<String>(
        placeholder: context.knobs.string(
          label: 'Placeholder',
          initialValue: 'Selecciona un estado',
        ),
        label: hasLabel ? context.knobs.string(
          label: 'Label',
          initialValue: 'Estado',
        ) : null,
        value: valueOptions[selectedValue],
        options: _statesOptions,
        enabled: context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        ),
        size: sizeOptions[selectedSize]!,
        status: statusOptions[selectedStatus]!,
        width: context.knobs.double.slider(
          label: 'Width',
          initialValue: 233,
          min: 150,
          max: 400,
        ),
        maxDropdownHeight: context.knobs.double.slider(
          label: 'Dropdown Height',
          initialValue: 168,
          min: 100,
          max: 300,
        ),
        onChanged: (value) {
          debugPrint('Selected: $value');
        },
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Sizes', type: AireSelectSingle)
Widget buildComparisonSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Medium (48px)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSelectSingle<String>(
            placeholder: 'Texto del campo',
            options: _exampleOptions,
            size: SelectSize.medium,
            width: 233,
            onChanged: (value) {
              debugPrint('Selected: $value');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Small (40px)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSelectSingle<String>(
            placeholder: 'Texto del campo',
            options: _exampleOptions,
            size: SelectSize.small,
            width: 233,
            onChanged: (value) {
              debugPrint('Selected: $value');
            },
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - States', type: AireSelectSingle)
Widget buildComparisonStatesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Normal (with value)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSelectSingle<String>(
            placeholder: 'Estado',
            label: 'Estado',
            value: 'estadodemexico',
            options: _statesOptions,
            size: SelectSize.small,
            status: SelectStatus.normal,
            width: 233,
            onChanged: (value) {
              debugPrint('Selected: $value');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Warning',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSelectSingle<String>(
            placeholder: 'Estado',
            label: 'Estado',
            value: 'jalisco',
            options: _statesOptions,
            size: SelectSize.small,
            status: SelectStatus.warning,
            width: 233,
            onChanged: (value) {
              debugPrint('Selected: $value');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Error',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSelectSingle<String>(
            placeholder: 'Estado',
            label: 'Estado',
            value: 'nuevoleon',
            options: _statesOptions,
            size: SelectSize.small,
            status: SelectStatus.error,
            width: 233,
            onChanged: (value) {
              debugPrint('Selected: $value');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Disabled',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireSelectSingle<String>(
            placeholder: 'Estado',
            label: 'Estado',
            value: 'chiapas',
            options: _statesOptions,
            size: SelectSize.small,
            enabled: false,
            width: 233,
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Form', type: AireSelectSingle)
Widget buildExampleFormUseCase(BuildContext context) {
  return const _FormExample();
}

class _FormExample extends StatefulWidget {
  const _FormExample();

  @override
  State<_FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<_FormExample> {
  String? _country;
  String? _state;
  String? _city;

  SelectStatus _countryStatus = SelectStatus.normal;
  SelectStatus _stateStatus = SelectStatus.normal;
  SelectStatus _cityStatus = SelectStatus.normal;

  final _countries = [
    const SelectOption(value: 'mx', label: 'México'),
    const SelectOption(value: 'us', label: 'Estados Unidos'),
    const SelectOption(value: 'ca', label: 'Canadá'),
  ];

  final _mexicanStates = [
    const SelectOption(value: 'aguascalientes', label: 'Aguascalientes'),
    const SelectOption(value: 'bajacalifornia', label: 'Baja California'),
    const SelectOption(value: 'chiapas', label: 'Chiapas'),
    const SelectOption(value: 'estadodemexico', label: 'Estado de México'),
    const SelectOption(value: 'jalisco', label: 'Jalisco'),
    const SelectOption(value: 'nuevoleon', label: 'Nuevo León'),
  ];

  final _cities = [
    const SelectOption(value: 'cdmx', label: 'Ciudad de México'),
    const SelectOption(value: 'guadalajara', label: 'Guadalajara'),
    const SelectOption(value: 'monterrey', label: 'Monterrey'),
    const SelectOption(value: 'puebla', label: 'Puebla'),
    const SelectOption(value: 'tijuana', label: 'Tijuana'),
  ];

  void _validateCountry(String? value) {
    setState(() {
      _country = value;
      if (value == null) {
        _countryStatus = SelectStatus.normal;
      } else {
        _countryStatus = SelectStatus.normal;
        // Reset dependent fields
        _state = null;
        _city = null;
        _stateStatus = SelectStatus.normal;
        _cityStatus = SelectStatus.normal;
      }
    });
  }

  void _validateState(String? value) {
    setState(() {
      _state = value;
      if (value == null) {
        _stateStatus = SelectStatus.warning;
      } else {
        _stateStatus = SelectStatus.normal;
      }
    });
  }

  void _validateCity(String? value) {
    setState(() {
      _city = value;
      if (value == null) {
        _cityStatus = SelectStatus.normal;
      } else {
        _cityStatus = SelectStatus.normal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: 350,
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
                'Location Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D59F0),
                ),
              ),
              const SizedBox(height: 24),
              AireSelectSingle<String>(
                placeholder: 'Selecciona un país',
                label: 'País',
                value: _country,
                options: _countries,
                size: SelectSize.small,
                status: _countryStatus,
                onChanged: _validateCountry,
              ),
              const SizedBox(height: 16),
              AireSelectSingle<String>(
                placeholder: 'Selecciona un estado',
                label: 'Estado',
                value: _state,
                options: _mexicanStates,
                size: SelectSize.small,
                status: _stateStatus,
                enabled: _country != null,
                onChanged: _validateState,
              ),
              const SizedBox(height: 16),
              AireSelectSingle<String>(
                placeholder: 'Selecciona una ciudad',
                label: 'Ciudad',
                value: _city,
                options: _cities,
                size: SelectSize.small,
                status: _cityStatus,
                enabled: _state != null,
                onChanged: _validateCity,
              ),
              const SizedBox(height: 24),
              if (_country != null && _state != null && _city != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF00BEA5),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Location selected: $_city, $_state, $_country',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF2A2A2A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
