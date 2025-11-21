import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/switch/aire_decision_switch.dart';

/// ============================================================
/// INTERACTIVE DECISION SWITCH USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireDecisionSwitch)
Widget buildInteractiveDecisionSwitchUseCase(BuildContext context) {
  // Value toggle
  final value = context.knobs.boolean(
    label: 'Value (Yes/No)',
    initialValue: true,
  );

  // Enabled toggle
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  // Label text
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Texto toggle',
  );

  // Yes text
  final yesText = context.knobs.string(
    label: 'Yes Text',
    initialValue: 'Sí',
  );

  // No text
  final noText = context.knobs.string(
    label: 'No Text',
    initialValue: 'No',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireDecisionSwitch(
        label: label,
        value: value,
        enabled: enabled,
        yesText: yesText,
        noText: noText,
        onChanged: enabled ? (newValue) {
          debugPrint('Decision switch changed to: $newValue');
        } : null,
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All States', type: AireDecisionSwitch)
Widget buildComparisonAllStatesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Yes Selected',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Texto toggle',
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'No Selected',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Texto toggle',
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled - Yes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Texto toggle',
            value: true,
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled - No',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Texto toggle',
            value: false,
            enabled: false,
            onChanged: null,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Custom Text', type: AireDecisionSwitch)
Widget buildComparisonCustomTextUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Default (Sí/No)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Default text',
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Custom (On/Off)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Power mode',
            value: true,
            yesText: 'On',
            noText: 'Off',
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Custom (T/F)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireDecisionSwitch(
            label: 'Boolean value',
            value: true,
            yesText: 'T',
            noText: 'F',
            onChanged: (value) {},
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// INTERACTIVE EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Toggle', type: AireDecisionSwitch)
Widget buildInteractiveToggleUseCase(BuildContext context) {
  return const _InteractiveDecisionSwitchExample();
}

class _InteractiveDecisionSwitchExample extends StatefulWidget {
  const _InteractiveDecisionSwitchExample();

  @override
  State<_InteractiveDecisionSwitchExample> createState() =>
      _InteractiveDecisionSwitchExampleState();
}

class _InteractiveDecisionSwitchExampleState
    extends State<_InteractiveDecisionSwitchExample> {
  bool _accepted = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click to toggle between Yes/No',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const SizedBox(height: 24),
            AireDecisionSwitch(
              label: 'Accept terms and conditions',
              value: _accepted,
              onChanged: (value) => setState(() => _accepted = value),
            ),
            const SizedBox(height: 24),
            Text(
              'Current selection: ${_accepted ? "Yes" : "No"}',
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

@widgetbook.UseCase(name: 'Example - Form', type: AireDecisionSwitch)
Widget buildInteractiveFormExampleUseCase(BuildContext context) {
  return const _FormWithDecisionSwitchesExample();
}

class _FormWithDecisionSwitchesExample extends StatefulWidget {
  const _FormWithDecisionSwitchesExample();

  @override
  State<_FormWithDecisionSwitchesExample> createState() =>
      _FormWithDecisionSwitchesExampleState();
}

class _FormWithDecisionSwitchesExampleState
    extends State<_FormWithDecisionSwitchesExample> {
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;
  bool _subscribeNewsletter = true;
  bool _enableNotifications = true;

  bool get _canSubmit => _acceptTerms && _acceptPrivacy;

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
              'Registration Form',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Required:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const SizedBox(height: 12),
            AireDecisionSwitch(
              label: 'Accept terms and conditions',
              value: _acceptTerms,
              onChanged: (value) => setState(() => _acceptTerms = value),
            ),
            const SizedBox(height: 12),
            AireDecisionSwitch(
              label: 'Accept privacy policy',
              value: _acceptPrivacy,
              onChanged: (value) => setState(() => _acceptPrivacy = value),
            ),
            const SizedBox(height: 24),
            const Text(
              'Optional:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const SizedBox(height: 12),
            AireDecisionSwitch(
              label: 'Subscribe to newsletter',
              value: _subscribeNewsletter,
              onChanged: (value) =>
                  setState(() => _subscribeNewsletter = value),
            ),
            const SizedBox(height: 12),
            AireDecisionSwitch(
              label: 'Enable email notifications',
              value: _enableNotifications,
              onChanged: (value) =>
                  setState(() => _enableNotifications = value),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _canSubmit
                    ? const Color(0xFFE5FFFB)
                    : const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _canSubmit
                      ? const Color(0xFF00BEA5)
                      : const Color(0xFFEAEAEA),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _canSubmit
                        ? '✓ You can submit the form'
                        : '✗ Please accept required terms',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _canSubmit
                          ? const Color(0xFF01685A)
                          : const Color(0xFFAAAAAA),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Terms: ${_acceptTerms ? "Yes" : "No"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    'Privacy: ${_acceptPrivacy ? "Yes" : "No"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    'Newsletter: ${_subscribeNewsletter ? "Yes" : "No"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    'Notifications: ${_enableNotifications ? "Yes" : "No"}',
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
