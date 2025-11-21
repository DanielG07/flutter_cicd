import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

void main() {
  runApp(const AireDesignSystemExample());
}

class AireDesignSystemExample extends StatelessWidget {
  const AireDesignSystemExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIRE Design System Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AireColors.primary400),
        useMaterial3: true,
      ),
      home: const ComponentShowcasePage(),
    );
  }
}

class ComponentShowcasePage extends StatefulWidget {
  const ComponentShowcasePage({super.key});

  @override
  State<ComponentShowcasePage> createState() => _ComponentShowcasePageState();
}

class _ComponentShowcasePageState extends State<ComponentShowcasePage> {
  bool checkboxValue = false;
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIRE Design System'),
        backgroundColor: AireColors.primary400,
        foregroundColor: AireColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Buttons
            Text(
              'Buttons',
              style: AireTextStyles.heading3Bold,
            ),
            AireSpacing.verticalSpaceMd,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AireButton(
                  text: 'Primary',
                  variant: ButtonVariant.primary,
                  onPressed: () {},
                ),
                AireButton(
                  text: 'Secondary',
                  variant: ButtonVariant.secondary,
                  onPressed: () {},
                ),
                AireButton(
                  text: 'Tertiary',
                  variant: ButtonVariant.tertiary,
                  onPressed: () {},
                ),
              ],
            ),
            AireSpacing.verticalSpaceXl,

            // Section: Inputs
            Text(
              'Input Text',
              style: AireTextStyles.heading3Bold,
            ),
            AireSpacing.verticalSpaceMd,
            const AireInputText(
              label: 'Email',
              placeholder: 'Enter your email',
            ),
            AireSpacing.verticalSpaceXl,

            // Section: Checkbox
            Text(
              'Checkbox',
              style: AireTextStyles.heading3Bold,
            ),
            AireSpacing.verticalSpaceMd,
            AireCheckbox(
              label: 'I accept the terms and conditions',
              value: checkboxValue,
              onChanged: (value) {
                setState(() {
                  checkboxValue = value;
                });
              },
            ),
            AireSpacing.verticalSpaceXl,

            // Section: Chips
            Text(
              'Chips',
              style: AireTextStyles.heading3Bold,
            ),
            AireSpacing.verticalSpaceMd,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AireChip.filter(text: 'Flutter', onTap: () {}),
                AireChip.filter(text: 'Design System', onTap: () {}),
                AireChip.input(text: 'AIRE'),
              ],
            ),
            AireSpacing.verticalSpaceXl,

            // Section: Slider
            Text(
              'Slider',
              style: AireTextStyles.heading3Bold,
            ),
            AireSpacing.verticalSpaceMd,
            AireSlider(
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            AireSpacing.verticalSpaceXl,

            // Section: Design Tokens
            Text(
              'Design Tokens',
              style: AireTextStyles.heading3Bold,
            ),
            AireSpacing.verticalSpaceMd,
            Text(
              'Colors',
              style: AireTextStyles.heading4Bold,
            ),
            AireSpacing.verticalSpaceSm,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ColorSwatch('Primary', AireColors.primary400),
                _ColorSwatch('Secondary', AireColors.secondary400),
                _ColorSwatch('Success', AireColors.success500),
                _ColorSwatch('Error', AireColors.error500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorSwatch(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AireBorderRadius.borderMd,
            border: Border.all(color: AireColors.neutral200),
          ),
        ),
        AireSpacing.verticalSpace2xs,
        Text(
          label,
          style: AireTextStyles.bodySmallRegular,
        ),
      ],
    );
  }
}
