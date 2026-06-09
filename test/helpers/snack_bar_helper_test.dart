import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

Widget _buildApp() {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) => Column(
          children: [
            ElevatedButton(
              onPressed: () => SnackBarHelper.showSuccess(context, 'Success!'),
              child: const Text('Show Success'),
            ),
            ElevatedButton(
              onPressed: () => SnackBarHelper.showError(context, 'Error!'),
              child: const Text('Show Error'),
            ),
          ],
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('SnackBarHelper.showSuccess shows snackbar', (tester) async {
    await tester.pumpWidget(_buildApp());

    await tester.tap(find.text('Show Success'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Success!'), findsOneWidget);
  });

  testWidgets('SnackBarHelper.showError shows snackbar', (tester) async {
    await tester.pumpWidget(_buildApp());

    await tester.tap(find.text('Show Error'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Error!'), findsOneWidget);
  });
}
