import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

Widget _buildApp() {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () => DialogHelper.showActionDialog(
            context: context,
            dialog: const ActionDialog(
              title: 'Test Dialog',
              subtitle: 'Are you sure?',
            ),
          ),
          child: const Text('Show'),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('DialogHelper.showActionDialog shows dialog', (tester) async {
    await tester.pumpWidget(_buildApp());

    await tester.tap(find.text('Show'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Test Dialog'), findsOneWidget);
    expect(find.text('Are you sure?'), findsOneWidget);
  });
}
