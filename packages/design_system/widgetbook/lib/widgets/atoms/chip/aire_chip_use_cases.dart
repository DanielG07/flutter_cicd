import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/chip/aire_chip.dart';

/// ============================================================
/// INTERACTIVE CHIP USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireChip)
Widget buildInteractiveChipUseCase(BuildContext context) {
  // Type selection
  final typeName = context.knobs.list(
    label: 'Type',
    options: ['FILTER', 'INPUT'],
    initialOption: 'FILTER',
  );

  final text = context.knobs.string(
    label: 'Text',
    initialValue: 'Chip text',
  );

  if (typeName == 'FILTER') {
    // Filter chip specific knobs
    final stateName = context.knobs.list(
      label: 'State',
      options: ['DEFAULT', 'ACTIVE', 'HOVER'],
      initialOption: 'DEFAULT',
    );

    final iconName = context.knobs.list(
      label: 'Leading Icon',
      options: ['none', 'check_circle', 'check_circle_outline', 'local_offer', 'local_shipping', 'inventory_2'],
      initialOption: 'check_circle_outline',
    );

    final state = _getStateFromName(stateName);
    final leadingIcon = iconName == 'none' ? null : _getIconFromName(iconName);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AireChip.filter(
          text: text,
          leadingIcon: leadingIcon,
          state: state,
          onTap: () {
            debugPrint('Filter chip tapped');
          },
        ),
      ),
    );
  } else {
    // Input chip specific knobs
    final removable = context.knobs.boolean(
      label: 'Removable',
      initialValue: true,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AireChip.input(
          text: text,
          removable: removable,
          onRemove: removable ? () {
            debugPrint('Chip removed');
          } : null,
        ),
      ),
    );
  }
}

ChipState _getStateFromName(String name) {
  switch (name) {
    case 'ACTIVE':
      return ChipState.active;
    case 'HOVER':
      return ChipState.hover;
    case 'DEFAULT':
    default:
      return ChipState.defaultState;
  }
}

IconData _getIconFromName(String name) {
  switch (name) {
    case 'check_circle':
      return Icons.check_circle;
    case 'check_circle_outline':
      return Icons.check_circle_outline;
    case 'local_offer':
      return Icons.local_offer;
    case 'local_shipping':
      return Icons.local_shipping;
    case 'inventory_2':
      return Icons.inventory_2;
    default:
      return Icons.check_circle_outline;
  }
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - Filter States', type: AireChip)
Widget buildComparisonFilterStatesUseCase(BuildContext context) {
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
          AireChip.filter(
            text: 'Chip text',
            leadingIcon: Icons.check_circle_outline,
            state: ChipState.defaultState,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Active',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireChip.filter(
            text: 'Chip text',
            leadingIcon: Icons.check_circle,
            state: ChipState.active,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Hover',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireChip.filter(
            text: 'Chip text',
            leadingIcon: Icons.check_circle_outline,
            state: ChipState.hover,
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Types', type: AireChip)
Widget buildComparisonTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Chip',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 16),
          AireChip.filter(
            text: 'Chip text',
            leadingIcon: Icons.check_circle_outline,
            state: ChipState.defaultState,
            onTap: () {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Input Chip',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 16),
          AireChip.input(
            text: 'Text',
            removable: false,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Input Removable', type: AireChip)
Widget buildComparisonInputRemovableUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Not Removable (Off)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireChip.input(
            text: 'Text',
            removable: false,
          ),
          const SizedBox(height: 24),
          const Text(
            'Removable (On)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireChip.input(
            text: 'Text',
            removable: true,
            onRemove: () {
              // ignore: avoid_print
              print('Chip removed');
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

@widgetbook.UseCase(name: 'Example - Filter List', type: AireChip)
Widget buildExampleFilterListUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Filters',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AireChip.filter(
                text: 'Electronics',
                leadingIcon: Icons.check_circle,
                state: ChipState.active,
                onTap: () {},
              ),
              AireChip.filter(
                text: 'Price: \$0-\$50',
                leadingIcon: Icons.check_circle,
                state: ChipState.active,
                onTap: () {},
              ),
              AireChip.filter(
                text: 'Books',
                leadingIcon: Icons.check_circle_outline,
                state: ChipState.defaultState,
                onTap: () {},
              ),
              AireChip.filter(
                text: 'Clothing',
                leadingIcon: Icons.check_circle_outline,
                state: ChipState.defaultState,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Tags Input', type: AireChip)
Widget buildExampleTagsInputUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selected Tags',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AireChip.input(
                text: 'Flutter',
                removable: true,
                onRemove: () {
                  // ignore: avoid_print
                  print('Remove Flutter');
                },
              ),
              AireChip.input(
                text: 'Dart',
                removable: true,
                onRemove: () {
                  // ignore: avoid_print
                  print('Remove Dart');
                },
              ),
              AireChip.input(
                text: 'Mobile Development',
                removable: true,
                onRemove: () {
                  // ignore: avoid_print
                  print('Remove Mobile Development');
                },
              ),
              AireChip.input(
                text: 'UI/UX',
                removable: true,
                onRemove: () {
                  // ignore: avoid_print
                  print('Remove UI/UX');
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Mixed Types', type: AireChip)
Widget buildExampleMixedTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Product Filters',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AireChip.filter(
                text: 'On Sale',
                leadingIcon: Icons.local_offer,
                state: ChipState.active,
                onTap: () {},
              ),
              AireChip.filter(
                text: 'Free Shipping',
                leadingIcon: Icons.local_shipping,
                state: ChipState.active,
                onTap: () {},
              ),
              AireChip.filter(
                text: 'In Stock',
                leadingIcon: Icons.inventory_2,
                state: ChipState.defaultState,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Selected Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AireChip.input(
                text: 'Laptops',
                removable: true,
                onRemove: () {},
              ),
              AireChip.input(
                text: 'Accessories',
                removable: true,
                onRemove: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
