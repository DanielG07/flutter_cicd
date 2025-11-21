import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para los tipos de chip
enum ChipType {
  filter,
  input,
}

/// Enum para los estados del chip
enum ChipState {
  defaultState,
  active,
  hover,
}

/// Configuración de estilo para cada tipo de chip
class _ChipTypeConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final bool hasBorder;

  const _ChipTypeConfig({
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.hasBorder = false,
  });

  static _ChipTypeConfig fromType(ChipType type, ChipState state) {
    switch (type) {
      case ChipType.filter:
        switch (state) {
          case ChipState.defaultState:
            return _ChipTypeConfig(
              backgroundColor: Colors.transparent,
              textColor: AireColors.neutral600,
              borderColor: AireColors.neutral400,
              hasBorder: true,
            );
          case ChipState.active:
            return _ChipTypeConfig(
              backgroundColor: AireColors.primary50,
              textColor: AireColors.primary600,
              hasBorder: false,
            );
          case ChipState.hover:
            return _ChipTypeConfig(
              backgroundColor: AireColors.primary50,
              textColor: AireColors.neutral600,
              borderColor: AireColors.neutral300,
              hasBorder: true,
            );
        }
      case ChipType.input:
        return _ChipTypeConfig(
          backgroundColor: AireColors.primary50,
          textColor: AireColors.primary600,
          hasBorder: false,
        );
    }
  }
}

/// Widget de chip atom con múltiples variantes y estados
///
/// Soporta 2 tipos: Filter, Input
/// Soporta 3 estados: Default, Active, Hover (solo para Filter)
/// Opción de ser removable (con ícono de cerrar)
///
/// Ejemplo de uso:
/// ```dart
/// // Filter chip por defecto
/// AireChip.filter(
///   text: 'Chip text',
///   leadingIcon: Icons.check,
///   onTap: () => print('Chip pressed'),
/// )
///
/// // Input chip removable
/// AireChip.input(
///   text: 'Text',
///   removable: true,
///   onRemove: () => print('Chip removed'),
/// )
/// ```
class AireChip extends StatelessWidget {
  /// Texto del chip
  final String text;

  /// Tipo del chip (filter o input)
  final ChipType type;

  /// Estado del chip (solo aplica para filter)
  final ChipState state;

  /// Callback cuando se presiona el chip
  final VoidCallback? onTap;

  /// Si el chip es removable (muestra ícono X)
  final bool removable;

  /// Callback cuando se presiona el ícono de remover
  final VoidCallback? onRemove;

  /// Ícono opcional al inicio (solo para filter)
  final IconData? leadingIcon;

  /// Constructor para Filter Chip
  ///
  /// ```dart
  /// AireChip.filter(
  ///   text: 'Chip text',
  ///   leadingIcon: Icons.check,
  ///   state: ChipState.active,
  ///   onTap: () => print('Tapped'),
  /// )
  /// ```
  const AireChip.filter({
    super.key,
    required this.text,
    this.state = ChipState.defaultState,
    this.leadingIcon,
    this.onTap,
  })  : type = ChipType.filter,
        removable = false,
        onRemove = null;

  /// Constructor para Input Chip
  ///
  /// ```dart
  /// AireChip.input(
  ///   text: 'Text',
  ///   removable: true,
  ///   onRemove: () => print('Removed'),
  /// )
  /// ```
  const AireChip.input({
    super.key,
    required this.text,
    this.removable = false,
    this.onRemove,
  })  : type = ChipType.input,
        state = ChipState.defaultState,
        leadingIcon = null,
        onTap = null;

  @override
  Widget build(BuildContext context) {
    final config = _ChipTypeConfig.fromType(type, state);

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Ícono leading (solo para filter)
        if (type == ChipType.filter && leadingIcon != null) ...[
          Icon(
            leadingIcon,
            size: AireIconSizes.iconSm,
            color: state == ChipState.active
                ? AireColors.primary600
                : AireColors.neutral600,
          ),
          AireSpacing.horizontalSpaceXs,
        ],

        // Texto del chip
        Text(
          text,
          style: AireTextStyles.bodyMediumRegular.copyWith(
            color: config.textColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        // Ícono de remover (solo para input removable)
        if (type == ChipType.input && removable) ...[
          AireSpacing.horizontalSpaceXs,
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: AireIconSizes.iconSm,
              color: AireColors.primary600,
            ),
          ),
        ],
      ],
    );

    return GestureDetector(
      onTap: type == ChipType.filter ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AireSpacing.spacingSm,
          vertical: AireSpacing.spacingXs,
        ),
        decoration: BoxDecoration(
          color: config.backgroundColor,
          borderRadius: AireBorderRadius.borderXs,
          border: config.hasBorder && config.borderColor != null
              ? Border.all(
                  color: config.borderColor!,
                  width: 1,
                )
              : null,
        ),
        child: content,
      ),
    );
  }
}
