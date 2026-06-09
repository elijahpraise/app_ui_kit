import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class DialogPreview extends StatelessWidget {
  const DialogPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ActionDialog:'),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Show ActionDialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const ActionDialog(
                title: 'Confirm Action',
                subtitle: 'Are you sure you want to proceed?',
                primaryText: 'Confirm',
                secondaryText: 'Cancel',
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        const Text('BottomSheetSelectContent:'),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Show Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => BottomSheetSelectContent<String>(
                items: const [
                  SelectItem(label: 'Item A', value: 'a'),
                  SelectItem(label: 'Item B', value: 'b'),
                  SelectItem(label: 'Item C', value: 'c'),
                ],
                onSelected: (item) {},
                title: 'Select an option',
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        const Text('ToastV1 (inline preview):'),
        const SizedBox(height: 8),
        ToastV1(message: 'This is an info toast'),
        const SizedBox(height: 8),
        const ToastV1(message: 'Success!', type: ToastType.success),
        const SizedBox(height: 8),
        const ToastV1(message: 'Something went wrong', type: ToastType.error),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Show Toast via helper'),
          onPressed: () => ToastHelper.showSuccess(context, 'Operation completed!'),
        ),
      ],
    );
  }
}
