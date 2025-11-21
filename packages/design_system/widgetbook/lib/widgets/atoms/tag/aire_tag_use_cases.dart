import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/tag/aire_tag.dart';

/// ============================================================
/// INTERACTIVE TAG USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireTag)
Widget buildInteractiveTagUseCase(BuildContext context) {
  // Type selection
  final typeName = context.knobs.list(
    label: 'Type',
    options: ['CATEGORY', 'STATUS'],
    initialOption: 'CATEGORY',
  );

  // Size selection
  final size = context.knobs.list(
    label: 'Size',
    options: TagSize.values,
    labelBuilder: (s) => s.name.toUpperCase(),
    initialOption: TagSize.medium,
  );

  // Text input
  final text = context.knobs.string(
    label: 'Text',
    initialValue: typeName == 'CATEGORY' ? 'Text' : 'Aprobada',
  );

  if (typeName == 'CATEGORY') {
    // Category-specific knobs
    final iconName = context.knobs.list(
      label: 'Icon',
      options: ['label', 'home', 'settings', 'favorite', 'star', 'person'],
      initialOption: 'label',
    );

    final focused = context.knobs.boolean(
      label: 'Focused',
      initialValue: false,
    );

    final hasOnTap = context.knobs.boolean(
      label: 'Clickable',
      initialValue: true,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AireTag.category(
          text: text,
          icon: _getIconFromName(iconName),
          size: size,
          focused: focused,
          onTap: hasOnTap ? () {
            debugPrint('Category tag tapped: $text');
          } : null,
        ),
      ),
    );
  } else {
    // Status-specific knobs
    final variant = context.knobs.list(
      label: 'Variant',
      options: StatusTagVariant.values,
      labelBuilder: (v) => v.name.toUpperCase(),
      initialOption: StatusTagVariant.active,
    );

    final hasIcon = context.knobs.boolean(
      label: 'Has Icon',
      initialValue: false,
    );

    IconData? icon;
    if (hasIcon) {
      final iconName = context.knobs.list(
        label: 'Icon',
        options: ['check', 'close', 'info', 'priority_high', 'warning'],
        initialOption: 'check',
      );
      icon = _getIconFromName(iconName);
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AireTag.status(
          text: text,
          variant: variant,
          size: size,
          icon: icon,
        ),
      ),
    );
  }
}

IconData _getIconFromName(String name) {
  switch (name) {
    case 'label':
      return Icons.label;
    case 'home':
      return Icons.home;
    case 'settings':
      return Icons.settings;
    case 'favorite':
      return Icons.favorite;
    case 'star':
      return Icons.star;
    case 'person':
      return Icons.person;
    case 'check':
      return Icons.check;
    case 'close':
      return Icons.close;
    case 'info':
      return Icons.info;
    case 'priority_high':
      return Icons.priority_high;
    case 'warning':
      return Icons.warning;
    default:
      return Icons.label;
  }
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Status Variants', type: AireTag)
Widget buildComparisonStatusVariantsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active (Success)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.status(
            text: 'Aprobada',
            variant: StatusTagVariant.active,
          ),
          const SizedBox(height: 16),
          const Text(
            'Pause (Warning)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.status(
            text: 'En progreso',
            variant: StatusTagVariant.pause,
          ),
          const SizedBox(height: 16),
          const Text(
            'Cancel (Error)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.status(
            text: 'Rechazada',
            variant: StatusTagVariant.cancel,
          ),
          const SizedBox(height: 16),
          const Text(
            'Register (Info)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.status(
            text: 'Información',
            variant: StatusTagVariant.register,
          ),
          const SizedBox(height: 16),
          const Text(
            'Default',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.status(
            text: 'Default',
            variant: StatusTagVariant.defaultVariant,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Types', type: AireTag)
Widget buildComparisonTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.category(
            text: 'Text',
            icon: Icons.label,
          ),
          const SizedBox(height: 24),
          const Text(
            'Status',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireTag.status(
            text: 'Aprobada',
            variant: StatusTagVariant.active,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Sizes', type: AireTag)
Widget buildComparisonSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Medium Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AireTag.category(
                text: 'Category',
                icon: Icons.label,
                size: TagSize.medium,
              ),
              AireTag.status(
                text: 'Aprobada',
                variant: StatusTagVariant.active,
                size: TagSize.medium,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Small Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AireTag.category(
                text: 'Category',
                icon: Icons.label,
                size: TagSize.small,
              ),
              AireTag.status(
                text: 'Aprobada',
                variant: StatusTagVariant.active,
                size: TagSize.small,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Product Tags', type: AireTag)
Widget buildExampleProductTagsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Producto',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              AireTag.category(text: 'Tecnología', icon: Icons.computer),
              AireTag.category(text: 'Nuevo', icon: Icons.new_releases),
              AireTag.category(text: 'Destacado', icon: Icons.star),
            ],
          ),
          const SizedBox(height: 16),
          AireTag.status(
            text: 'Disponible',
            variant: StatusTagVariant.active,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Document Status Flow', type: AireTag)
Widget buildExampleDocumentStatusFlowUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Flujo de Estados del Documento',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 32),
          _buildStatusFlowItem('1. Creado', StatusTagVariant.register),
          const SizedBox(height: 16),
          _buildStatusFlowItem('2. En revisión', StatusTagVariant.pause),
          const SizedBox(height: 16),
          _buildStatusFlowItem('3. Aprobado', StatusTagVariant.active),
        ],
      ),
    ),
  );
}

Widget _buildStatusFlowItem(String label, StatusTagVariant variant) {
  String statusText;
  switch (variant) {
    case StatusTagVariant.register:
      statusText = 'Nuevo';
      break;
    case StatusTagVariant.pause:
      statusText = 'En progreso';
      break;
    case StatusTagVariant.active:
      statusText = 'Completado';
      break;
    case StatusTagVariant.cancel:
      statusText = 'Rechazado';
      break;
    case StatusTagVariant.defaultVariant:
      statusText = 'Sin estado';
      break;
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 150,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B6B6B),
          ),
        ),
      ),
      const SizedBox(width: 16),
      AireTag.status(text: statusText, variant: variant),
    ],
  );
}
