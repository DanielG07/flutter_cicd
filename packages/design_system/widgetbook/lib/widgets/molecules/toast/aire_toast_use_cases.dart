import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/molecules/toast/aire_toast.dart';

/// ============================================================
/// INTERACTIVE TOAST USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireToast)
Widget buildInteractiveUseCase(BuildContext context) {
  final typeOptions = {
    'Error': ToastType.error,
    'Success': ToastType.success,
    'Warning': ToastType.warning,
    'Info': ToastType.info,
  };

  final selectedType = context.knobs.list(
    label: 'Type',
    options: typeOptions.keys.toList(),
    initialOption: 'Success',
  );

  final hasLabel = context.knobs.boolean(
    label: 'Has Label',
    initialValue: true,
  );

  final hasDescription = context.knobs.boolean(
    label: 'Has Description',
    initialValue: true,
  );

  final showCloseButton = context.knobs.boolean(
    label: 'Show Close Button',
    initialValue: true,
  );

  // Ensure at least one is true
  final effectiveHasLabel = hasLabel || !hasDescription;
  final effectiveHasDescription = hasDescription;

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireToast(
        type: typeOptions[selectedType]!,
        label: effectiveHasLabel ? context.knobs.string(
          label: 'Label',
          initialValue: selectedType,
        ) : null,
        description: effectiveHasDescription ? context.knobs.string(
          label: 'Description',
          initialValue: 'This is a $selectedType notification message',
        ) : null,
        showCloseButton: showCloseButton,
        width: context.knobs.double.slider(
          label: 'Width',
          initialValue: 450,
          min: 300,
          max: 600,
        ),
        onClose: () {
          debugPrint('Toast closed');
        },
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Types', type: AireToast)
Widget buildComparisonAllTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Error',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireToast(
            type: ToastType.error,
            label: 'Error',
            description: 'Something went wrong',
            showCloseButton: true,
            width: 450,
            onClose: () {
              debugPrint('Error toast closed');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Success',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireToast(
            type: ToastType.success,
            label: 'Success',
            description: 'Operation completed successfully',
            showCloseButton: true,
            width: 450,
            onClose: () {
              debugPrint('Success toast closed');
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
          AireToast(
            type: ToastType.warning,
            label: 'Warning',
            description: 'Please review your changes',
            showCloseButton: true,
            width: 450,
            onClose: () {
              debugPrint('Warning toast closed');
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Info',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireToast(
            type: ToastType.info,
            label: 'Information',
            description: 'New features are available',
            showCloseButton: true,
            width: 450,
            onClose: () {
              debugPrint('Info toast closed');
            },
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Variants', type: AireToast)
Widget buildComparisonVariantsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Only Label',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireToast(
            type: ToastType.success,
            label: 'Success',
            width: 450,
          ),
          const SizedBox(height: 24),
          const Text(
            'Only Description',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireToast(
            type: ToastType.success,
            description: 'Operation completed successfully',
            width: 450,
          ),
          const SizedBox(height: 24),
          const Text(
            'Label + Description',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireToast(
            type: ToastType.success,
            label: 'Success',
            description: 'Operation completed successfully',
            width: 450,
          ),
          const SizedBox(height: 24),
          const Text(
            'With Close Button',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireToast(
            type: ToastType.success,
            label: 'Success',
            description: 'Operation completed successfully',
            showCloseButton: true,
            width: 450,
            onClose: () {
              debugPrint('Toast closed');
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

@widgetbook.UseCase(name: 'Example - Notification Stack', type: AireToast)
Widget buildExampleNotificationStackUseCase(BuildContext context) {
  return const _NotificationStackExample();
}

class _NotificationStackExample extends StatefulWidget {
  const _NotificationStackExample();

  @override
  State<_NotificationStackExample> createState() => _NotificationStackExampleState();
}

class _NotificationStackExampleState extends State<_NotificationStackExample> {
  final List<_ToastData> _notifications = [];

  void _addNotification(ToastType type, String label, String description) {
    setState(() {
      _notifications.add(_ToastData(
        id: DateTime.now().millisecondsSinceEpoch,
        type: type,
        label: label,
        description: description,
      ));
    });

    // Auto-remove after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _notifications.removeWhere((n) => n.id == _notifications.first.id);
        });
      }
    });
  }

  void _removeNotification(int id) {
    setState(() {
      _notifications.removeWhere((n) => n.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                children: [
                  const Text(
                    'Notification Demo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Click buttons to show notifications',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ElevatedButton(
                        onPressed: () => _addNotification(
                          ToastType.success,
                          'Success',
                          'File uploaded successfully',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00BEA5),
                        ),
                        child: const Text('Success'),
                      ),
                      ElevatedButton(
                        onPressed: () => _addNotification(
                          ToastType.error,
                          'Error',
                          'Failed to connect to server',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF74F4F),
                        ),
                        child: const Text('Error'),
                      ),
                      ElevatedButton(
                        onPressed: () => _addNotification(
                          ToastType.warning,
                          'Warning',
                          'Your session will expire soon',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF2994A),
                        ),
                        child: const Text('Warning'),
                      ),
                      ElevatedButton(
                        onPressed: () => _addNotification(
                          ToastType.info,
                          'Info',
                          'New update available',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D59F0),
                        ),
                        child: const Text('Info'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Notification stack
            if (_notifications.isNotEmpty)
              Container(
                width: 500,
                constraints: const BoxConstraints(maxHeight: 400),
                child: SingleChildScrollView(
                  child: Column(
                    children: _notifications.map((notification) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: AireToast(
                          type: notification.type,
                          label: notification.label,
                          description: notification.description,
                          showCloseButton: true,
                          onClose: () => _removeNotification(notification.id),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            else
              const Text(
                'No notifications',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6B6B),
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ToastData {
  final int id;
  final ToastType type;
  final String label;
  final String description;

  _ToastData({
    required this.id,
    required this.type,
    required this.label,
    required this.description,
  });
}
