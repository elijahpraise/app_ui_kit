import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class CustomPreview extends StatelessWidget {
  const CustomPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('DividerV1:'),
          const SizedBox(height: 8),
          const DividerV1(),
          const SizedBox(height: 4),
          const DividerV1(thickness: 2, indent: 16, endIndent: 16),
          const SizedBox(height: 16),
          const Text('Dot:'),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            const Dot(),
            Dot(color: Colors.green, size: 12),
            const Dot(active: false),
          ]),
          const SizedBox(height: 16),
          const Text('ExpansionTileV1:'),
          const SizedBox(height: 8),
          const ExpansionTileV1(
            title: Text('Tap to expand'),
            children: [Padding(
              padding: EdgeInsets.all(16),
              child: Text('Expanded content'),
            )],
          ),
          const SizedBox(height: 16),
          const Text('HyperLinkText:'),
          const SizedBox(height: 8),
          HyperLinkText(
            text: 'Click here',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          const Text('InitialsDisplay:'),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            const InitialsDisplay(name: 'John Doe'),
            const InitialsDisplay(name: 'Alice Wonderland', size: 56),
            const InitialsDisplay(name: 'ABC Corp', size: 40, useAcronyms: true),
          ]),
          const SizedBox(height: 16),
          const Text('ListTileV1:'),
          const SizedBox(height: 8),
          const ListTileV1(
            title: Text('List Item'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.folder),
            divider: true,
          ),
          const SizedBox(height: 16),
          const Text('PasswordStrengthChecker:'),
          const SizedBox(height: 8),
          const PasswordStrengthChecker(password: 'Weak1'),
        ],
      ),
    );
  }
}
