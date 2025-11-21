/// Design System Aire - Breakpoints & Layout Tokens
///
/// Definición centralizada de todos los breakpoints y configuraciones de layout
/// del design system.
/// Basado en la especificación oficial de tokens de Aire.
///
/// Los breakpoints permiten crear interfaces responsivas que se adaptan a
/// diferentes tamaños de pantalla, desde móviles hasta pantallas de escritorio.
///
/// Uso:
/// ```dart
/// if (MediaQuery.of(context).size.width <= AireBreakpoints.mobile) {
///   return MobileLayout();
/// }
/// ```

import 'package:flutter/material.dart';

/// Clase que contiene todos los breakpoints del Design System Aire.
///
/// Proporciona valores consistentes para crear interfaces responsivas que
/// se adaptan a diferentes dispositivos y tamaños de pantalla.
class AireBreakpoints {
  // Constructor privado para prevenir instanciación
  AireBreakpoints._();

  // ============================================================================
  // BREAKPOINTS BASE
  // ============================================================================

  /// Mobile - Pantallas móviles (375px)
  /// Uso: Smartphones en modo portrait
  static const double mobile = 375.0;

  /// Tablet - Tabletas y móviles grandes (768px)
  /// Uso: Tabletas en portrait, smartphones landscape
  static const double tablet = 768.0;

  /// Desktop - Escritorio estándar (1280px)
  /// Uso: Laptops, monitores estándar
  static const double desktop = 1280.0;

  /// Desktop XL - Escritorio grande (1920px)
  /// Uso: Monitores grandes, pantallas 4K
  static const double desktopXL = 1920.0;

  // ============================================================================
  // MÁRGENES POR BREAKPOINT
  // ============================================================================

  /// Margen lateral para mobile (16px)
  static const double marginMobile = 16.0;

  /// Margen lateral para tablet (32px)
  static const double marginTablet = 32.0;

  /// Margen lateral para desktop (48px)
  static const double marginDesktop = 48.0;

  /// Margen lateral para desktop XL (80px)
  static const double marginDesktopXL = 80.0;

  // ============================================================================
  // ANCHOS MÁXIMOS DE CONTENIDO
  // ============================================================================

  /// Ancho máximo de contenido para mobile
  static const double maxContentWidthMobile = 480.0;

  /// Ancho máximo de contenido para tablet
  static const double maxContentWidthTablet = 768.0;

  /// Ancho máximo de contenido para desktop
  static const double maxContentWidthDesktop = 1200.0;

  /// Ancho máximo de contenido para desktop XL
  static const double maxContentWidthDesktopXL = 1600.0;

  // ============================================================================
  // COLUMNAS POR BREAKPOINT
  // ============================================================================

  /// Número de columnas para mobile
  static const int columnsMobile = 4;

  /// Número de columnas para tablet
  static const int columnsTablet = 8;

  /// Número de columnas para desktop
  static const int columnsDesktop = 12;

  /// Número de columnas para desktop XL
  static const int columnsDesktopXL = 12;

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Obtiene el margen apropiado según el ancho de pantalla
  ///
  /// Ejemplo:
  /// ```dart
  /// double margin = AireBreakpoints.getMargin(
  ///   MediaQuery.of(context).size.width
  /// );
  /// ```
  static double getMargin(double screenWidth) {
    if (screenWidth <= mobile) {
      return marginMobile;
    } else if (screenWidth <= tablet) {
      return marginTablet;
    } else if (screenWidth <= desktop) {
      return marginDesktop;
    } else {
      return marginDesktopXL;
    }
  }

  /// Obtiene el ancho máximo de contenido según el ancho de pantalla
  static double getMaxContentWidth(double screenWidth) {
    if (screenWidth <= mobile) {
      return maxContentWidthMobile;
    } else if (screenWidth <= tablet) {
      return maxContentWidthTablet;
    } else if (screenWidth <= desktop) {
      return maxContentWidthDesktop;
    } else {
      return maxContentWidthDesktopXL;
    }
  }

  /// Obtiene el número de columnas según el ancho de pantalla
  static int getColumns(double screenWidth) {
    if (screenWidth <= mobile) {
      return columnsMobile;
    } else if (screenWidth <= tablet) {
      return columnsTablet;
    } else if (screenWidth <= desktop) {
      return columnsDesktop;
    } else {
      return columnsDesktopXL;
    }
  }

  /// Verifica si el dispositivo es móvil
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobile;
  }

  /// Verifica si el dispositivo es tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > mobile && width <= tablet;
  }

  /// Verifica si el dispositivo es desktop
  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > tablet && width <= desktop;
  }

  /// Verifica si el dispositivo es desktop XL
  static bool isDesktopXL(BuildContext context) {
    return MediaQuery.of(context).size.width > desktop;
  }

  /// Obtiene el tipo de dispositivo actual
  ///
  /// Retorna: 'mobile', 'tablet', 'desktop', o 'desktop-xl'
  static String getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= mobile) {
      return 'mobile';
    } else if (width <= tablet) {
      return 'tablet';
    } else if (width <= desktop) {
      return 'desktop';
    } else {
      return 'desktop-xl';
    }
  }

  // ============================================================================
  // RESPONSIVE VALUE BUILDER
  // ============================================================================

  /// Retorna un valor diferente según el breakpoint actual
  ///
  /// Ejemplo:
  /// ```dart
  /// double fontSize = AireBreakpoints.getValue(
  ///   context,
  ///   mobile: 14.0,
  ///   tablet: 16.0,
  ///   desktop: 18.0,
  ///   desktopXL: 20.0,
  /// );
  /// ```
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? desktopXL,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width <= AireBreakpoints.mobile) {
      return mobile;
    } else if (width <= AireBreakpoints.tablet) {
      return tablet ?? mobile;
    } else if (width <= AireBreakpoints.desktop) {
      return desktop ?? tablet ?? mobile;
    } else {
      return desktopXL ?? desktop ?? tablet ?? mobile;
    }
  }
}

/// Widget helper para construcción responsiva
///
/// Ejemplo:
/// ```dart
/// ResponsiveBuilder(
///   mobile: (context) => MobileWidget(),
///   tablet: (context) => TabletWidget(),
///   desktop: (context) => DesktopWidget(),
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext) mobile;
  final Widget Function(BuildContext)? tablet;
  final Widget Function(BuildContext)? desktop;
  final Widget Function(BuildContext)? desktopXL;

  const ResponsiveBuilder({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.desktopXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= AireBreakpoints.mobile) {
          return mobile(context);
        } else if (constraints.maxWidth <= AireBreakpoints.tablet) {
          return (tablet ?? mobile)(context);
        } else if (constraints.maxWidth <= AireBreakpoints.desktop) {
          return (desktop ?? tablet ?? mobile)(context);
        } else {
          return (desktopXL ?? desktop ?? tablet ?? mobile)(context);
        }
      },
    );
  }
}
