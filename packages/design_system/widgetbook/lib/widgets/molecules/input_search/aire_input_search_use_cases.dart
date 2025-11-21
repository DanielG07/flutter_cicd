import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/molecules/input_search/aire_input_search.dart';

/// ============================================================
/// INTERACTIVE INPUT SEARCH USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireInputSearch)
Widget buildInteractiveUseCase(BuildContext context) {
  final sizeOptions = {
    'Default (48px)': InputSearchSize.defaultSize,
    'Small (40px)': InputSearchSize.small,
    'Xsmall (24px)': InputSearchSize.xsmall,
  };

  final selectedSize = context.knobs.list(
    label: 'Size',
    options: sizeOptions.keys.toList(),
    initialOption: 'Small (40px)',
  );

  final hasValue = context.knobs.boolean(
    label: 'Has Value',
    initialValue: false,
  );

  final controller = TextEditingController(
    text: hasValue ? context.knobs.string(
      label: 'Initial Value',
      initialValue: 'Leo',
    ) : '',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireInputSearch(
        controller: controller,
        placeholder: context.knobs.string(
          label: 'Placeholder',
          initialValue: 'Buscar...',
        ),
        enabled: context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        ),
        size: sizeOptions[selectedSize]!,
        width: context.knobs.double.slider(
          label: 'Width',
          initialValue: 233,
          min: 150,
          max: 400,
        ),
        onChanged: (value) {
          debugPrint('Text changed: $value');
        },
        onClear: () {
          debugPrint('Clear button pressed');
        },
        onSubmitted: (value) {
          debugPrint('Search submitted: $value');
        },
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Sizes', type: AireInputSearch)
Widget buildComparisonSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Default (48px)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireInputSearch(
            placeholder: 'Buscar...',
            size: InputSearchSize.defaultSize,
            width: 233,
          ),
          const SizedBox(height: 24),
          const Text(
            'Small (40px)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireInputSearch(
            placeholder: 'Buscar...',
            size: InputSearchSize.small,
            width: 233,
          ),
          const SizedBox(height: 24),
          const Text(
            'Xsmall (24px)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireInputSearch(
            placeholder: 'Buscar...',
            size: InputSearchSize.xsmall,
            width: 233,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - States', type: AireInputSearch)
Widget buildComparisonStatesUseCase(BuildContext context) {
  final controller1 = TextEditingController(text: 'Leo');
  final controller2 = TextEditingController(text: 'Leo');

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Default (Empty)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          const AireInputSearch(
            placeholder: 'Buscar...',
            size: InputSearchSize.small,
            width: 233,
          ),
          const SizedBox(height: 24),
          const Text(
            'Focused with Value (Click to see)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireInputSearch(
            controller: controller1,
            placeholder: 'Buscar...',
            size: InputSearchSize.small,
            width: 233,
            onClear: () {},
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
          AireInputSearch(
            controller: controller2,
            placeholder: 'Buscar...',
            size: InputSearchSize.small,
            enabled: false,
            width: 233,
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Search with Results', type: AireInputSearch)
Widget buildExampleSearchResultsUseCase(BuildContext context) {
  return const _SearchExample();
}

class _SearchExample extends StatefulWidget {
  const _SearchExample();

  @override
  State<_SearchExample> createState() => _SearchExampleState();
}

class _SearchExampleState extends State<_SearchExample> {
  final _controller = TextEditingController();
  final _allItems = [
    'Leonardo DiCaprio',
    'Leon Kennedy',
    'Leopold Mozart',
    'Leona Lewis',
    'Leonardo da Vinci',
    'Leo Messi',
    'Leonard Cohen',
    'Leonidas',
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = _allItems;
      } else {
        _filteredItems = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: 350,
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
              const Text(
                'Search People',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D59F0),
                ),
              ),
              const SizedBox(height: 16),
              AireInputSearch(
                controller: _controller,
                placeholder: 'Type to search...',
                size: InputSearchSize.small,
                onChanged: _filterItems,
                onClear: () {
                  _controller.clear();
                  _filterItems('');
                },
                onSubmitted: (value) {
                  debugPrint('Search submitted: $value');
                },
              ),
              const SizedBox(height: 16),
              if (_filteredItems.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ),
                )
              else
                Container(
                  constraints: const BoxConstraints(maxHeight: 300),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD5D5D5)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _filteredItems.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Color(0xFFD5D5D5),
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _filteredItems[index],
                          style: const TextStyle(fontSize: 14),
                        ),
                        onTap: () {
                          debugPrint('Selected: ${_filteredItems[index]}');
                        },
                        dense: true,
                      );
                    },
                  ),
                ),
              const SizedBox(height: 12),
              Text(
                'Found ${_filteredItems.length} of ${_allItems.length} results',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
