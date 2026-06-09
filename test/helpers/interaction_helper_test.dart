import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

void main() {
  testWidgets('InteractionHelper.copyToClipboard copies text', (tester) async {
    String? clipboardContent;

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (MethodCall methodCall) async {
        if (methodCall.method == 'Clipboard.setData') {
          clipboardContent = (methodCall.arguments as Map)['text'] as String?;
        }
        return null;
      },
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => InteractionHelper.copyToClipboard(
              'copied text',
              context: context,
            ),
            child: const Text('Copy'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Copy'));
    await tester.pump();

    expect(clipboardContent, 'copied text');
  });
}
