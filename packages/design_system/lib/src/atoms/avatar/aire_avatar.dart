import 'package:flutter/material.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// Enum para el tamaño del avatar
enum AvatarSize {
  /// 24px
  small,

  /// 32px
  medium,

  /// 40px
  large,
}

/// Enum para el tipo de badge
enum AvatarBadgeType {
  /// Sin badge
  none,

  /// Badge con punto (estado online)
  dot,

  /// Badge con texto (número)
  text,

  /// Badge con ícono
  icon,
}

/// Widget de avatar atom con múltiples tamaños y variantes
///
/// Tamaños soportados: 24px, 32px, 40px
/// Badges soportados: Dot, Text, Icon
/// Soporta imagen o iniciales
///
/// Ejemplo de uso:
/// ```dart
/// // Avatar con imagen
/// AireAvatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   size: AvatarSize.medium,
/// )
///
/// // Avatar con iniciales
/// AireAvatar(
///   initials: 'EA',
///   size: AvatarSize.medium,
///   backgroundColor: Color(0xFF00BEA5),
/// )
///
/// // Avatar con badge de punto
/// AireAvatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   size: AvatarSize.medium,
///   badgeType: AvatarBadgeType.dot,
/// )
/// ```
class AireAvatar extends StatelessWidget {
  /// URL de la imagen del avatar (opcional)
  final String? imageUrl;

  /// Iniciales para mostrar cuando no hay imagen
  final String? initials;

  /// Tamaño del avatar
  final AvatarSize size;

  /// Color de fondo (cuando se usan iniciales)
  final Color? backgroundColor;

  /// Tipo de badge
  final AvatarBadgeType badgeType;

  /// Texto del badge (para badgeType.text)
  final String? badgeText;

  /// Ícono del badge (para badgeType.icon)
  final IconData? badgeIcon;

  /// Texto opcional junto al avatar
  final String? text;

  const AireAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = AvatarSize.medium,
    this.backgroundColor,
    this.badgeType = AvatarBadgeType.none,
    this.badgeText,
    this.badgeIcon,
    this.text,
  });

  double _getSize() {
    switch (size) {
      case AvatarSize.small:
        return 24;
      case AvatarSize.medium:
        return 32;
      case AvatarSize.large:
        return 40;
    }
  }

  double _getInitialsFontSize() {
    switch (size) {
      case AvatarSize.small:
        return 10;
      case AvatarSize.medium:
        return 12;
      case AvatarSize.large:
        return 14;
    }
  }

  double _getBadgeSize() {
    switch (size) {
      case AvatarSize.small:
        return 10;
      case AvatarSize.medium:
        return 12;
      case AvatarSize.large:
        return 16;
    }
  }

  double _getBadgeDotSize() {
    switch (size) {
      case AvatarSize.small:
        return 6;
      case AvatarSize.medium:
        return 8;
      case AvatarSize.large:
        return 8;
    }
  }

  Color _getBackgroundColor() {
    return backgroundColor ?? AireColors.secondary400;
  }

  Widget _buildBadge() {
    if (badgeType == AvatarBadgeType.none) {
      return const SizedBox.shrink();
    }

    final badgeSize = _getBadgeSize();

    Widget badgeContent;

    switch (badgeType) {
      case AvatarBadgeType.dot:
        badgeContent = Container(
          width: _getBadgeDotSize(),
          height: _getBadgeDotSize(),
          decoration: BoxDecoration(
            color: AireColors.success400,
            shape: BoxShape.circle,
          ),
        );
        break;

      case AvatarBadgeType.text:
        badgeContent = Container(
          constraints: BoxConstraints(
            minWidth: badgeSize,
            maxWidth: badgeSize * 2,
            minHeight: badgeSize,
            maxHeight: badgeSize,
          ),
          padding: EdgeInsets.symmetric(horizontal: AireSpacing.spacing2xs),
          decoration: BoxDecoration(
            color: AireColors.error300,
            borderRadius: AireBorderRadius.borderCircular,
          ),
          child: Center(
            child: Text(
              badgeText ?? '0',
              style: AireTextStyles.bodySmallRegular.copyWith(
                fontSize: badgeSize * 0.75,
                color: AireColors.white,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
        break;

      case AvatarBadgeType.icon:
        badgeContent = Container(
          width: badgeSize,
          height: badgeSize,
          decoration: BoxDecoration(
            color: AireColors.success400,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(AireSpacing.spacing2xs / 2),
          child: Icon(
            badgeIcon ?? Icons.check,
            size: badgeSize * 0.5,
            color: AireColors.white,
          ),
        );
        break;

      default:
        return const SizedBox.shrink();
    }

    // Posición del badge
    double? top;
    double? bottom;
    double? left;
    double? right;

    if (badgeType == AvatarBadgeType.dot) {
      top = -2;
      left = _getSize() - badgeSize - 2;
    } else if (badgeType == AvatarBadgeType.text) {
      top = -3;
      right = -3;
    } else if (badgeType == AvatarBadgeType.icon) {
      bottom = -2;
      right = -2;
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        decoration: BoxDecoration(
          shape: badgeType == AvatarBadgeType.text
              ? BoxShape.rectangle
              : BoxShape.circle,
          border: badgeType != AvatarBadgeType.text
              ? Border.all(
                  color: Colors.white,
                  width: 2,
                )
              : null,
          borderRadius: badgeType == AvatarBadgeType.text
              ? BorderRadius.circular(99)
              : null,
        ),
        child: badgeContent,
      ),
    );
  }

  Widget _buildAvatar() {
    final avatarSize = _getSize();

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Si falla la imagen, mostrar iniciales
                return _buildInitials();
              },
            )
          : _buildInitials(),
    );
  }

  Widget _buildInitials() {
    if (initials == null || initials!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Text(
        initials!.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Figtree',
          fontSize: _getInitialsFontSize(),
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatarWidget = SizedBox(
      width: _getSize(),
      height: _getSize(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildAvatar(),
          _buildBadge(),
        ],
      ),
    );

    if (text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          avatarWidget,
          AireSpacing.horizontalSpaceXs,
          Text(
            text!,
            style: AireTextStyles.bodyMediumRegular.copyWith(
              color: AireColors.neutral700,
            ),
          ),
        ],
      );
    }

    return avatarWidget;
  }
}
