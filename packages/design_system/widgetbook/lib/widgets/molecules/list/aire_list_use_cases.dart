import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/molecules/list/aire_list.dart';

/// ============================================================
/// INTERACTIVE LIST USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireList)
Widget buildInteractiveUseCase(BuildContext context) {
  final typeOptions = {
    'Option (Single Select)': AireListType.option,
    'Checkbox (Multi Select)': AireListType.checkbox,
  };

  final selectedType = context.knobs.list(
    label: 'Type',
    options: typeOptions.keys.toList(),
    initialOption: 'Option (Single Select)',
  );

  final showSearch = context.knobs.boolean(
    label: 'Show Search',
    initialValue: false,
  );

  final showActions = context.knobs.boolean(
    label: 'Show Action Buttons',
    initialValue: false,
  );

  final hasMaxHeight = context.knobs.boolean(
    label: 'Enable Max Height (Scroll)',
    initialValue: false,
  );

  final itemCount = context.knobs.int.slider(
    label: 'Number of Items',
    initialValue: 4,
    min: 0,
    max: 10,
  );

  final items = List.generate(
    itemCount,
    (index) => AireListItem(
      id: '${index + 1}',
      text: typeOptions[selectedType] == AireListType.checkbox
          ? 'Text checkbox ${index + 1}'
          : 'Opción ${index + 1}',
      isSelected: index == 0,
    ),
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireList(
        type: typeOptions[selectedType]!,
        width: context.knobs.double.slider(
          label: 'Width',
          initialValue: 278,
          min: 200,
          max: 400,
        ),
        maxHeight: hasMaxHeight ? context.knobs.double.slider(
          label: 'Max Height',
          initialValue: 180,
          min: 100,
          max: 300,
        ) : null,
        showSearch: showSearch,
        searchPlaceholder: context.knobs.string(
          label: 'Search Placeholder',
          initialValue: 'Buscar...',
        ),
        showActions: showActions && typeOptions[selectedType] == AireListType.checkbox,
        items: items,
        clearButtonText: context.knobs.string(
          label: 'Clear Button Text',
          initialValue: 'Limpiar',
        ),
        saveButtonText: context.knobs.string(
          label: 'Save Button Text',
          initialValue: 'Guardar',
        ),
        onSelectionChanged: (selectedItems) {
          debugPrint('Selected: ${selectedItems.where((i) => i.isSelected).map((i) => i.text).toList()}');
        },
        onClear: () {
          debugPrint('Cleared all selections');
        },
        onSave: () {
          debugPrint('Saved selections');
        },
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - Types', type: AireList)
Widget buildComparisonTypesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Text(
                'Option (Single Select)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5F6C8E),
                ),
              ),
              const SizedBox(height: 8),
              AireList(
                type: AireListType.option,
                width: 278,
                items: const [
                  AireListItem(id: '1', text: 'Opción 1', isSelected: true),
                  AireListItem(id: '2', text: 'Opción 2'),
                  AireListItem(id: '3', text: 'Opción 3'),
                  AireListItem(id: '4', text: 'Opción 4'),
                ],
                onSelectionChanged: (items) {
                  debugPrint('Option selected: ${items.where((i) => i.isSelected).map((i) => i.text)}');
                },
              ),
            ],
          ),
          const SizedBox(width: 32),
          Column(
            children: [
              const Text(
                'Checkbox (Multi Select)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5F6C8E),
                ),
              ),
              const SizedBox(height: 8),
              AireList(
                type: AireListType.checkbox,
                width: 278,
                showActions: true,
                items: const [
                  AireListItem(id: '1', text: 'Text checkbox 1', isSelected: true),
                  AireListItem(id: '2', text: 'Text checkbox 2'),
                  AireListItem(id: '3', text: 'Text checkbox 3', isSelected: true),
                  AireListItem(id: '4', text: 'Text checkbox 4'),
                ],
                onSelectionChanged: (items) {
                  debugPrint('Checkboxes selected: ${items.where((i) => i.isSelected).map((i) => i.text)}');
                },
                onClear: () {
                  debugPrint('Cleared');
                },
                onSave: () {
                  debugPrint('Saved');
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Features', type: AireList)
Widget buildComparisonFeaturesUseCase(BuildContext context) {
  final items = const [
    AireListItem(id: '1', text: 'Opción 1'),
    AireListItem(id: '2', text: 'Opción 2'),
    AireListItem(id: '3', text: 'Opción 3'),
    AireListItem(id: '4', text: 'Opción 4'),
    AireListItem(id: '5', text: 'Opción 5'),
    AireListItem(id: '6', text: 'Opción 6'),
  ];

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Simple List',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireList(
            type: AireListType.option,
            width: 278,
            items: items.take(4).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'With Search',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireList(
            type: AireListType.option,
            width: 278,
            showSearch: true,
            searchPlaceholder: 'Buscar...',
            items: items,
          ),
          const SizedBox(height: 24),
          const Text(
            'With Scroll (Max Height)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireList(
            type: AireListType.option,
            width: 278,
            maxHeight: 150,
            items: items,
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Task Manager', type: AireList)
Widget buildExampleTaskManagerUseCase(BuildContext context) {
  return const _TaskManagerExample();
}

class _TaskManagerExample extends StatefulWidget {
  const _TaskManagerExample();

  @override
  State<_TaskManagerExample> createState() => _TaskManagerExampleState();
}

class _TaskManagerExampleState extends State<_TaskManagerExample> {
  List<AireListItem> _tasks = [
    const AireListItem(id: '1', text: 'Complete project documentation'),
    const AireListItem(id: '2', text: 'Review pull requests'),
    const AireListItem(id: '3', text: 'Update design system'),
    const AireListItem(id: '4', text: 'Fix production bugs'),
    const AireListItem(id: '5', text: 'Attend team meeting'),
    const AireListItem(id: '6', text: 'Write unit tests'),
    const AireListItem(id: '7', text: 'Deploy to staging'),
    const AireListItem(id: '8', text: 'Update dependencies'),
  ];

  int get _selectedCount => _tasks.where((t) => t.isSelected).length;

  void _handleSelectionChanged(List<AireListItem> items) {
    setState(() {
      _tasks = items;
    });
  }

  void _handleClear() {
    setState(() {
      _tasks = _tasks.map((t) => t.copyWith(isSelected: false)).toList();
    });
  }

  void _handleComplete() {
    final completed = _tasks.where((t) => t.isSelected).toList();
    setState(() {
      _tasks = _tasks.where((t) => !t.isSelected).toList();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Completed ${completed.length} task(s)'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: 450,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D59F0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EDFD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${_tasks.length} total',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D59F0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_selectedCount > 0)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF00BEA5),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '$_selectedCount task(s) selected',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2A2A2A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_tasks.isEmpty)
                Container(
                  padding: const EdgeInsets.all(32),
                  child: const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.task_alt,
                          size: 48,
                          color: Color(0xFF00BEA5),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'All tasks completed!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2A2A2A),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Great job! You have no pending tasks.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B6B6B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              else
                AireList(
                  type: AireListType.checkbox,
                  width: double.infinity,
                  maxHeight: 300,
                  showSearch: true,
                  showActions: true,
                  searchPlaceholder: 'Search tasks...',
                  clearButtonText: 'Deselect All',
                  saveButtonText: 'Complete',
                  items: _tasks,
                  onSelectionChanged: _handleSelectionChanged,
                  onClear: _handleClear,
                  onSave: _handleComplete,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
