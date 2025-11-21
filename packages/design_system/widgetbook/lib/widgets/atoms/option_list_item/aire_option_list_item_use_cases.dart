import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/option_list_item/aire_option_list_item.dart';

/// ============================================================
/// INTERACTIVE OPTION LIST ITEM USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireOptionListItem)
Widget buildInteractiveOptionListItemUseCase(BuildContext context) {
  // Type selection
  final typeName = context.knobs.list(
    label: 'Type',
    options: ['Option', 'Checkbox', 'Search'],
    initialOption: 'Option',
  );

  // State selection
  final state = context.knobs.list(
    label: 'State',
    options: OptionListItemState.values,
    labelBuilder: (s) => s.name.toUpperCase().replaceAll('STATE', ''),
    initialOption: OptionListItemState.defaultState,
  );

  Widget item;

  if (typeName == 'Option') {
    final text = context.knobs.string(
      label: 'Text',
      initialValue: 'Opción',
    );

    item = AireOptionListItem.option(
      text: text,
      state: state,
      onTap: state != OptionListItemState.disabled ? () {
        debugPrint('Option tapped: $text');
      } : null,
    );
  } else if (typeName == 'Checkbox') {
    final text = context.knobs.string(
      label: 'Text',
      initialValue: 'Text checkbox',
    );

    final isChecked = context.knobs.boolean(
      label: 'Checked',
      initialValue: false,
    );

    item = AireOptionListItem.checkbox(
      text: text,
      state: state,
      isChecked: isChecked,
      onChanged: state != OptionListItemState.disabled ? (value) {
        debugPrint('Checkbox changed to: $value');
      } : null,
    );
  } else {
    // Search
    final placeholder = context.knobs.string(
      label: 'Placeholder',
      initialValue: 'Buscar...',
    );

    final hasValue = context.knobs.boolean(
      label: 'Has Value',
      initialValue: false,
    );

    String? value;
    if (hasValue) {
      value = context.knobs.string(
        label: 'Value',
        initialValue: 'Leo',
      );
    }

    final isFocused = context.knobs.boolean(
      label: 'Is Focused',
      initialValue: false,
    );

    item = AireOptionListItem.search(
      placeholder: placeholder,
      value: value,
      state: state,
      isFocused: isFocused,
      onSearchChanged: state != OptionListItemState.disabled ? (searchValue) {
        debugPrint('Search changed: $searchValue');
      } : null,
      onClear: hasValue && state != OptionListItemState.disabled ? () {
        debugPrint('Clear search');
      } : null,
    );
  }

  return Center(
    child: Container(
      width: 242,
      child: item,
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - Option States', type: AireOptionListItem)
Widget buildComparisonOptionStatesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Default',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 242,
            child: AireOptionListItem.option(
              text: 'Opción',
              state: OptionListItemState.defaultState,
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Hover',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 242,
            child: AireOptionListItem.option(
              text: 'Opción',
              state: OptionListItemState.hover,
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Selected',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 242,
            child: AireOptionListItem.option(
              text: 'Opción',
              state: OptionListItemState.selected,
              onTap: () {},
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Types', type: AireOptionListItem)
Widget buildComparisonAllTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Option',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 242,
            child: AireOptionListItem.option(
              text: 'Opción',
              onTap: () {},
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Checkbox',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 242,
            child: AireOptionListItem.checkbox(
              text: 'Text checkbox',
              isChecked: false,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Search',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 242,
            child: AireOptionListItem.search(
              placeholder: 'Buscar...',
              onSearchChanged: (value) {},
            ),
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Option List', type: AireOptionListItem)
Widget buildExampleOptionListUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select an option',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD5D5D5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                AireOptionListItem.option(
                  text: 'Option 1',
                  state: OptionListItemState.selected,
                  onTap: () {},
                ),
                AireOptionListItem.option(
                  text: 'Option 2',
                  onTap: () {},
                ),
                AireOptionListItem.option(
                  text: 'Option 3',
                  onTap: () {},
                ),
                AireOptionListItem.option(
                  text: 'Option 4',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Checkbox List', type: AireOptionListItem)
Widget buildExampleCheckboxListUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select multiple',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD5D5D5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                AireOptionListItem.checkbox(
                  text: 'Flutter',
                  isChecked: true,
                  onChanged: (value) {},
                ),
                AireOptionListItem.checkbox(
                  text: 'React',
                  isChecked: false,
                  onChanged: (value) {},
                ),
                AireOptionListItem.checkbox(
                  text: 'Vue',
                  isChecked: true,
                  onChanged: (value) {},
                ),
                AireOptionListItem.checkbox(
                  text: 'Angular',
                  isChecked: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Example - Searchable List', type: AireOptionListItem)
Widget buildExampleSearchableListUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Search and select',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D59F0),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD5D5D5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                AireOptionListItem.search(
                  value: 'Leo',
                  onSearchChanged: (value) {},
                  onClear: () {},
                ),
                AireOptionListItem.option(
                  text: 'Leonardo',
                  state: OptionListItemState.selected,
                  onTap: () {},
                ),
                AireOptionListItem.option(
                  text: 'Leon',
                  onTap: () {},
                ),
                AireOptionListItem.option(
                  text: 'Leopold',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
