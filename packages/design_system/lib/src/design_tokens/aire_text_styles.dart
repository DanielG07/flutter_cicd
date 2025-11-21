/// Design System Aire - Typography Tokens
///
/// Definición centralizada de todos los estilos tipográficos del design system.
/// Basado en la especificación oficial de tokens de Aire.
///
/// Familia tipográfica: Figtree (Google Fonts)
/// Diseñada por: Erik Kennedy
///
/// Este archivo proporciona acceso a todos los estilos de texto utilizados en
/// la aplicación, organizados por jerarquía y propósito.
///
/// Uso:
/// ```dart
/// Text(
///   'Título',
///   style: AireTextStyles.heading1Bold,
/// )
/// ```

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Clase que contiene todos los tokens tipográficos del Design System Aire.
///
/// Todos los estilos utilizan la fuente Figtree de Google Fonts y siguen
/// la jerarquía tipográfica definida en la especificación oficial.
class AireTextStyles {
  // Constructor privado para prevenir instanciación
  AireTextStyles._();

  // ============================================================================
  // DISPLAY STYLES - Para títulos hero y landing pages
  // ============================================================================

  /// Display 3 Regular - Títulos hero, landing pages (128px)
  static TextStyle get display3Regular => GoogleFonts.figtree(
        fontSize: 128,
        fontWeight: FontWeight.w400,
        height: 1.0,
      );

  /// Display 3 Semibold - Títulos hero destacados (128px)
  static TextStyle get display3Semibold => GoogleFonts.figtree(
        fontSize: 128,
        fontWeight: FontWeight.w600,
        height: 1.0,
      );

  /// Display 3 Bold - Títulos hero principales (128px)
  static TextStyle get display3Bold => GoogleFonts.figtree(
        fontSize: 128,
        fontWeight: FontWeight.w700,
        height: 1.0,
      );

  /// Display 2 Regular - Títulos de sección principales (96px)
  static TextStyle get display2Regular => GoogleFonts.figtree(
        fontSize: 96,
        fontWeight: FontWeight.w400,
        height: 1.0,
      );

  /// Display 2 Semibold - Títulos de sección destacados (96px)
  static TextStyle get display2Semibold => GoogleFonts.figtree(
        fontSize: 96,
        fontWeight: FontWeight.w600,
        height: 1.0,
      );

  /// Display 2 Bold - Títulos de sección importantes (96px)
  static TextStyle get display2Bold => GoogleFonts.figtree(
        fontSize: 96,
        fontWeight: FontWeight.w700,
        height: 1.0,
      );

  /// Display 1 Regular - Títulos de página (72px)
  static TextStyle get display1Regular => GoogleFonts.figtree(
        fontSize: 72,
        fontWeight: FontWeight.w400,
        height: 1.0,
      );

  /// Display 1 Semibold - Títulos de página destacados (72px)
  static TextStyle get display1Semibold => GoogleFonts.figtree(
        fontSize: 72,
        fontWeight: FontWeight.w600,
        height: 1.0,
      );

  /// Display 1 Bold - Títulos de página importantes (72px)
  static TextStyle get display1Bold => GoogleFonts.figtree(
        fontSize: 72,
        fontWeight: FontWeight.w700,
        height: 1.0,
      );

  // ============================================================================
  // HEADINGS - Encabezados jerárquicos
  // ============================================================================

  /// Heading 1 Regular - Encabezados H1 (64px)
  static TextStyle get heading1Regular => GoogleFonts.figtree(
        fontSize: 64,
        fontWeight: FontWeight.w400,
        height: 80 / 64, // 80px line-height
      );

  /// Heading 1 Semibold - Encabezados H1 destacados (64px)
  static TextStyle get heading1Semibold => GoogleFonts.figtree(
        fontSize: 64,
        fontWeight: FontWeight.w600,
        height: 80 / 64, // 80px line-height
      );

  /// Heading 1 Bold - Encabezados H1 principales (64px)
  static TextStyle get heading1Bold => GoogleFonts.figtree(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        height: 80 / 64, // 80px line-height
      );

  /// Heading 2 Regular - Encabezados H2 (48px)
  static TextStyle get heading2Regular => GoogleFonts.figtree(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        height: 64 / 48, // 64px line-height
      );

  /// Heading 2 Semibold - Encabezados H2 destacados (48px)
  static TextStyle get heading2Semibold => GoogleFonts.figtree(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        height: 56 / 48, // 56px line-height
      );

  /// Heading 2 Bold - Encabezados H2 principales (48px)
  static TextStyle get heading2Bold => GoogleFonts.figtree(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 64 / 48, // 64px line-height
      );

  /// Heading 3 Regular - Encabezados H3 (32px)
  static TextStyle get heading3Regular => GoogleFonts.figtree(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 40 / 32, // 40px line-height
      );

  /// Heading 3 Semibold - Encabezados H3 destacados (32px)
  static TextStyle get heading3Semibold => GoogleFonts.figtree(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 40 / 32,
      );

  /// Heading 3 Bold - Encabezados H3 principales (32px)
  static TextStyle get heading3Bold => GoogleFonts.figtree(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
      );

  /// Heading 4 Regular - Encabezados H4 (24px)
  static TextStyle get heading4Regular => GoogleFonts.figtree(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 32 / 24, // 32px line-height
      );

  /// Heading 4 Semibold - Encabezados H4 destacados (24px)
  static TextStyle get heading4Semibold => GoogleFonts.figtree(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
      );

  /// Heading 4 Bold - Encabezados H4 principales (24px)
  static TextStyle get heading4Bold => GoogleFonts.figtree(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
      );

  /// Heading 5 Regular - Encabezados H5 (20px)
  static TextStyle get heading5Regular => GoogleFonts.figtree(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 28 / 20, // 28px line-height
      );

  /// Heading 5 Semibold - Encabezados H5 destacados (20px)
  static TextStyle get heading5Semibold => GoogleFonts.figtree(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
      );

  /// Heading 5 Bold - Encabezados H5 principales (20px)
  static TextStyle get heading5Bold => GoogleFonts.figtree(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 28 / 20,
      );

  /// Heading 6 Regular - Encabezados H6 (18px)
  static TextStyle get heading6Regular => GoogleFonts.figtree(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 28 / 18, // 28px line-height
      );

  /// Heading 6 Semibold - Encabezados H6 destacados (18px)
  static TextStyle get heading6Semibold => GoogleFonts.figtree(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 28 / 18,
      );

  /// Heading 6 Bold - Encabezados H6 principales (18px)
  static TextStyle get heading6Bold => GoogleFonts.figtree(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 28 / 18,
      );

  // ============================================================================
  // BODY TEXT - Texto de cuerpo principal
  // ============================================================================

  /// Body Large Regular - Texto principal (16px)
  static TextStyle get bodyLargeRegular => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16, // 24px line-height
      );

  /// Body Large Semibold - Texto destacado (16px)
  static TextStyle get bodyLargeSemibold => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
      );

  /// Body Large Bold - Texto muy destacado (16px)
  static TextStyle get bodyLargeBold => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 24 / 16,
      );

  /// Body Medium Regular - Texto estándar de la interfaz (14px)
  static TextStyle get bodyMediumRegular => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14, // 20px line-height
      );

  /// Body Medium Semibold - Texto estándar destacado (14px)
  static TextStyle get bodyMediumSemibold => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
      );

  /// Body Medium Bold - Texto estándar muy destacado (14px)
  static TextStyle get bodyMediumBold => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 20 / 14,
      );

  /// Body Small Regular - Texto auxiliar (12px)
  static TextStyle get bodySmallRegular => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12, // 16px line-height
      );

  /// Body Small Semibold - Texto auxiliar destacado (12px)
  static TextStyle get bodySmallSemibold => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
      );

  /// Body Small Bold - Texto auxiliar muy destacado (12px)
  static TextStyle get bodySmallBold => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 16 / 12,
      );

  // ============================================================================
  // BUTTONS - Tipografía para botones
  // ============================================================================

  /// Button Extra Small - Botones pequeños, badges interactivos (14px)
  static TextStyle get buttonExtraSmall => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 0.85, // 85% line-height
      );

  /// Button Small - Botones secundarios, acciones menores (16px)
  static TextStyle get buttonSmall => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 0.85, // 85% line-height
      );

  /// Button Medium - Botones primarios estándar (18px)
  static TextStyle get buttonMedium => GoogleFonts.figtree(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 0.90, // 90% line-height
      );

  /// Button Large - CTAs principales, botones destacados (20px)
  static TextStyle get buttonLarge => GoogleFonts.figtree(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 16 / 20, // 80% - 16px line-height
      );

  // ============================================================================
  // LINKS - Tipografía para enlaces
  // ============================================================================

  /// Link Small - Enlaces en textos pequeños (12px)
  static TextStyle get linkSmall => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12, // 16px line-height
      );

  /// Link Medium - Enlaces en párrafos estándar (14px)
  static TextStyle get linkMedium => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14, // 20px line-height
      );

  /// Link Large - Enlaces en textos grandes (16px)
  static TextStyle get linkLarge => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16, // 24px line-height
      );

  /// Link Small Standalone - Links independientes pequeños (12px, Semibold)
  static TextStyle get linkSmallStandalone => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.0, // 100%
      );

  /// Link Medium Standalone - Links de navegación (14px, Semibold)
  static TextStyle get linkMediumStandalone => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.0,
      );

  /// Link Large Standalone - Links principales, menús (16px, Semibold)
  static TextStyle get linkLargeStandalone => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.0,
      );

  // ============================================================================
  // NAVIGATION - Tipografía para navegación
  // ============================================================================

  /// Tab Normal - Pestañas de navegación estándar (16px)
  static TextStyle get tabNormal => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.0,
      );

  // ============================================================================
  // FORM ELEMENTS - Tipografía para elementos de formulario
  // ============================================================================

  /// Label Small - Etiquetas pequeñas (12px)
  static TextStyle get labelSmall => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 12 / 12, // 12px line-height
      );

  /// Label Medium - Etiquetas de formulario (14px)
  static TextStyle get labelMedium => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 16 / 14, // 16px line-height
      );

  /// Label Large - Etiquetas grandes (16px)
  static TextStyle get labelLarge => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 20 / 16, // 20px line-height
      );

  /// Placeholder Small - Inputs pequeños (12px)
  static TextStyle get placeholderSmall => GoogleFonts.figtree(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12, // 16px line-height
      );

  /// Placeholder Medium - Inputs estándar (14px)
  static TextStyle get placeholderMedium => GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14, // 20px line-height
      );

  /// Placeholder Large - Inputs grandes, textarea (16px)
  static TextStyle get placeholderLarge => GoogleFonts.figtree(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16, // 24px line-height
      );

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Obtiene el estilo de texto de botón apropiado según el tamaño
  static TextStyle getButtonStyle(String size) {
    switch (size.toLowerCase()) {
      case 'xs':
      case 'extra-small':
        return buttonExtraSmall;
      case 's':
      case 'small':
        return buttonSmall;
      case 'm':
      case 'medium':
        return buttonMedium;
      case 'l':
      case 'large':
        return buttonLarge;
      default:
        return buttonMedium;
    }
  }

  /// Obtiene el estilo de texto de link apropiado según el tamaño y tipo
  static TextStyle getLinkStyle(String size, {bool standalone = false}) {
    if (standalone) {
      switch (size.toLowerCase()) {
        case 's':
        case 'small':
          return linkSmallStandalone;
        case 'm':
        case 'medium':
          return linkMediumStandalone;
        case 'l':
        case 'large':
          return linkLargeStandalone;
        default:
          return linkMediumStandalone;
      }
    } else {
      switch (size.toLowerCase()) {
        case 's':
        case 'small':
          return linkSmall;
        case 'm':
        case 'medium':
          return linkMedium;
        case 'l':
        case 'large':
          return linkLarge;
        default:
          return linkMedium;
      }
    }
  }

  /// Obtiene el estilo de heading apropiado según el nivel y peso
  static TextStyle getHeadingStyle(int level,
      {String weight = 'regular'}) {
    switch (level) {
      case 1:
        return weight == 'bold'
            ? heading1Bold
            : weight == 'semibold'
                ? heading1Semibold
                : heading1Regular;
      case 2:
        return weight == 'bold'
            ? heading2Bold
            : weight == 'semibold'
                ? heading2Semibold
                : heading2Regular;
      case 3:
        return weight == 'bold'
            ? heading3Bold
            : weight == 'semibold'
                ? heading3Semibold
                : heading3Regular;
      case 4:
        return weight == 'bold'
            ? heading4Bold
            : weight == 'semibold'
                ? heading4Semibold
                : heading4Regular;
      case 5:
        return weight == 'bold'
            ? heading5Bold
            : weight == 'semibold'
                ? heading5Semibold
                : heading5Regular;
      case 6:
        return weight == 'bold'
            ? heading6Bold
            : weight == 'semibold'
                ? heading6Semibold
                : heading6Regular;
      default:
        return heading4Regular;
    }
  }
}
