import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system/design_system.dart';

void main() {
  group('Atomic Design System Tests', () {
    // ATOMS Tests
    group('Atoms', () {
      test('Color tokens have correct values', () {
        // ignore: deprecated_member_use
        expect(DSColorTokens.primary.value, 0xFF2196F3);
        // ignore: deprecated_member_use
        expect(DSColorTokens.onPrimary.value, 0xFFFFFFFF);
      });

      test('Spacing tokens have correct values', () {
        expect(DSSpacingTokens.xs, 4);
        expect(DSSpacingTokens.md, 16);
        expect(DSSpacingTokens.lg, 24);
      });

      test('Typography tokens are defined', () {
        expect(DSTypographyTokens.headlineLarge.fontSize, 32);
        expect(DSTypographyTokens.bodyMedium.fontSize, 14);
      });
    });

    // CORE Tests
    group('Core', () {
      test('DSTheme creates valid ThemeData', () {
        final theme = DSTheme.lightTheme;
        expect(theme.colorScheme.primary, DSColorTokens.primary);
        expect(theme.scaffoldBackgroundColor, DSColorTokens.background);
      });
    });

    // DATA Models Tests
    group('Data Models', () {
      test('DSProductData model works correctly', () {
        const product = DSProductData(
          id: '1',
          title: 'Test Product',
          price: '\$10.00',
          description: 'Test description',
        );

        expect(product.id, '1');
        expect(product.title, 'Test Product');
        expect(product.price, '\$10.00');
      });

      test('DSBottomNavItem model works correctly', () {
        const navItem = DSBottomNavItem(icon: Icons.home, label: 'Home');

        expect(navItem.icon, Icons.home);
        expect(navItem.label, 'Home');
      });
    });
  });
}
