import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/molecules/input/aire_input_text.dart';

/// ============================================================
/// INTERACTIVE INPUT TEXT USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireInputText)
Widget buildInteractiveUseCase(BuildContext context) {
  final statusOptions = {
    'Normal': InputStatus.normal,
    'Success': InputStatus.success,
    'Warning': InputStatus.warning,
    'Error': InputStatus.error,
  };

  final selectedStatus = context.knobs.list(
    label: 'Status',
    options: statusOptions.keys.toList(),
    initialOption: 'Normal',
  );

  final hasValue = context.knobs.boolean(
    label: 'Has Value',
    initialValue: false,
  );

  final controller = TextEditingController(
    text: hasValue ? context.knobs.string(
      label: 'Value',
      initialValue: 'Texto del input',
    ) : '',
  );

  final hasLabel = context.knobs.boolean(
    label: 'Has Label',
    initialValue: true,
  );

  final hasIcon = context.knobs.boolean(
    label: 'Has Icon',
    initialValue: false,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireInputText(
        controller: controller,
        placeholder: context.knobs.string(
          label: 'Placeholder',
          initialValue: 'Ingresa texto',
        ),
        label: hasLabel ? context.knobs.string(
          label: 'Label',
          initialValue: 'label',
        ) : null,
        enabled: context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        ),
        status: statusOptions[selectedStatus]!,
        suffixIcon: hasIcon ? const Icon(Icons.search, size: 14) : null,
        width: context.knobs.double.slider(
          label: 'Width',
          initialValue: 220,
          min: 150,
          max: 400,
        ),
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All States', type: AireInputText)
Widget buildComparisonAllStatesUseCase(BuildContext context) {
  final controller1 = TextEditingController(text: 'Texto del input');
  final controller2 = TextEditingController(text: 'Texto del input');
  final controller3 = TextEditingController(text: 'Texto del input');
  final controller4 = TextEditingController(text: 'Texto del input');

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Normal',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            controller: controller1,
            placeholder: 'Ingresa texto',
            label: 'label',
            status: InputStatus.normal,
            width: 220,
          ),
          const SizedBox(height: 24),
          const Text(
            'Success',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            controller: controller2,
            placeholder: 'Ingresa texto',
            label: 'label',
            status: InputStatus.success,
            width: 220,
          ),
          const SizedBox(height: 24),
          const Text(
            'Warning',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            controller: controller3,
            placeholder: 'Ingresa texto',
            label: 'label',
            status: InputStatus.warning,
            width: 220,
          ),
          const SizedBox(height: 24),
          const Text(
            'Error',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            controller: controller4,
            placeholder: 'Ingresa texto',
            label: 'label',
            status: InputStatus.error,
            width: 220,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Variants', type: AireInputText)
Widget buildComparisonVariantsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Default (No Label)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            placeholder: 'Ingresa texto',
            width: 220,
          ),
          const SizedBox(height: 24),
          const Text(
            'With Label',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            placeholder: 'Ingresa texto',
            label: 'label',
            width: 220,
          ),
          const SizedBox(height: 24),
          const Text(
            'With Icon',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            placeholder: 'Ingresa texto',
            label: 'label',
            suffixIcon: const Icon(Icons.search, size: 14),
            width: 220,
          ),
          const SizedBox(height: 24),
          const Text(
            'Disabled',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireInputText(
            controller: TextEditingController(text: 'Texto del input'),
            placeholder: 'Ingresa texto',
            enabled: false,
            width: 220,
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Form', type: AireInputText)
Widget buildExampleFormUseCase(BuildContext context) {
  return const _FormExample();
}

class _FormExample extends StatefulWidget {
  const _FormExample();

  @override
  State<_FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<_FormExample> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  InputStatus _emailStatus = InputStatus.normal;
  InputStatus _phoneStatus = InputStatus.normal;

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailStatus = InputStatus.normal;
      } else if (value.contains('@') && value.contains('.')) {
        _emailStatus = InputStatus.success;
      } else {
        _emailStatus = InputStatus.error;
      }
    });
  }

  void _validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneStatus = InputStatus.normal;
      } else if (value.length >= 10) {
        _phoneStatus = InputStatus.success;
      } else {
        _phoneStatus = InputStatus.warning;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
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
                'Contact Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D59F0),
                ),
              ),
              const SizedBox(height: 24),
              AireInputText(
                controller: _nameController,
                placeholder: 'Enter your name',
                label: 'Full Name',
                width: 300,
              ),
              const SizedBox(height: 16),
              AireInputText(
                controller: _emailController,
                placeholder: 'your.email@example.com',
                label: 'Email',
                status: _emailStatus,
                width: 300,
                onChanged: _validateEmail,
              ),
              const SizedBox(height: 16),
              AireInputText(
                controller: _phoneController,
                placeholder: '(555) 123-4567',
                label: 'Phone',
                status: _phoneStatus,
                width: 300,
                onChanged: _validatePhone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
