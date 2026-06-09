import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class AppBarPreview extends StatelessWidget {
  const AppBarPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('AppBarV1 (standalone preview):'),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: AppBarV1(
            hasLeading: false,
            title: const Text('AppBarV1 Title'),
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text('TabBarV1:'),
        const SizedBox(height: 8),
        DefaultTabController(
          length: 3,
          child: SizedBox(
            height: 40,
            child: TabBarV1(
              tabs: const [Tab(text: 'Tab 1'), Tab(text: 'Tab 2'), Tab(text: 'Tab 3')],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text('PersistentHeaderV1: Used in CustomScrollView slivers'),
      ],
    );
  }
}
