import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/icon_button/aire_icon_button.dart';

/// ============================================================
/// INTERACTIVE ICON BUTTON USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireIconButton)
Widget buildInteractiveIconButtonUseCase(BuildContext context) {
  // Size selection
  final size = context.knobs.list(
    label: 'Size',
    options: IconButtonSize.values,
    labelBuilder: (s) => s.name.toUpperCase(),
    initialOption: IconButtonSize.medium,
  );

  // Icon selection
  final iconName = context.knobs.list(
    label: 'Icon',
    options: ['home', 'notifications', 'star', 'favorite', 'share', 'delete', 'arrow_back', 'more_vert'],
    initialOption: 'home',
  );

  // Enabled toggle
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  final icon = _getIconFromName(iconName);

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireIconButton(
        icon: icon,
        size: size,
        enabled: enabled,
        onPressed: enabled ? () {
          debugPrint('Icon button pressed: $iconName');
        } : null,
      ),
    ),
  );
}

IconData _getIconFromName(String name) {
  switch (name) {
    case 'home':
      return Icons.home;
    case 'notifications':
      return Icons.notifications;
    case 'star':
      return Icons.star;
    case 'favorite':
      return Icons.favorite;
    case 'share':
      return Icons.share;
    case 'delete':
      return Icons.delete;
    case 'arrow_back':
      return Icons.arrow_back;
    case 'more_vert':
      return Icons.more_vert;
    default:
      return Icons.home;
  }
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Sizes', type: AireIconButton)
Widget buildComparisonSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Xsmall',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.xsmall,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Small',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.small,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Medium',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.medium,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Large',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.large,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - States (Medium)', type: AireIconButton)
Widget buildComparisonStatesUseCase(BuildContext context) {
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
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.medium,
            onPressed: () {},
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
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.medium,
            enabled: false,
          ),
          const SizedBox(height: 24),
          const Text(
            'Hover / Pressed / Focus',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Interactúa con el botón para ver los estados',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.medium,
            onPressed: () {
              // ignore: avoid_print
              print('Interactive button pressed');
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

@widgetbook.UseCase(name: 'Example - Different Icons', type: AireIconButton)
Widget buildDifferentIconsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AireIconButton(
            icon: Icons.notifications,
            size: IconButtonSize.medium,
            onPressed: () {
              // ignore: avoid_print
              print('Notifications pressed');
            },
          ),
          const SizedBox(width: 16),
          AireIconButton(
            icon: Icons.star,
            size: IconButtonSize.medium,
            onPressed: () {
              // ignore: avoid_print
              print('Star pressed');
            },
          ),
          const SizedBox(width: 16),
          AireIconButton(
            icon: Icons.home,
            size: IconButtonSize.medium,
            onPressed: () {
              // ignore: avoid_print
              print('Home pressed');
            },
          ),
          const SizedBox(width: 16),
          AireIconButton(
            icon: Icons.delete,
            size: IconButtonSize.medium,
            enabled: false,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Hover & Focus Demo', type: AireIconButton)
Widget buildInteractiveUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Pasa el mouse sobre los botones y presiona Tab para ver los estados',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AireIconButton(
                icon: Icons.arrow_back,
                size: IconButtonSize.medium,
                onPressed: () {
                  // ignore: avoid_print
                  print('Back pressed');
                },
              ),
              const SizedBox(width: 16),
              AireIconButton(
                icon: Icons.favorite,
                size: IconButtonSize.medium,
                onPressed: () {
                  // ignore: avoid_print
                  print('Favorite pressed');
                },
              ),
              const SizedBox(width: 16),
              AireIconButton(
                icon: Icons.share,
                size: IconButtonSize.medium,
                onPressed: () {
                  // ignore: avoid_print
                  print('Share pressed');
                },
              ),
              const SizedBox(width: 16),
              AireIconButton(
                icon: Icons.more_vert,
                size: IconButtonSize.medium,
                onPressed: () {
                  // ignore: avoid_print
                  print('More pressed');
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
