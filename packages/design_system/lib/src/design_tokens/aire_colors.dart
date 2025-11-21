/// Design System Aire - Color Tokens
///
/// Definición centralizada de todos los colores del design system.
/// Basado en la especificación oficial de tokens de Aire.
///
/// Este archivo proporciona acceso a todos los colores utilizados en la aplicación,
/// organizados en paletas primarias, secundarias, neutrales y semánticas.
///
/// Principio de diseño: Los colores están diseñados considerando los estándares
/// de accesibilidad WCAG 2.1 para garantizar que el contenido sea legible y
/// accesible para todos los usuarios.

import 'package:flutter/material.dart';

/// Clase que contiene todos los tokens de color del Design System Aire.
///
/// Uso:
/// ```dart
/// Container(
///   color: AireColors.primary400,
///   child: Text(
///     'Hola',
///     style: TextStyle(color: AireColors.white),
///   ),
/// )
/// ```
class AireColors {
  // Constructor privado para prevenir instanciación
  AireColors._();

  // ============================================================================
  // PALETA PRIMARIA
  // ============================================================================

  /// Primary 700 - Estados hover de elementos primarios oscuros
  static const Color primary700 = Color(0xFF000C36);

  /// Primary 600 - Elementos primarios muy oscuros
  static const Color primary600 = Color(0xFF001C7C);

  /// Primary 500 - Color primario base
  static const Color primary500 = Color(0xFF002CC2);

  /// Primary 400 - Color primario principal (Azul Aire)
  static const Color primary400 = Color(0xFF2D59F0);

  /// Primary 300 - Estados hover de elementos primarios
  static const Color primary300 = Color(0xFF698BFF);

  /// Primary 200 - Fondos primarios claros
  static const Color primary200 = Color(0xFF9DB3FF);

  /// Primary 100 - Fondos primarios muy claros
  static const Color primary100 = Color(0xFFD9E2FF);

  /// Primary 50 - Fondos primarios sutiles
  static const Color primary50 = Color(0xFFE9F1FC);

  // ============================================================================
  // PALETA SECUNDARIA
  // ============================================================================

  /// Secondary 700 - Estados hover de elementos secundarios oscuros
  static const Color secondary700 = Color(0xFF00322B);

  /// Secondary 600 - Elementos secundarios muy oscuros
  static const Color secondary600 = Color(0xFF01685A);

  /// Secondary 500 - Color secundario base
  static const Color secondary500 = Color(0xFF009985);

  /// Secondary 400 - Color secundario principal (Verde-turquesa Aire)
  static const Color secondary400 = Color(0xFF00BEA5);

  /// Secondary 300 - Estados hover de elementos secundarios
  static const Color secondary300 = Color(0xFF26D6BF);

  /// Secondary 200 - Fondos secundarios claros
  static const Color secondary200 = Color(0xFF53F7E1);

  /// Secondary 100 - Fondos secundarios muy claros
  static const Color secondary100 = Color(0xFFB3FFF5);

  /// Secondary 50 - Fondos secundarios sutiles
  static const Color secondary50 = Color(0xFFE5FFFB);

  // ============================================================================
  // PALETA NEUTRAL
  // ============================================================================

  /// Neutral 700 - Texto primario, títulos importantes
  static const Color neutral700 = Color(0xFF2A2A2A);

  /// Neutral 600 - Texto secundario, subtítulos
  static const Color neutral600 = Color(0xFF4C4C4C);

  /// Neutral 500 - Texto de apoyo, labels
  static const Color neutral500 = Color(0xFF6B6B6B);

  /// Neutral 400 - Texto deshabilitado, placeholders
  static const Color neutral400 = Color(0xFFAAAAAA);

  /// Neutral 300 - Bordes suaves
  static const Color neutral300 = Color(0xFFD5D5D5);

  /// Neutral 200 - Bordes, divisores
  static const Color neutral200 = Color(0xFFEAEAEA);

  /// Neutral 100 - Fondos suaves
  static const Color neutral100 = Color(0xFFF0F0F0);

  /// Neutral 50 - Fondos de página
  static const Color neutral50 = Color(0xFFF6F6F6);

  // ============================================================================
  // FONDOS ESPECIALES
  // ============================================================================

  /// Background B1 - Fondo principal de la aplicación
  static const Color backgroundB1 = Color(0xFFFBFDFF);

  // ============================================================================
  // COLORES BASE
  // ============================================================================

  /// Black - Texto de máximo contraste
  static const Color black = Color(0xFF000000);

  /// White - Fondos puros, texto sobre fondos oscuros
  static const Color white = Color(0xFFFFFFFF);

  // ============================================================================
  // COLORES SEMÁNTICOS - ERROR
  // ============================================================================

  /// Error 500 - Errores críticos, texto de error
  static const Color error500 = Color(0xFFBF0000);

  /// Error 400 - Errores estándar, botones de peligro
  static const Color error400 = Color(0xFFEE1616);

  /// Error 300 - Estados hover de elementos de error
  static const Color error300 = Color(0xFFFB3536);

  /// Error 200 - Fondos de alertas de error suaves
  static const Color error200 = Color(0xFFFFC8CC);

  /// Error 100 - Fondos de error muy suaves
  static const Color error100 = Color(0xFFFFE5E5);

  // ============================================================================
  // COLORES SEMÁNTICOS - SUCCESS
  // ============================================================================

  /// Success 500 - Confirmaciones críticas
  static const Color success500 = Color(0xFF009600);

  /// Success 400 - Estados de éxito estándar
  static const Color success400 = Color(0xFF26BE19);

  /// Success 300 - Estados hover de elementos de éxito
  static const Color success300 = Color(0xFF4FDE35);

  /// Success 200 - Fondos de alertas de éxito suaves
  static const Color success200 = Color(0xFFA1DF98);

  /// Success 100 - Fondos de éxito muy suaves
  static const Color success100 = Color(0xFFEBFAE7);

  // ============================================================================
  // COLORES SEMÁNTICOS - WARNING
  // ============================================================================

  /// Warning 500 - Advertencias críticas
  static const Color warning500 = Color(0xFFCF9400);

  /// Warning 400 - Advertencias estándar
  static const Color warning400 = Color(0xFFEFAC00);

  /// Warning 300 - Estados hover de elementos de advertencia
  static const Color warning300 = Color(0xFFFFC83C);

  /// Warning 200 - Fondos de alertas de advertencia suaves
  static const Color warning200 = Color(0xFFFEE283);

  /// Warning 100 - Fondos de advertencia muy suaves
  static const Color warning100 = Color(0xFFFFF9E1);

  // ============================================================================
  // COLORES SEMÁNTICOS - INFO
  // ============================================================================

  /// Info 500 - Información crítica
  static const Color info500 = Color(0xFF3B82F6);

  /// Info 400 - Información estándar
  static const Color info400 = Color(0xFF4BA1FF);

  /// Info 300 - Estados hover de elementos informativos
  static const Color info300 = Color(0xFF93C8FF);

  /// Info 200 - Fondos de alertas informativas suaves
  static const Color info200 = Color(0xFFBDDDFF);

  /// Info 100 - Fondos informativos muy suaves
  static const Color info100 = Color(0xFFECF6FC);

  // ============================================================================
  // GUÍAS DE USO
  // ============================================================================

  /// Obtiene el color de texto apropiado (blanco o negro) para usar sobre
  /// un color de fondo dado, basado en el contraste de luminancia.
  ///
  /// Uso:
  /// ```dart
  /// Color textColor = AireColors.getTextColorForBackground(AireColors.primary400);
  /// ```
  static Color getTextColorForBackground(Color backgroundColor) {
    // Calcular luminancia relativa usando la fórmula WCAG
    final double luminance = backgroundColor.computeLuminance();

    // Si la luminancia es mayor a 0.5, usar texto oscuro, sino texto claro
    return luminance > 0.5 ? neutral700 : white;
  }

  // ============================================================================
  // COMBINACIONES RECOMENDADAS
  // ============================================================================

  // Las siguientes son combinaciones de colores que cumplen con los estándares
  // de accesibilidad WCAG 2.1 nivel AA (ratio mínimo 4.5:1 para texto normal)

  /// Combinaciones recomendadas para texto sobre fondos claros
  static const List<Map<String, Color>> lightBackgroundCombinations = [
    {'text': neutral700, 'background': neutral50},
    {'text': neutral700, 'background': white},
    {'text': neutral600, 'background': backgroundB1},
  ];

  /// Combinaciones recomendadas para texto sobre fondos de marca
  static const List<Map<String, Color>> brandBackgroundCombinations = [
    {'text': white, 'background': primary400},
    {'text': white, 'background': secondary400},
  ];

  /// Combinaciones recomendadas para estados
  static const List<Map<String, Color>> stateBackgroundCombinations = [
    {'text': white, 'background': error400},
    {'text': white, 'background': success400},
    {'text': neutral700, 'background': warning400},
    {'text': white, 'background': info400},
  ];
}
