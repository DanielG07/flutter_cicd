import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';
import '../../atoms/checkbox/aire_checkbox.dart';
import '../../atoms/button/aire_button.dart';

/// Modelo para los items de la lista
class AireListItem {
  final String id;
  final String text;
  final bool isSelected;

  const AireListItem({
    required this.id,
    required this.text,
    this.isSelected = false,
  });

  AireListItem copyWith({
    String? id,
    String? text,
    bool? isSelected,
  }) {
    return AireListItem(
      id: id ?? this.id,
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Enum para los tipos de lista
enum AireListType {
  /// Selección simple (un solo item seleccionado)
  option,

  /// Múltiple selección con checkboxes
  checkbox,
}

/// Widget de Lista con soporte para selección simple y múltiple
///
/// Soporta 2 tipos:
/// - Option: Selección simple con borde azul
/// - Checkbox: Múltiple selección con checkboxes
///
/// Características:
/// - Campo de búsqueda opcional
/// - Botones de acción opcionales (Limpiar/Guardar)
/// - Separadores entre items
/// - Altura máxima configurable con scroll automático
/// - Callback para cambios de selección
class AireList extends StatefulWidget {
  /// Tipo de lista (option o checkbox)
  final AireListType type;

  /// Lista de items
  final List<AireListItem> items;

  /// Callback cuando cambia la selección
  final ValueChanged<List<AireListItem>>? onSelectionChanged;

  /// Si debe mostrar el campo de búsqueda
  final bool showSearch;

  /// Placeholder del campo de búsqueda
  final String searchPlaceholder;

  /// Si debe mostrar los botones de acción (solo para tipo checkbox)
  final bool showActions;

  /// Callback del botón "Limpiar"
  final VoidCallback? onClear;

  /// Callback del botón "Guardar"
  final VoidCallback? onSave;

  /// Texto del botón limpiar
  final String clearButtonText;

  /// Texto del botón guardar
  final String saveButtonText;

  /// Ancho del widget (opcional)
  final double? width;

  /// Altura máxima (cuando se supera, aparece scroll)
  final double? maxHeight;

  const AireList({
    super.key,
    required this.type,
    required this.items,
    this.onSelectionChanged,
    this.showSearch = false,
    this.searchPlaceholder = 'Buscar...',
    this.showActions = false,
    this.onClear,
    this.onSave,
    this.clearButtonText = 'Limpiar',
    this.saveButtonText = 'Guardar',
    this.width,
    this.maxHeight,
  });

  @override
  State<AireList> createState() => _AireListState();
}

class _AireListState extends State<AireList> {
  late List<AireListItem> _items;
  final TextEditingController _searchController = TextEditingController();
  List<AireListItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _filteredItems = List.from(_items);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didUpdateWidget(AireList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _items = List.from(widget.items);
      _onSearchChanged();
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(_items);
      } else {
        _filteredItems = _items
            .where((item) => item.text.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _onItemTap(AireListItem item) {
    setState(() {
      if (widget.type == AireListType.option) {
        // Selección simple: deseleccionar todos y seleccionar el actual
        _items = _items.map((i) {
          return i.copyWith(isSelected: i.id == item.id);
        }).toList();
      } else {
        // Selección múltiple: toggle del item
        _items = _items.map((i) {
          if (i.id == item.id) {
            return i.copyWith(isSelected: !i.isSelected);
          }
          return i;
        }).toList();
      }
      _onSearchChanged(); // Actualizar filtrados
      widget.onSelectionChanged?.call(_items);
    });
  }

  void _onClear() {
    setState(() {
      _items = _items.map((i) => i.copyWith(isSelected: false)).toList();
      _onSearchChanged();
      widget.onSelectionChanged?.call(_items);
    });
    widget.onClear?.call();
  }

  void _onSave() {
    widget.onSave?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: AireColors.white,
        border: Border.all(
          color: AireColors.neutral200,
          width: 1,
        ),
        borderRadius: AireBorderRadius.borderXs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Campo de búsqueda (opcional)
          if (widget.showSearch) _buildSearchField(),

          // Lista de items
          _buildItemsList(),

          // Botones de acción (opcional, solo para checkbox)
          if (widget.showActions && widget.type == AireListType.checkbox)
            _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: AireIconSizes.iconSm,
                color: AireColors.neutral400,
              ),
              AireSpacing.horizontalSpaceXs,
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: AireTextStyles.bodyMediumRegular.copyWith(
                    color: AireColors.neutral700,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.searchPlaceholder,
                    hintStyle: AireTextStyles.placeholderMedium.copyWith(
                      color: AireColors.neutral400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),
              if (_searchController.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AireColors.primary50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 10,
                      color: AireColors.neutral600,
                    ),
                  ),
                ),
            ],
          ),
        ),
        // Separador
        Container(
          height: 1,
          color: AireColors.neutral300,
        ),
      ],
    );
  }

  Widget _buildItemsList() {
    final listContent = _filteredItems.isEmpty && _searchController.text.isNotEmpty
        ? _buildNoResults()
        : ListView.builder(
            shrinkWrap: true,
            physics: widget.maxHeight != null
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              final item = _filteredItems[index];
              final isLast = index == _filteredItems.length - 1;
              return _buildListItem(item, isLast);
            },
          );

    if (widget.maxHeight != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: widget.maxHeight!),
        child: listContent,
      );
    }

    return listContent;
  }

  Widget _buildListItem(AireListItem item, bool isLast) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => _onItemTap(item),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: widget.type == AireListType.option && item.isSelected
                ? BoxDecoration(
                    border: Border.all(
                      color: AireColors.secondary400,
                      width: 2,
                    ),
                    borderRadius: AireBorderRadius.borderXs,
                  )
                : null,
            child: Row(
              children: [
                if (widget.type == AireListType.checkbox) ...[
                  Expanded(
                    child: Text(
                      item.text,
                      style: AireTextStyles.bodyMediumRegular.copyWith(
                        color: AireColors.neutral700,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  AireSpacing.horizontalSpaceXs,
                  AireCheckbox(
                    label: '',
                    state: item.isSelected ? CheckboxState.checked : CheckboxState.unchecked,
                    value: item.isSelected,
                    onChanged: null, // Handled by parent tap
                  ),
                ] else ...[
                  Expanded(
                    child: Text(
                      item.text,
                      style: AireTextStyles.bodyLargeRegular.copyWith(
                        color: AireColors.neutral700,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        // Separador (excepto el último)
        if (!isLast)
          Container(
            height: 1,
            color: AireColors.neutral200,
          ),
      ],
    );
  }

  Widget _buildNoResults() {
    return Padding(
      padding: AireSpacing.allMd,
      child: Center(
        child: Text(
          'Sin resultados para "${_searchController.text}"',
          style: AireTextStyles.bodyMediumRegular.copyWith(
            color: AireColors.neutral400,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Separador
        Container(
          height: 1,
          color: AireColors.neutral200,
        ),
        // Botones
        Padding(
          padding: EdgeInsets.fromLTRB(
            AireSpacing.spacingSm,
            AireSpacing.spacingLg,
            AireSpacing.spacingSm,
            AireSpacing.spacingMd,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Botón Limpiar
              Flexible(
                child: AireButton(
                  text: widget.clearButtonText,
                  variant: ButtonVariant.secondary,
                  size: ButtonSize.small,
                  onPressed: _onClear,
                ),
              ),
              AireSpacing.horizontalSpaceXs,
              // Botón Guardar
              Flexible(
                child: AireButton(
                  text: widget.saveButtonText,
                  variant: ButtonVariant.primary,
                  size: ButtonSize.small,
                  onPressed: _onSave,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
