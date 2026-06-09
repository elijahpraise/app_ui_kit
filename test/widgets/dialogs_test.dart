import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/flutter_ui_kit.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: AppTheme.build(preset: DesignPreset.defaultPreset),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('ToastV1', () {
    testWidgets('renders message', (tester) async {
      await tester.pumpWidget(boilerplate(
        const ToastV1(message: 'Hello'),
      ));

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('renders success toast', (tester) async {
      await tester.pumpWidget(boilerplate(
        const ToastV1(message: 'Success!', type: ToastType.success),
      ));

      expect(find.text('Success!'), findsOneWidget);
    });

    testWidgets('renders error toast', (tester) async {
      await tester.pumpWidget(boilerplate(
        const ToastV1(message: 'Error!', type: ToastType.error),
      ));

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('renders info toast', (tester) async {
      await tester.pumpWidget(boilerplate(
        const ToastV1(message: 'Info', type: ToastType.info),
      ));

      expect(find.text('Info'), findsOneWidget);
    });
  });

  group('ActionDialog', () {
    testWidgets('renders title and subtitle', (tester) async {
      await tester.pumpWidget(boilerplate(
        const ActionDialog(
          title: 'Confirm',
          subtitle: 'Are you sure?',
          primaryText: 'Yes',
          secondaryText: 'No',
        ),
      ));

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
    });

    testWidgets('renders primary and secondary buttons', (tester) async {
      await tester.pumpWidget(boilerplate(
        ActionDialog(
          title: 'Test',
          primaryText: 'OK',
          secondaryText: 'Cancel',
          onSecondary: () {},
        ),
      ));

      expect(find.text('OK'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });
  });

  group('BottomSheetSelectContent', () {
    testWidgets('renders title and items', (tester) async {
      const items = [
        SelectItem(label: 'Option A', value: 'a'),
        SelectItem(label: 'Option B', value: 'b'),
      ];

      await tester.pumpWidget(boilerplate(
        BottomSheetSelectContent<String>(
          items: items,
          onSelected: (_) {},
          title: 'Pick one',
        ),
      ));

      expect(find.text('Pick one'), findsOneWidget);
      expect(find.text('Option A'), findsOneWidget);
      expect(find.text('Option B'), findsOneWidget);
    });
  });
}
