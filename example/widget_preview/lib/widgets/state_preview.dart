import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class StatePreview extends StatelessWidget {
  const StatePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('LoadingIndicator:'),
        const SizedBox(height: 8),
        const SizedBox(height: 48, child: LoadingIndicator()),
        const SizedBox(height: 16),
        const Text('LoadingShimmer:'),
        const SizedBox(height: 8),
        Column(
          children: [
            const LoadingShimmer(height: 16, width: 200),
            const SizedBox(height: 8),
            const LoadingShimmer(height: 14, width: 150),
            const SizedBox(height: 8),
            const LoadingShimmer(height: 40, width: 40, radius: 20),
          ],
        ),
        const SizedBox(height: 16),
        const Text('InfoDisplay (empty state):'),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: InfoDisplay(
            icon: const Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
            title: 'No messages yet',
            subtitle: 'When you receive messages, they will appear here.',
          ),
        ),
      ],
    );
  }
}
