import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/switch/aire_switch.dart';

/// ============================================================
/// INTERACTIVE SWITCH USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireSwitch)
Widget buildInteractiveSwitchUseCase(BuildContext context) {
  // Value toggle
  final value = context.knobs.boolean(
    label: 'Value (ON/OFF)',
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

  // Label placement
  final labelPlacement = context.knobs.list(
    label: 'Label Placement',
    options: SwitchLabelPlacement.values,
    labelBuilder: (p) => p.name.toUpperCase(),
    initialOption: SwitchLabelPlacement.end,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireSwitch(
        label: label,
        value: value,
        enabled: enabled,
        labelPlacement: labelPlacement,
        onChanged: enabled ? (newValue) {
          debugPrint('Switch changed to: $newValue');
        } : null,
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All States', type: AireSwitch)
Widget buildComparisonAllStatesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'On',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireSwitch(
            label: 'Texto toggle',
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Off',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireSwitch(
            label: 'Texto toggle',
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled On',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireSwitch(
            label: 'Texto toggle',
            value: true,
            enabled: false,
            onChanged: null,
          ),
          const SizedBox(height: 32),
          const Text(
            'Disabled Off',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireSwitch(
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

@widgetbook.UseCase(name: 'Comparison - Placements', type: AireSwitch)
Widget buildComparisonPlacementsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Label Start',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireSwitch(
            label: 'Texto toggle',
            value: true,
            labelPlacement: SwitchLabelPlacement.start,
            onChanged: (value) {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Label End',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C4C4C),
            ),
          ),
          const SizedBox(height: 16),
          AireSwitch(
            label: 'Texto toggle',
            value: true,
            labelPlacement: SwitchLabelPlacement.end,
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

@widgetbook.UseCase(name: 'Example - Toggle', type: AireSwitch)
Widget buildInteractiveToggleUseCase(BuildContext context) {
  return const _InteractiveSwitchExample();
}

class _InteractiveSwitchExample extends StatefulWidget {
  const _InteractiveSwitchExample();

  @override
  State<_InteractiveSwitchExample> createState() =>
      _InteractiveSwitchExampleState();
}

class _InteractiveSwitchExampleState extends State<_InteractiveSwitchExample> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click to toggle the switch',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const SizedBox(height: 24),
            AireSwitch(
              label: 'Enable notifications',
              value: _isEnabled,
              onChanged: (value) => setState(() => _isEnabled = value),
            ),
            const SizedBox(height: 24),
            Text(
              'Current state: ${_isEnabled ? "ON" : "OFF"}',
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

@widgetbook.UseCase(name: 'Example - Settings Panel', type: AireSwitch)
Widget buildInteractiveSettingsPanelUseCase(BuildContext context) {
  return const _SettingsPanelExample();
}

class _SettingsPanelExample extends StatefulWidget {
  const _SettingsPanelExample();

  @override
  State<_SettingsPanelExample> createState() => _SettingsPanelExampleState();
}

class _SettingsPanelExampleState extends State<_SettingsPanelExample> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = false;
  bool _vibrationEnabled = true;
  bool _autoUpdateEnabled = false;

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
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 24),
            AireSwitch(
              label: 'Push notifications',
              value: _notificationsEnabled,
              onChanged: (value) =>
                  setState(() => _notificationsEnabled = value),
            ),
            const SizedBox(height: 16),
            AireSwitch(
              label: 'Sound',
              value: _soundEnabled,
              onChanged: (value) => setState(() => _soundEnabled = value),
            ),
            const SizedBox(height: 16),
            AireSwitch(
              label: 'Vibration',
              value: _vibrationEnabled,
              onChanged: (value) => setState(() => _vibrationEnabled = value),
            ),
            const SizedBox(height: 16),
            AireSwitch(
              label: 'Auto-update',
              value: _autoUpdateEnabled,
              onChanged: (value) => setState(() => _autoUpdateEnabled = value),
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
                    'Active settings:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Notifications: ${_notificationsEnabled ? "ON" : "OFF"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    'Sound: ${_soundEnabled ? "ON" : "OFF"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    'Vibration: ${_vibrationEnabled ? "ON" : "OFF"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    'Auto-update: ${_autoUpdateEnabled ? "ON" : "OFF"}',
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
