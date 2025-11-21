import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/badge/aire_badge.dart';

/// ============================================================
/// INTERACTIVE BADGE USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireBadge)
Widget buildInteractiveBadgeUseCase(BuildContext context) {
  // Variant selection
  final variantName = context.knobs.list(
    label: 'Variant',
    options: ['Dot', 'Number', 'Icon'],
    initialOption: 'Dot',
  );

  // Color selection
  final color = context.knobs.list(
    label: 'Color',
    options: BadgeColor.values,
    labelBuilder: (c) => c.name.toUpperCase(),
    initialOption: BadgeColor.error,
  );

  Widget badge;

  switch (variantName) {
    case 'Dot':
      badge = AireBadge.dot(color: color);
      break;

    case 'Number':
      final count = context.knobs.int.slider(
        label: 'Count',
        initialValue: 5,
        min: 0,
        max: 150,
      );
      badge = AireBadge.number(count: count, color: color);
      break;

    case 'Icon':
      final iconName = context.knobs.list(
        label: 'Icon',
        options: ['check', 'close', 'info', 'priority_high', 'circle', 'star'],
        initialOption: 'check',
      );

      final iconData = _getIconFromName(iconName);
      badge = AireBadge.icon(icon: iconData, color: color);
      break;

    default:
      badge = AireBadge.dot(color: color);
  }

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: badge,
    ),
  );
}

IconData _getIconFromName(String name) {
  switch (name) {
    case 'check':
      return Icons.check;
    case 'close':
      return Icons.close;
    case 'info':
      return Icons.info;
    case 'priority_high':
      return Icons.priority_high;
    case 'circle':
      return Icons.circle;
    case 'star':
      return Icons.star;
    default:
      return Icons.check;
  }
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Variants', type: AireBadge)
Widget buildComparisonVariantsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dot',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireBadge.dot(color: BadgeColor.error),
          const SizedBox(height: 24),
          const Text(
            'Number',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireBadge.number(count: 5, color: BadgeColor.error),
          const SizedBox(height: 24),
          const Text(
            'Icon',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              AireBadge.icon(icon: Icons.circle, color: BadgeColor.primary),
              const SizedBox(width: 12),
              AireBadge.icon(icon: Icons.check, color: BadgeColor.success),
              const SizedBox(width: 12),
              AireBadge.icon(icon: Icons.close, color: BadgeColor.error),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Colors (Dot)', type: AireBadge)
Widget buildComparisonColorsDotUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          AireBadge.dot(color: BadgeColor.error),
          const SizedBox(height: 16),
          const Text(
            'Primary',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireBadge.dot(color: BadgeColor.primary),
          const SizedBox(height: 16),
          const Text(
            'Success',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireBadge.dot(color: BadgeColor.success),
          const SizedBox(height: 16),
          const Text(
            'Warning',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireBadge.dot(color: BadgeColor.warning),
          const SizedBox(height: 16),
          const Text(
            'Info',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireBadge.dot(color: BadgeColor.info),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - With Icon Button', type: AireBadge)
Widget buildExampleWithIconButtonUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Icon(
                  Icons.notifications,
                  size: 20,
                  color: Color(0xFF2D59F0),
                ),
              ),
              Positioned(
                right: -2,
                top: -2,
                child: AireBadge.number(count: 5, color: BadgeColor.error),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Icon(
                  Icons.mail,
                  size: 20,
                  color: Color(0xFF2D59F0),
                ),
              ),
              Positioned(
                right: -2,
                top: -2,
                child: AireBadge.number(count: 99, color: BadgeColor.error),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - With Avatar', type: AireBadge)
Widget buildExampleWithAvatarUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF00BEA5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Text(
                'JD',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            right: -4,
            top: -4,
            child: AireBadge.number(count: 5, color: BadgeColor.error),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Multiple Badges', type: AireBadge)
Widget buildExampleMultipleBadgesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Notification Center',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNotificationItem(
                Icons.notifications,
                'Alerts',
                5,
                BadgeColor.error,
              ),
              _buildNotificationItem(
                Icons.mail,
                'Messages',
                12,
                BadgeColor.primary,
              ),
              _buildNotificationItem(
                Icons.shopping_cart,
                'Cart',
                3,
                BadgeColor.success,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildNotificationItem(
  IconData icon,
  String label,
  int count,
  BadgeColor badgeColor,
) {
  return Column(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Icon(
              icon,
              size: 24,
              color: const Color(0xFF2D59F0),
            ),
          ),
          Positioned(
            right: -4,
            top: -4,
            child: AireBadge.number(count: count, color: badgeColor),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF6B6B6B),
        ),
      ),
    ],
  );
}
