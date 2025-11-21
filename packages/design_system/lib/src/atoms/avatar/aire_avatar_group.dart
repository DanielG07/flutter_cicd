import 'package:flutter/material.dart';
import 'package:design_system/src/atoms/avatar/aire_avatar.dart';

/// Modelo para un avatar en el grupo
class AvatarData {
  final String? imageUrl;
  final String? initials;
  final Color? backgroundColor;

  const AvatarData({
    this.imageUrl,
    this.initials,
    this.backgroundColor,
  });
}

/// Widget de grupo de avatares con overlap y contador
///
/// Muestra un grupo de avatares superpuestos con borde blanco
/// y un contador "+N" para avatares adicionales
///
/// Ejemplo de uso:
/// ```dart
/// AireAvatarGroup(
///   avatars: [
///     AvatarData(imageUrl: 'https://example.com/avatar1.jpg'),
///     AvatarData(imageUrl: 'https://example.com/avatar2.jpg'),
///     AvatarData(initials: 'EA', backgroundColor: Color(0xFF00BEA5)),
///   ],
///   size: AvatarSize.medium,
///   maxVisible: 4,
///   totalCount: 9, // Mostrará +5
/// )
/// ```
class AireAvatarGroup extends StatelessWidget {
  /// Lista de avatares a mostrar
  final List<AvatarData> avatars;

  /// Tamaño de los avatares
  final AvatarSize size;

  /// Número máximo de avatares visibles
  final int maxVisible;

  /// Contador total (opcional, si es mayor que avatars.length mostrará +N)
  final int? totalCount;

  /// Overlap entre avatares en pixeles
  final double overlap;

  const AireAvatarGroup({
    super.key,
    required this.avatars,
    this.size = AvatarSize.medium,
    this.maxVisible = 4,
    this.totalCount,
    this.overlap = 7,
  });

  double _getBorderWidth() {
    switch (size) {
      case AvatarSize.small:
        return 1;
      case AvatarSize.medium:
        return 2;
      case AvatarSize.large:
        return 2;
    }
  }

  double _getCounterFontSize() {
    switch (size) {
      case AvatarSize.small:
        return 12;
      case AvatarSize.medium:
        return 14;
      case AvatarSize.large:
        return 16;
    }
  }

  int get _remainingCount {
    final total = totalCount ?? avatars.length;
    final visible = maxVisible.clamp(0, avatars.length);
    return (total - visible).clamp(0, 999);
  }

  @override
  Widget build(BuildContext context) {
    final visibleAvatars = avatars.take(maxVisible).toList();
    final borderWidth = _getBorderWidth();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatares superpuestos
        ...List.generate(visibleAvatars.length, (index) {
          final avatarData = visibleAvatars[index];

          return Transform.translate(
            offset: Offset(-overlap * index, 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: borderWidth,
                ),
              ),
              child: AireAvatar(
                imageUrl: avatarData.imageUrl,
                initials: avatarData.initials,
                size: size,
                backgroundColor: avatarData.backgroundColor,
              ),
            ),
          );
        }),

        // Contador +N
        if (_remainingCount > 0)
          Transform.translate(
            offset: Offset(-overlap * visibleAvatars.length + 10, 0),
            child: Text(
              '+$_remainingCount',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: _getCounterFontSize(),
                fontWeight: FontWeight.w400,
                height: switch (size) {
                  AvatarSize.small => 16 / 12,
                  AvatarSize.medium => 20 / 14,
                  AvatarSize.large => 24 / 16,
                },
                color: const Color(0xFF2A2A2A), // Neutral 700
              ),
            ),
          ),
      ],
    );
  }
}
