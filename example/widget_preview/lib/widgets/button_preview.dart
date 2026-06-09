import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class ButtonPreview extends StatelessWidget {
  const ButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('AppButton (primary / secondary / error):'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8, runSpacing: 8,
          children: [
            AppButton(text: 'Primary', type: AppButtonType.primary, onTap: () {}),
            AppButton(text: 'Secondary', type: AppButtonType.secondary, onTap: () {}),
            AppButton(text: 'Error', type: AppButtonType.error, onTap: () {}),
          ],
        ),
        const SizedBox(height: 8),
        AppButton.icon(
          text: 'With Icon',
          icon: const Icon(Icons.add),
          onTap: () {},
        ),
        const SizedBox(height: 8),
        AppButton(text: 'Loading', loading: true, onTap: () {}),
        AppButton(text: 'Disabled', enabled: false, onTap: () {}),
        const SizedBox(height: 16),
        const Text('AppOutlineButton:'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8, runSpacing: 8,
          children: [
            AppOutlineButton(text: 'Outline', type: AppButtonType.primary, onTap: () {}),
            AppOutlineButton(text: 'Disabled', enabled: false, onTap: () {}),
          ],
        ),
        const SizedBox(height: 16),
        const Text('AppTextButton:'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            AppTextButton(text: 'Text', onTap: () {}),
            AppTextButton(text: 'Error', type: AppButtonType.error, onTap: () {}),
            AppTextButton(text: 'Disabled', enabled: false, onTap: () {}),
          ],
        ),
      ],
    );
  }
}
