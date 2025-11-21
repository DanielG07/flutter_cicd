// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/avatar/aire_avatar.dart';

/// ============================================================
/// INTERACTIVE AVATAR USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireAvatar)
Widget buildInteractiveAvatarUseCase(BuildContext context) {
  // Size selection
  final size = context.knobs.list(
    label: 'Size',
    options: AvatarSize.values,
    labelBuilder: (s) => '${s.name.toUpperCase()} (${_getSizeInPixels(s)}px)',
    initialOption: AvatarSize.large,
  );

  // Content type
  final contentType = context.knobs.list(
    label: 'Content Type',
    options: ['Initials', 'Image'],
    initialOption: 'Initials',
  );

  String? imageUrl;
  String? initials;

  if (contentType == 'Image') {
    final imageNumber = context.knobs.int.slider(
      label: 'Image Number',
      initialValue: 1,
      min: 1,
      max: 10,
    );
    imageUrl = 'https://i.pravatar.cc/150?img=$imageNumber';
  } else {
    initials = context.knobs.string(
      label: 'Initials',
      initialValue: 'EA',
    );
  }

  // Background color (only for initials)
  final colorName = context.knobs.list(
    label: 'Background Color',
    options: ['Teal', 'Blue', 'Green', 'Red', 'Yellow'],
    initialOption: 'Teal',
  );
  final backgroundColor = _getColorFromName(colorName);

  // Badge type
  final badgeType = context.knobs.list(
    label: 'Badge Type',
    options: AvatarBadgeType.values,
    labelBuilder: (b) => b.name.toUpperCase(),
    initialOption: AvatarBadgeType.none,
  );

  String? badgeText;
  IconData? badgeIcon;

  if (badgeType == AvatarBadgeType.text) {
    badgeText = context.knobs.string(
      label: 'Badge Text',
      initialValue: '4',
    );
  } else if (badgeType == AvatarBadgeType.icon) {
    final iconName = context.knobs.list(
      label: 'Badge Icon',
      options: ['check', 'close', 'star', 'favorite', 'notifications'],
      initialOption: 'check',
    );
    badgeIcon = _getIconFromName(iconName);
  }

  // Optional text alongside avatar
  final hasText = context.knobs.boolean(
    label: 'Has Text',
    initialValue: false,
  );

  String? text;
  if (hasText) {
    text = context.knobs.string(
      label: 'Text',
      initialValue: 'Text',
    );
  }

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireAvatar(
        imageUrl: imageUrl,
        initials: initials,
        size: size,
        backgroundColor: backgroundColor,
        badgeType: badgeType,
        badgeText: badgeText,
        badgeIcon: badgeIcon,
        text: text,
      ),
    ),
  );
}

String _getSizeInPixels(AvatarSize size) {
  switch (size) {
    case AvatarSize.small:
      return '24';
    case AvatarSize.medium:
      return '32';
    case AvatarSize.large:
      return '40';
  }
}

Color _getColorFromName(String name) {
  switch (name) {
    case 'Teal':
      return const Color(0xFF00BEA5); // Secondary 400
    case 'Blue':
      return const Color(0xFF2D59F0); // Primary 400
    case 'Green':
      return const Color(0xFF26BE19); // Success 400
    case 'Red':
      return const Color(0xFFFB3536); // Error 300
    case 'Yellow':
      return const Color(0xFFCF9400); // Warning 500
    default:
      return const Color(0xFF00BEA5);
  }
}

IconData _getIconFromName(String name) {
  switch (name) {
    case 'check':
      return Icons.check;
    case 'close':
      return Icons.close;
    case 'star':
      return Icons.star;
    case 'favorite':
      return Icons.favorite;
    case 'notifications':
      return Icons.notifications;
    default:
      return Icons.check;
  }
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Sizes', type: AireAvatar)
Widget buildComparisonAllSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '24px',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.small,
            backgroundColor: const Color(0xFF00BEA5),
          ),
          const SizedBox(height: 32),
          const Text(
            '32px',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.medium,
            backgroundColor: const Color(0xFF00BEA5),
          ),
          const SizedBox(height: 32),
          const Text(
            '40px',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.large,
            backgroundColor: const Color(0xFF00BEA5),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Types', type: AireAvatar)
Widget buildComparisonAllTypesUseCase(BuildContext context) {
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
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.large,
            backgroundColor: const Color(0xFF00BEA5),
          ),
          const SizedBox(height: 32),
          const Text(
            'Dot Badge',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.large,
            backgroundColor: const Color(0xFF00BEA5),
            badgeType: AvatarBadgeType.dot,
          ),
          const SizedBox(height: 32),
          const Text(
            'Text Badge',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.large,
            backgroundColor: const Color(0xFF00BEA5),
            badgeType: AvatarBadgeType.text,
            badgeText: '4',
          ),
          const SizedBox(height: 32),
          const Text(
            'Icon Badge',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.large,
            backgroundColor: const Color(0xFF00BEA5),
            badgeType: AvatarBadgeType.icon,
            badgeIcon: Icons.check,
          ),
          const SizedBox(height: 32),
          const Text(
            'Avatar + Text',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatar(
            initials: 'EA',
            size: AvatarSize.large,
            backgroundColor: const Color(0xFF00BEA5),
            text: 'Text',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Colors', type: AireAvatar)
Widget buildComparisonAllColorsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: [
          Column(
            children: [
              const Text('Teal', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 8),
              AireAvatar(
                initials: 'EA',
                size: AvatarSize.large,
                backgroundColor: const Color(0xFF00BEA5),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Blue', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 8),
              AireAvatar(
                initials: 'EA',
                size: AvatarSize.large,
                backgroundColor: const Color(0xFF2D59F0),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Green', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 8),
              AireAvatar(
                initials: 'EA',
                size: AvatarSize.large,
                backgroundColor: const Color(0xFF26BE19),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Red', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 8),
              AireAvatar(
                initials: 'EA',
                size: AvatarSize.large,
                backgroundColor: const Color(0xFFFB3536),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Yellow', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 8),
              AireAvatar(
                initials: 'EA',
                size: AvatarSize.large,
                backgroundColor: const Color(0xFFCF9400),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// INTERACTIVE EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - User Profile', type: AireAvatar)
Widget buildInteractiveUserProfileUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AireAvatar(
              imageUrl: 'https://i.pravatar.cc/150?img=5',
              size: AvatarSize.large,
              badgeType: AvatarBadgeType.dot,
            ),
            const SizedBox(height: 16),
            const Text(
              'Emma Anderson',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2A2A2A),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Online',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF26BE19),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Notification List', type: AireAvatar)
Widget buildInteractiveNotificationListUseCase(BuildContext context) {
  final notifications = [
    {'name': 'John Doe', 'badge': '3', 'initials': 'JD'},
    {'name': 'Sarah Smith', 'badge': '1', 'initials': 'SS'},
    {'name': 'Mike Johnson', 'badge': '12', 'initials': 'MJ'},
  ];

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 16),
            ...notifications.map((notif) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      AireAvatar(
                        initials: notif['initials']!,
                        size: AvatarSize.medium,
                        backgroundColor: const Color(0xFF00BEA5),
                        badgeType: AvatarBadgeType.text,
                        badgeText: notif['badge']!,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notif['name']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2A2A2A),
                              ),
                            ),
                            Text(
                              '${notif['badge']} new messages',
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
                )),
          ],
        ),
      ),
    ),
  );
}
