import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/src/atoms/link/aire_link.dart';

/// ============================================================
/// INTERACTIVE LINK USE CASE WITH KNOBS
/// ============================================================

@widgetbook.UseCase(name: 'Interactive', type: AireLink)
Widget buildInteractiveLinkUseCase(BuildContext context) {
  // Variant selection
  final variant = context.knobs.list(
    label: 'Variant',
    options: LinkVariant.values,
    labelBuilder: (v) => v.name.toUpperCase(),
    initialOption: LinkVariant.standalone,
  );

  // Size selection
  final size = context.knobs.list(
    label: 'Size',
    options: LinkSize.values,
    labelBuilder: (s) => s.name.toUpperCase(),
    initialOption: LinkSize.medium,
  );

  // Text input
  final text = context.knobs.string(
    label: 'Text',
    initialValue: variant == LinkVariant.inline
        ? 'Inline'
        : variant == LinkVariant.standalone
            ? 'Standalone'
            : 'Command',
  );

  // Enabled toggle
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AireLink(
        text: text,
        variant: variant,
        size: size,
        enabled: enabled,
        onTap: enabled ? () {
          debugPrint('Link tapped: $text');
        } : null,
      ),
    ),
  );
}

/// ============================================================
/// COMPARISON USE CASES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Comparison - All Variants (Medium)', type: AireLink)
Widget buildComparisonVariantsUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Inline',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireLink(
            text: 'Inline',
            variant: LinkVariant.inline,
            size: LinkSize.medium,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Standalone',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireLink(
            text: 'Standalone',
            variant: LinkVariant.standalone,
            size: LinkSize.medium,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const Text(
            'Command',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireLink(
            text: 'Command',
            variant: LinkVariant.command,
            size: LinkSize.medium,
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Comparison - All Sizes (Standalone)', type: AireLink)
Widget buildComparisonSizesUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Small',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireLink(
            text: 'Standalone',
            variant: LinkVariant.standalone,
            size: LinkSize.small,
            onTap: () {},
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
          AireLink(
            text: 'Standalone',
            variant: LinkVariant.standalone,
            size: LinkSize.medium,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Large',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5F6C8E),
            ),
          ),
          const SizedBox(height: 8),
          AireLink(
            text: 'Standalone',
            variant: LinkVariant.standalone,
            size: LinkSize.large,
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}

/// ============================================================
/// REAL-WORLD EXAMPLES (kept for documentation)
/// ============================================================

@widgetbook.UseCase(name: 'Example - Inline in Context', type: AireLink)
Widget buildInlineInContextUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontFamily: 'Figtree',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2A2A2A),
              height: 1.5,
            ),
            children: [
              const TextSpan(
                text: 'Los links se usan como elementos de navegación y se pueden usar solos o ',
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: AireLink(
                  text: 'en línea con el texto',
                  variant: LinkVariant.inline,
                  size: LinkSize.large,
                  onTap: () {
                    // ignore: avoid_print
                    print('Inline link in paragraph tapped');
                  },
                ),
              ),
              const TextSpan(
                text: '. Otro uso de estos es que al click activan una acción secundaria.',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
