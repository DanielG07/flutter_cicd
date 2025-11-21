import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los diferentes tamaños del Select
enum SelectSize {
  medium,
  small,
}

/// Enum para los diferentes estados de validación del Select
enum SelectStatus {
  normal,
  warning,
  error,
}

/// Clase para representar una opción del select
class SelectOption<T> {
  final T value;
  final String label;

  const SelectOption({
    required this.value,
    required this.label,
  });
}

/// Configuración de tamaños para cada variante del Select
class _SelectSizeConfig {
  final double height;
  final double fontSize;
  final double lineHeight;
  final EdgeInsetsGeometry padding;
  final double iconSize;

  const _SelectSizeConfig({
    required this.height,
    required this.fontSize,
    required this.lineHeight,
    required this.padding,
    required this.iconSize,
  });

  static _SelectSizeConfig fromSize(SelectSize size) {
    switch (size) {
      case SelectSize.medium:
        return _SelectSizeConfig(
          height: 48,
          fontSize: 16,
          lineHeight: 1.5, // 24/16
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingMd,
            vertical: AireSpacing.spacingSm,
          ),
          iconSize: AireIconSizes.iconSm,
        );
      case SelectSize.small:
        return _SelectSizeConfig(
          height: 40,
          fontSize: 14,
          lineHeight: 1.43, // 20/14
          padding: EdgeInsets.symmetric(
            horizontal: AireSpacing.spacingMd,
            vertical: AireSpacing.spacingXs,
          ),
          iconSize: AireIconSizes.iconSm,
        );
    }
  }
}

/// Configuración de colores para cada estado de validación
class _SelectStatusConfig {
  final Color borderColor;

  const _SelectStatusConfig({
    required this.borderColor,
  });

  static _SelectStatusConfig fromStatus(SelectStatus status) {
    switch (status) {
      case SelectStatus.normal:
        return _SelectStatusConfig(
          borderColor: AireColors.neutral300,
        );
      case SelectStatus.warning:
        return _SelectStatusConfig(
          borderColor: AireColors.warning500,
        );
      case SelectStatus.error:
        return _SelectStatusConfig(
          borderColor: AireColors.error400,
        );
    }
  }
}

/// Widget de Select Single con soporte para múltiples tamaños y estados
///
/// Soporta 2 tamaños: Medium (48px), Small (40px)
/// Características:
/// - Label flotante que aparece cuando hay valor seleccionado
/// - Chevron que cambia según el estado (arriba/abajo)
/// - Botón de clear cuando hay valor seleccionado
/// - Estados: default, hover, focused, disabled
/// - Estados de validación: normal, warning, error
/// - Lista desplegable con opciones scrolleables
class AireSelectSingle<T> extends StatefulWidget {
  /// Texto del label flotante (aparece cuando hay valor)
  final String? label;

  /// Texto del placeholder
  final String placeholder;

  /// Lista de opciones
  final List<SelectOption<T>> options;

  /// Valor seleccionado
  final T? value;

  /// Callback cuando cambia el valor
  final ValueChanged<T?>? onChanged;

  /// Si el select está habilitado
  final bool enabled;

  /// Tamaño del select
  final SelectSize size;

  /// Estado de validación del select
  final SelectStatus status;

  /// Ancho del widget (opcional, por defecto 233px como en diseño)
  final double? width;

  /// Altura máxima del dropdown (por defecto 168px como en diseño)
  final double maxDropdownHeight;

  const AireSelectSingle({
    super.key,
    this.label,
    required this.placeholder,
    required this.options,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.size = SelectSize.small,
    this.status = SelectStatus.normal,
    this.width = 233,
    this.maxDropdownHeight = 168,
  });

  @override
  State<AireSelectSingle<T>> createState() => _AireSelectSingleState<T>();
}

class _AireSelectSingleState<T> extends State<AireSelectSingle<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  bool _isHovered = false;
  int? _hoveredIndex;

  bool get _hasValue => widget.value != null;
  bool get _showFloatingLabel => _hasValue;

  String get _displayText {
    if (!_hasValue) return widget.placeholder;
    final option =
        widget.options.firstWhere((opt) => opt.value == widget.value);
    return option.label;
  }

  Color get _borderColor {
    if (!widget.enabled) {
      return AireColors.neutral300;
    }

    final statusConfig = _SelectStatusConfig.fromStatus(widget.status);

    if (widget.status != SelectStatus.normal) {
      return statusConfig.borderColor;
    }

    if (_isOpen) {
      return AireColors.primary400; // Primary color cuando está abierto
    }

    if (_isHovered) {
      return AireColors.neutral400; // Darker grey on hover
    }

    return AireColors.neutral300; // Default grey
  }

  double get _borderWidth {
    return _isOpen ? 2.0 : 1.0;
  }

  Color get _backgroundColor {
    return widget.enabled ? AireColors.white : AireColors.neutral100;
  }

  Color get _textColor {
    if (!widget.enabled) {
      return AireColors.neutral400;
    }
    return _hasValue ? AireColors.neutral700 : AireColors.neutral500;
  }

  void _toggleDropdown() {
    if (!widget.enabled) return;

    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isOpen = false;
      _hoveredIndex = null;
    });
  }

  void _handleOptionSelected(T value) {
    widget.onChanged?.call(value);
    _closeDropdown();
  }

  void _handleClear() {
    widget.onChanged?.call(null);
  }

  TextStyle _getTextStyle(_SelectSizeConfig config) {
    return widget.size == SelectSize.medium
        ? AireTextStyles.bodyLargeRegular
        : AireTextStyles.bodyMediumRegular;
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _closeDropdown,
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(8),
                  child: _buildDropdownList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownList() {
    final config = _SelectSizeConfig.fromSize(widget.size);

    return Container(
      constraints: BoxConstraints(
        maxHeight: widget.maxDropdownHeight,
      ),
      decoration: BoxDecoration(
        color: AireColors.white,
        border: Border.all(color: AireColors.neutral200),
        borderRadius: AireBorderRadius.borderXs,
      ),
      child: Stack(
        children: [
          // Lista de opciones
          Scrollbar(
            thickness: 8,
            radius: const Radius.circular(8),
            thumbVisibility: true,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 4),
              shrinkWrap: true,
              itemCount: widget.options.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: AireColors.neutral200,
              ),
              itemBuilder: (context, index) {
                final option = widget.options[index];
                final isSelected = widget.value == option.value;
                final isHovered = _hoveredIndex == index;

                return MouseRegion(
                  onEnter: (_) => setState(() => _hoveredIndex = index),
                  onExit: (_) => setState(() => _hoveredIndex = null),
                  child: GestureDetector(
                    onTap: () => _handleOptionSelected(option.value),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AireSpacing.spacingMd,
                        vertical: AireSpacing.spacingXs,
                      ),
                      color: isSelected
                          ? AireColors.primary400
                          : isHovered
                              ? AireColors.neutral100
                              : AireColors.white,
                      child: Text(
                        option.label,
                        style: _getTextStyle(config).copyWith(
                          color: isSelected
                              ? AireColors.white
                              : AireColors.neutral700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = _SelectSizeConfig.fromSize(widget.size);

    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: widget.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Select button
            MouseRegion(
              onEnter: (_) {
                if (widget.enabled) {
                  setState(() => _isHovered = true);
                }
              },
              onExit: (_) {
                setState(() => _isHovered = false);
              },
              child: GestureDetector(
                onTap: _toggleDropdown,
                child: Container(
                  height: config.height,
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                    border: Border.all(
                      color: _borderColor,
                      width: _borderWidth,
                    ),
                    borderRadius: AireBorderRadius.borderXs,
                  ),
                  padding: config.padding,
                  child: Row(
                    children: [
                      // Text
                      Expanded(
                        child: Text(
                          _displayText,
                          style: _getTextStyle(config).copyWith(
                            color: _textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      AireSpacing.horizontalSpaceXs,

                      // Clear button (when has value and enabled)
                      if (_hasValue && widget.enabled) ...[
                        GestureDetector(
                          onTap: _handleClear,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AireColors.neutral200,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 10,
                              color: AireColors.neutral500,
                            ),
                          ),
                        ),
                        AireSpacing.horizontalSpaceXs,
                      ],

                      // Chevron icon
                      Icon(
                        _isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: config.iconSize,
                        color: widget.enabled
                            ? AireColors.neutral600
                            : AireColors.neutral400,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Floating label
            if (_showFloatingLabel && widget.label != null)
              Positioned(
                left: 12,
                top: -6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AireSpacing.spacing2xs),
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                  ),
                  child: Text(
                    widget.label!,
                    style: AireTextStyles.labelSmall.copyWith(
                      color: AireColors.neutral500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
