import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class FramePreview extends StatelessWidget {
  const FramePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('IconFrame:'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            IconFrame(icon: const Icon(Icons.star)),
            IconFrame(icon: const Icon(Icons.favorite, color: Colors.red), size: 48),
            IconFrame(icon: const Icon(Icons.settings), size: 32),
          ],
        ),
        const SizedBox(height: 16),
        const Text('ListFrame:'),
        const SizedBox(height: 8),
        ListFrame(
          child: Column(
            children: [
              const Text('Item 1'),
              const Divider(),
              const Text('Item 2'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('ProfileFrame:'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            const ProfileFrame(size: 48),
            const ProfileFrame(size: 64),
            ProfileFrame(
              size: 48,
              child: const Icon(Icons.person),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('ScreenFrame: Named constructors for scroll layouts'),
      ],
    );
  }
}
