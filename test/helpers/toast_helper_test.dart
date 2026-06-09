import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

Widget _buildApp() {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) => Column(
          children: [
            ElevatedButton(
              onPressed: () => ToastHelper.showSuccess(context, 'Success toast'),
              child: const Text('Show Success'),
            ),
            ElevatedButton(
              onPressed: () => ToastHelper.showError(context, 'Error toast'),
              child: const Text('Show Error'),
            ),
          ],
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('ToastHelper.showSuccess renders without error', (tester) async {
    await tester.pumpWidget(_buildApp());

    await tester.tap(find.text('Show Success'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Success toast'), findsOneWidget);

    // Clean up pending timers from flutter_styled_toast
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('ToastHelper.showError renders without error', (tester) async {
    await tester.pumpWidget(_buildApp());

    await tester.tap(find.text('Show Error'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Error toast'), findsOneWidget);

    // Clean up pending timers from flutter_styled_toast
    await tester.pump(const Duration(seconds: 5));
  });
}
