import 'package:flutter/material.dart';

/// Enum para los tipos de option list item
enum OptionListItemType {
  option,
  checkbox,
  search,
}

/// Enum para los estados del option list item
enum OptionListItemState {
  defaultState,
  hover,
  focused,
  selected,
  selectedHover,
  disabled,
}

/// Configuración de estilo para cada estado
class _OptionListItemStateConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? borderWidth;
  final double borderRadius;

  const _OptionListItemStateConfig({
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 0,
  });

  static _OptionListItemStateConfig fromState(OptionListItemState state) {
    switch (state) {
      case OptionListItemState.defaultState:
        return const _OptionListItemStateConfig(
          backgroundColor: Colors.white,
          textColor: Color(0xFF2A2A2A),
        );
      case OptionListItemState.hover:
        return const _OptionListItemStateConfig(
          backgroundColor: Color(0xFFF6F6F6),
          textColor: Color(0xFF2A2A2A),
        );
      case OptionListItemState.focused:
        return const _OptionListItemStateConfig(
          backgroundColor: Color(0xFFF6F6F6),
          textColor: Color(0xFF2A2A2A),
          borderColor: Color(0xFF00BEA5),
          borderWidth: 2,
          borderRadius: 8,
        );
      case OptionListItemState.selected:
        return const _OptionListItemStateConfig(
          backgroundColor: Color(0xFF2D59F0),
          textColor: Colors.white,
        );
      case OptionListItemState.selectedHover:
        return const _OptionListItemStateConfig(
          backgroundColor: Color(0xFF001C7C),
          textColor: Colors.white,
        );
      case OptionListItemState.disabled:
        return const _OptionListItemStateConfig(
          backgroundColor: Color(0xFFF6F6F6),
          textColor: Color(0xFFAAAAAA),
        );
    }
  }
}

/// Widget de option list item atom con múltiples variantes y estados
///
/// Soporta 3 tipos: Option, Checkbox, Search
/// Soporta múltiples estados: Default, Hover, Focused, Selected, etc.
///
/// Ejemplo de uso:
/// ```dart
/// // Option simple
/// AireOptionListItem.option(
///   text: 'Opción',
///   state: OptionListItemState.defaultState,
///   onTap: () => print('Tapped'),
/// )
///
/// // Checkbox
/// AireOptionListItem.checkbox(
///   text: 'Text checkbox',
///   isChecked: false,
///   onChanged: (value) => print('Checked: $value'),
/// )
///
/// // Search
/// AireOptionListItem.search(
///   placeholder: 'Buscar...',
///   value: '',
///   onChanged: (value) => print('Search: $value'),
/// )
/// ```
class AireOptionListItem extends StatelessWidget {
  /// Texto del item
  final String text;

  /// Tipo del item
  final OptionListItemType type;

  /// Estado del item
  final OptionListItemState state;

  /// Callback cuando se presiona el item (para option)
  final VoidCallback? onTap;

  /// Si el checkbox está marcado (para checkbox)
  final bool isChecked;

  /// Callback cuando cambia el checkbox
  final ValueChanged<bool>? onChanged;

  /// Placeholder para search
  final String? placeholder;

  /// Valor actual del search
  final String? value;

  /// Callback cuando cambia el valor del search
  final ValueChanged<String>? onSearchChanged;

  /// Callback cuando se presiona el botón de limpiar (search)
  final VoidCallback? onClear;

  /// Si el search está enfocado
  final bool isFocused;

  /// Constructor para Option
  const AireOptionListItem.option({
    super.key,
    required this.text,
    this.state = OptionListItemState.defaultState,
    this.onTap,
  })  : type = OptionListItemType.option,
        isChecked = false,
        onChanged = null,
        placeholder = null,
        value = null,
        onSearchChanged = null,
        onClear = null,
        isFocused = false;

  /// Constructor para Checkbox
  const AireOptionListItem.checkbox({
    super.key,
    required this.text,
    this.state = OptionListItemState.defaultState,
    this.isChecked = false,
    this.onChanged,
  })  : type = OptionListItemType.checkbox,
        onTap = null,
        placeholder = null,
        value = null,
        onSearchChanged = null,
        onClear = null,
        isFocused = false;

  /// Constructor para Search
  const AireOptionListItem.search({
    super.key,
    this.placeholder = 'Buscar...',
    this.value,
    this.state = OptionListItemState.defaultState,
    this.onSearchChanged,
    this.onClear,
    this.isFocused = false,
  })  : type = OptionListItemType.search,
        text = '',
        onTap = null,
        isChecked = false,
        onChanged = null;

  @override
  Widget build(BuildContext context) {
    final config = _OptionListItemStateConfig.fromState(state);

    Widget content;

    switch (type) {
      case OptionListItemType.option:
        content = _buildOption(config);
        break;
      case OptionListItemType.checkbox:
        content = _buildCheckbox(config);
        break;
      case OptionListItemType.search:
        content = _buildSearch(config);
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        content,
        // Línea separadora
        Container(
          height: 1,
          color: _getSeparatorColor(),
        ),
      ],
    );
  }

  Widget _buildOption(_OptionListItemStateConfig config) {
    Widget container = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: config.borderRadius > 0
            ? BorderRadius.circular(config.borderRadius)
            : null,
        border: config.borderColor != null && config.borderWidth != null
            ? Border.all(
                color: config.borderColor!,
                width: config.borderWidth!,
              )
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Figtree',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
          letterSpacing: 0.25,
          color: config.textColor,
        ),
      ),
    );

    if (state != OptionListItemState.disabled && onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: container,
      );
    }

    return container;
  }

  Widget _buildCheckbox(_OptionListItemStateConfig config) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: config.backgroundColor,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Figtree',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 16 / 14,
              color: config.textColor,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: state != OptionListItemState.disabled
                ? () => onChanged?.call(!isChecked)
                : null,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: _buildCheckboxIcon(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxIcon() {
    if (state == OptionListItemState.disabled) {
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: const Color(0xFFEAEAEA),
          border: Border.all(
            color: const Color(0xFFD5D5D5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      );
    }

    if (isChecked) {
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: const Color(0xFF2D59F0),
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Icon(
          Icons.check,
          size: 12,
          color: Colors.white,
        ),
      );
    }

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        border: Border.all(
          color: state == OptionListItemState.focused
              ? const Color(0xFF00BEA5)
              : const Color(0xFF4C4C4C),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildSearch(_OptionListItemStateConfig config) {
    final hasValue = value != null && value!.isNotEmpty;
    final displayText = hasValue ? value! : placeholder ?? 'Buscar...';
    final textColor =
        hasValue ? const Color(0xFF2A2A2A) : const Color(0xFFAAAAAA);

    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        border: config.borderColor != null
            ? Border(
                bottom: BorderSide(
                  color: config.borderColor!,
                  width: 2,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 14,
            color: state == OptionListItemState.hover
                ? const Color(0xFF6B6B6B)
                : const Color(0xFFAAAAAA),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              displayText,
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 20 / 14,
                letterSpacing: 0.25,
                color: textColor,
              ),
            ),
          ),
          if (hasValue && state != OptionListItemState.disabled)
            GestureDetector(
              onTap: onClear,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 10,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getSeparatorColor() {
    if (type == OptionListItemType.search) {
      if (state == OptionListItemState.disabled) {
        return const Color(0xFFEAEAEA);
      }
      if (state == OptionListItemState.focused || isFocused) {
        return const Color(0xFF00BEA5);
      }
      if (value != null && value!.isNotEmpty) {
        return const Color(0xFF2D59F0);
      }
      if (state == OptionListItemState.hover) {
        return const Color(0xFFAAAAAA);
      }
      return const Color(0xFFD5D5D5);
    }

    if (state == OptionListItemState.hover || state == OptionListItemState.focused) {
      return const Color(0xFFE9F1FC);
    }

    return const Color(0xFFEAEAEA);
  }
}
