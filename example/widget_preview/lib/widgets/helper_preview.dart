import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class HelperPreview extends StatelessWidget {
  const HelperPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('DateTimeHelper:'),
        const SizedBox(height: 8),
        Text('Now: ${DateTimeHelper.format(DateTime.now())}'),
        Text('Time ago: ${DateTimeHelper.timeAgo(DateTime.now().subtract(const Duration(hours: 3)))}'),
        Text('Relative: ${DateTimeHelper.formatRelative(DateTime.now().subtract(const Duration(days: 2)))}'),
        const SizedBox(height: 16),
        const Text('InteractionHelper:'),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Copy text'),
          onPressed: () => InteractionHelper.copyToClipboard('copied text', context: context),
        ),
        const SizedBox(height: 16),
        const Text('SnackBarHelper:'),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Show SnackBar'),
          onPressed: () => SnackBarHelper.showSuccess(context, 'Success message'),
        ),
        const SizedBox(height: 16),
        const Text('DialogHelper:'),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Show Dialog'),
          onPressed: () => DialogHelper.showActionDialog(
            context: context,
            dialog: const ActionDialog(title: 'Dialog', subtitle: 'Via DialogHelper'),
          ),
        ),
        const SizedBox(height: 16),
        const Text('SliverHelper: static methods for sliver layouts'),
        const SizedBox(height: 8),
        const Text('  • fillRemaining, scrollable, separatedList, breadcrumb, fixedExtentList, padded'),
      ],
    );
  }
}
