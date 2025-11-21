// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/avatar/aire_avatar.dart';
import 'package:design_system/src/atoms/avatar/aire_avatar_group.dart';

/// ============================================================
/// INTERACTIVE AVATAR GROUP USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireAvatarGroup)
Widget buildInteractiveAvatarGroupUseCase(BuildContext context) {
  // Size selection
  final size = context.knobs.list(
    label: 'Size',
    options: AvatarSize.values,
    labelBuilder: (s) => '${s.name.toUpperCase()} (${_getSizeInPixels(s)}px)',
    initialOption: AvatarSize.medium,
  );

  // Number of avatars
  final avatarCount = context.knobs.int.slider(
    label: 'Avatar Count',
    initialValue: 4,
    min: 1,
    max: 5,
  );

  // Max visible
  final maxVisible = context.knobs.int.slider(
    label: 'Max Visible',
    initialValue: 4,
    min: 1,
    max: 5,
  );

  // Content type
  final contentType = context.knobs.list(
    label: 'Content Type',
    options: ['Initials', 'Images', 'Mixed'],
    initialOption: 'Initials',
  );

  // Build avatar list
  final avatars = _buildAvatarList(avatarCount, contentType);

  // Has counter
  final hasCounter = context.knobs.boolean(
    label: 'Has Counter (+N)',
    initialValue: true,
  );

  int? totalCount;
  if (hasCounter) {
    totalCount = context.knobs.int.slider(
      label: 'Total Count',
      initialValue: 9,
      min: avatarCount,
      max: 99,
    );
  }

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireAvatarGroup(
        avatars: avatars,
        size: size,
        maxVisible: maxVisible,
        totalCount: totalCount,
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

List<AvatarData> _buildAvatarList(int count, String contentType) {
  final avatars = <AvatarData>[];
  final colors = [
    const Color(0xFF00BEA5), // Teal
    const Color(0xFF2D59F0), // Blue
    const Color(0xFF26BE19), // Green
    const Color(0xFFFB3536), // Red
    const Color(0xFFCF9400), // Yellow
  ];
  final initials = ['EA', 'JD', 'SS', 'MJ', 'AB'];

  for (int i = 0; i < count && i < 5; i++) {
    if (contentType == 'Images') {
      avatars.add(AvatarData(
        imageUrl: 'https://i.pravatar.cc/150?img=${i + 1}',
      ));
    } else if (contentType == 'Mixed') {
      // Alternate between images and initials
      if (i % 2 == 0) {
        avatars.add(AvatarData(
          imageUrl: 'https://i.pravatar.cc/150?img=${i + 1}',
        ));
      } else {
        avatars.add(AvatarData(
          initials: initials[i],
          backgroundColor: colors[i],
        ));
      }
    } else {
      // Initials
      avatars.add(AvatarData(
        initials: initials[i],
        backgroundColor: colors[i],
      ));
    }
  }

  return avatars;
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Sizes', type: AireAvatarGroup)
Widget buildComparisonAllSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Small',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
              AvatarData(initials: 'MJ', backgroundColor: Color(0xFF00BEA5)),
            ],
            size: AvatarSize.small,
            totalCount: 9,
          ),
          const SizedBox(height: 32),
          const Text(
            'Medium',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
              AvatarData(initials: 'MJ', backgroundColor: Color(0xFF00BEA5)),
            ],
            size: AvatarSize.medium,
            totalCount: 9,
          ),
          const SizedBox(height: 32),
          const Text(
            'Large',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
              AvatarData(initials: 'MJ', backgroundColor: Color(0xFF00BEA5)),
            ],
            size: AvatarSize.large,
            totalCount: 9,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Counters', type: AireAvatarGroup)
Widget buildComparisonCountersUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'No Counter',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
            ],
            size: AvatarSize.medium,
          ),
          const SizedBox(height: 32),
          const Text(
            '+1',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
            ],
            size: AvatarSize.medium,
            maxVisible: 3,
            totalCount: 4,
          ),
          const SizedBox(height: 32),
          const Text(
            '+5',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
              AvatarData(initials: 'MJ', backgroundColor: Color(0xFF00BEA5)),
            ],
            size: AvatarSize.medium,
            maxVisible: 4,
            totalCount: 9,
          ),
          const SizedBox(height: 32),
          const Text(
            '+99',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
            ],
            size: AvatarSize.medium,
            maxVisible: 3,
            totalCount: 102,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Content Types', type: AireAvatarGroup)
Widget buildComparisonContentTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Initials',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
              AvatarData(initials: 'MJ', backgroundColor: Color(0xFF00BEA5)),
            ],
            size: AvatarSize.medium,
            totalCount: 9,
          ),
          const SizedBox(height: 32),
          const Text(
            'Images',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=1'),
              AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=2'),
              AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=3'),
              AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=4'),
            ],
            size: AvatarSize.medium,
            maxVisible: 4,
            totalCount: 9,
          ),
          const SizedBox(height: 32),
          const Text(
            'Mixed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 16),
          AireAvatarGroup(
            avatars: const [
              AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=5'),
              AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
              AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=6'),
              AvatarData(initials: 'MJ', backgroundColor: Color(0xFF2D59F0)),
            ],
            size: AvatarSize.medium,
            maxVisible: 4,
            totalCount: 9,
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// INTERACTIVE EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Team Members', type: AireAvatarGroup)
Widget buildInteractiveTeamMembersUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Project Team',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '15 members',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF6B6B6B),
              ),
            ),
            const SizedBox(height: 16),
            AireAvatarGroup(
              avatars: const [
                AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=1'),
                AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=2'),
                AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=3'),
                AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=4'),
                AvatarData(imageUrl: 'https://i.pravatar.cc/150?img=5'),
              ],
              size: AvatarSize.medium,
              maxVisible: 5,
              totalCount: 15,
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Multiple Groups', type: AireAvatarGroup)
Widget buildInteractiveMultipleGroupsUseCase(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Teams',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D59F0),
              ),
            ),
            const SizedBox(height: 24),
            _buildTeamRow(
              'Design Team',
              '8 members',
              const [
                AvatarData(initials: 'JD', backgroundColor: Color(0xFF00BEA5)),
                AvatarData(initials: 'SS', backgroundColor: Color(0xFF2D59F0)),
                AvatarData(initials: 'MJ', backgroundColor: Color(0xFF26BE19)),
              ],
              8,
            ),
            const SizedBox(height: 16),
            _buildTeamRow(
              'Development Team',
              '12 members',
              const [
                AvatarData(initials: 'AB', backgroundColor: Color(0xFFFB3536)),
                AvatarData(initials: 'CD', backgroundColor: Color(0xFFCF9400)),
                AvatarData(initials: 'EF', backgroundColor: Color(0xFF00BEA5)),
              ],
              12,
            ),
            const SizedBox(height: 16),
            _buildTeamRow(
              'Marketing Team',
              '6 members',
              const [
                AvatarData(initials: 'GH', backgroundColor: Color(0xFF2D59F0)),
                AvatarData(initials: 'IJ', backgroundColor: Color(0xFF26BE19)),
                AvatarData(initials: 'KL', backgroundColor: Color(0xFF00BEA5)),
              ],
              6,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildTeamRow(
  String teamName,
  String memberCount,
  List<AvatarData> avatars,
  int totalCount,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teamName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2A2A2A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                memberCount,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ],
          ),
        ),
        AireAvatarGroup(
          avatars: avatars,
          size: AvatarSize.small,
          maxVisible: 3,
          totalCount: totalCount,
        ),
      ],
    ),
  );
}
