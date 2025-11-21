import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/button/aire_button.dart';
import 'package:design_system/src/design_tokens/design_tokens.dart';

/// ============================================================
/// INTERACTIVE BUTTON USE CASE WITH KNOBS
/// ============================================================
///
/// COVERAGE STATUS (validated against Figma 2025-10-20):
/// ✓ Variants: Primary, Secondary, Tertiary, Ghost
/// ✓ Sizes: Large, Medium, Small, xSmall
/// ✓ States: Default (enabled=true), Disabled (enabled=false)
/// ✓ Icon Configurations: None, Left, Right, Icon Only
/// ⚠️ Loading State: NOT IMPLEMENTED in AireButton component yet
/// ⚠️ Interactive States (hover, focus, pressed): Flutter-managed, not controllable via knobs
///
@widgetbook.UseCase(name: 'Interactive', type: AireButton)
Widget buildInteractiveButtonUseCase(BuildContext context) {
  // Knobs for variant selection
  final variant = context.knobs.list(
    label: 'Variant',
    options: ButtonVariant.values,
    labelBuilder: (v) => v.name.toUpperCase(),
    initialOption: ButtonVariant.primary,
  );

  // Knobs for size selection
  final size = context.knobs.list(
    label: 'Size',
    options: ButtonSize.values,
    labelBuilder: (s) => s.name.toUpperCase(),
    initialOption: ButtonSize.medium,
  );

  // Knobs for text
  final text = context.knobs.string(
    label: 'Text',
    initialValue: 'Button',
  );

  // Knobs for enabled state
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  // Knobs for icon configuration
  final iconPosition = context.knobs.list(
    label: 'Icon Position',
    options: ['None', 'Left', 'Right', 'Icon Only'],
    initialOption: 'None',
  );

  // Determine icon color based on variant using design tokens
  Color getIconColor() {
    if (!enabled) {
      return AireColors.neutral400;
    }
    switch (variant) {
      case ButtonVariant.primary:
        return AireColors.white;
      case ButtonVariant.secondary:
      case ButtonVariant.tertiary:
      case ButtonVariant.ghost:
        return AireColors.primary400;
    }
  }

  // Determine icon size based on button size
  double getIconSize() {
    switch (size) {
      case ButtonSize.large:
        return 24;
      case ButtonSize.medium:
        return 18;
      case ButtonSize.small:
        return 16;
      case ButtonSize.xsmall:
        return 14;
    }
  }

  Widget? leading;
  Widget? trailing;
  String displayText = text;

  if (iconPosition == 'Left') {
    leading = Icon(
      Icons.add,
      size: getIconSize(),
      color: getIconColor(),
    );
  } else if (iconPosition == 'Right') {
    trailing = Icon(
      Icons.arrow_forward,
      size: getIconSize(),
      color: getIconColor(),
    );
  } else if (iconPosition == 'Icon Only') {
    leading = Icon(
      Icons.add,
      size: getIconSize(),
      color: getIconColor(),
    );
    displayText = ''; // Empty text for icon-only button
  }

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireButton(
        text: displayText,
        variant: variant,
        size: size,
        enabled: enabled,
        leading: leading,
        trailing: trailing,
        onPressed: () {
          // ignore: avoid_print
          print('Button pressed: $variant - $size');
        },
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Variants (Medium)', type: AireButton)
Widget buildComparisonVariantsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Primary',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Secondary',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.secondary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Tertiary',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.tertiary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Ghost',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.ghost,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Sizes (Primary)', type: AireButton)
Widget buildComparisonSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Large',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Medium',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Small',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'xSmall',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.xsmall,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Icon Positions (Primary)', type: AireButton)
Widget buildComparisonIconPositionsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sin ícono',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Ícono izquierda',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            leading: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Ícono derecha',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            trailing: const Icon(
              Icons.arrow_forward,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Solo ícono',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: '',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            leading: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - Enabled vs Disabled', type: AireButton)
Widget buildComparisonEnabledDisabledUseCase(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Primary
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Primary - Enabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.primary,
                      size: ButtonSize.medium,
                      enabled: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  children: [
                    const Text(
                      'Primary - Disabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.primary,
                      size: ButtonSize.medium,
                      enabled: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Secondary
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Secondary - Enabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.secondary,
                      size: ButtonSize.medium,
                      enabled: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  children: [
                    const Text(
                      'Secondary - Disabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.secondary,
                      size: ButtonSize.medium,
                      enabled: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Tertiary
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Tertiary - Enabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.tertiary,
                      size: ButtonSize.medium,
                      enabled: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  children: [
                    const Text(
                      'Tertiary - Disabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.tertiary,
                      size: ButtonSize.medium,
                      enabled: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Ghost
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Ghost - Enabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.medium,
                      enabled: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  children: [
                    const Text(
                      'Ghost - Disabled',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5F6C8E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AireButton(
                      text: 'Button',
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.medium,
                      enabled: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Sizes Disabled', type: AireButton)
Widget buildComparisonDisabledSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Large - Disabled',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            enabled: false,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Medium - Disabled',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            enabled: false,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Small - Disabled',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            enabled: false,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'xSmall - Disabled',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireButton(
            text: 'Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.xsmall,
            enabled: false,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// STATIC USE CASES (Specific Figma Examples)
/// ============================================================

@widgetbook.UseCase(name: 'Static - Disabled with Icon Left', type: AireButton)
Widget buildStaticDisabledIconLeftUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireButton(
        text: 'Button',
        variant: ButtonVariant.primary,
        size: ButtonSize.medium,
        enabled: false,
        leading: Icon(
          Icons.add,
          size: 18,
          color: AireColors.neutral400,
        ),
        onPressed: () {},
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Static - Icon Only Disabled', type: AireButton)
Widget buildStaticIconOnlyDisabledUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireButton(
        text: '',
        variant: ButtonVariant.primary,
        size: ButtonSize.medium,
        enabled: false,
        leading: Icon(
          Icons.add,
          size: 18,
          color: AireColors.neutral400,
        ),
        onPressed: () {},
      ),
    ),
  );
}

/// ============================================================
/// LOADING STATE DOCUMENTATION
/// ============================================================
///
/// NOTE: Loading state is documented extensively in Figma but is NOT YET
/// IMPLEMENTED in the AireButton component.
///
/// Figma shows loading states for:
/// - All variants (Primary, Secondary, Tertiary, Ghost)
/// - All sizes (xSmall, Small, Medium, Large)
/// - With/without icons
/// - With/without labels
///
/// Loading state typically shows:
/// - A CircularProgressIndicator replacing or alongside the icon
/// - Disabled appearance (button not clickable during loading)
/// - Optional loading text
///
/// To implement loading state, the AireButton component would need:
/// 1. A new `isLoading` boolean parameter
/// 2. Logic to show CircularProgressIndicator when loading
/// 3. Automatic disabling when isLoading=true
/// 4. Size-appropriate spinner dimensions
///
/// HOVER/FOCUS/PRESSED STATES:
/// These states are documented in Figma but are managed automatically by
/// Flutter's Material Design system. They cannot be controlled via knobs
/// in Widgetbook but are visible during interaction with the actual button.
///
/// - hover: Shows when mouse is over the button (desktop/web)
/// - focus: Shows when button is focused via keyboard navigation
/// - pressed: Shows momentarily when button is clicked/tapped
///
/// These states use Flutter's built-in interaction effects and don't require
/// separate use cases in Widgetbook.
/// ============================================================
