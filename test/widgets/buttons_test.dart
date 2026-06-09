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
  group('AppButton', () {
    testWidgets('renders with text', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppButton(text: 'Submit', onTap: null),
      ));

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('fires onTap when pressed', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppButton(text: 'Tap', onTap: () => tapped = true),
      ));

      await tester.tap(find.text('Tap'));
      expect(tapped, isTrue);
    });

    testWidgets('does not fire onTap when disabled', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppButton(text: 'Tap', onTap: () => tapped = true, enabled: false),
      ));

      await tester.tap(find.text('Tap'));
      expect(tapped, isFalse);
    });

    testWidgets('shows loading indicator when loading', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppButton(text: 'Save', loading: true),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Save'), findsNothing);
    });

    testWidgets('renders primary type with correct colors', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppButton(text: 'Primary', type: AppButtonType.primary),
      ));

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = button.style!;
      final bg = style.backgroundColor?.resolve({WidgetState.focused});
      expect(bg, isNotNull);
    });

    testWidgets('renders secondary type', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppButton(text: 'Secondary', type: AppButtonType.secondary),
      ));

      expect(find.text('Secondary'), findsOneWidget);
    });

    testWidgets('renders error type', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppButton(text: 'Danger', type: AppButtonType.error),
      ));

      expect(find.text('Danger'), findsOneWidget);
    });

    testWidgets('icon factory renders icon and text', (tester) async {
      await tester.pumpWidget(boilerplate(
        AppButton.icon(
          text: 'Add',
          icon: const Icon(Icons.add),
          onTap: () {},
        ),
      ));

      expect(find.text('Add'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('accepts custom height and width', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppButton(text: 'Wide', height: 56, width: 200),
      ));

      final sizedBox = tester.widget<SizedBox>(
        find.byType(SizedBox).first,
      );
      expect(sizedBox.width, 200);
    });

    testWidgets('cannot press when loading', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppButton(text: 'Load', onTap: () => tapped = true, loading: true),
      ));

      await tester.tap(find.byType(ElevatedButton));
      expect(tapped, isFalse);
    });
  });

  group('AppOutlineButton', () {
    testWidgets('renders with text', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppOutlineButton(text: 'Outline', onTap: null),
      ));

      expect(find.text('Outline'), findsOneWidget);
    });

    testWidgets('fires onTap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppOutlineButton(text: 'Tap', onTap: () => tapped = true),
      ));

      await tester.tap(find.text('Tap'));
      expect(tapped, isTrue);
    });

    testWidgets('does not fire when disabled', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppOutlineButton(
          text: 'Tap',
          onTap: () => tapped = true,
          enabled: false,
        ),
      ));

      await tester.tap(find.text('Tap'));
      expect(tapped, isFalse);
    });

    testWidgets('shows loading indicator when loading', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppOutlineButton(text: 'Saving', loading: true),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Saving'), findsNothing);
    });

    testWidgets('renders with custom border width', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppOutlineButton(text: 'Thick', borderWidth: 3),
      ));

      final button = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
      final style = button.style!;
      final side = style.side?.resolve({});
      expect(side?.width, 3);
    });
  });

  group('AppTextButton', () {
    testWidgets('renders with text', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppTextButton(text: 'TextBtn', onTap: null),
      ));

      expect(find.text('TextBtn'), findsOneWidget);
    });

    testWidgets('fires onTap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppTextButton(text: 'Click', onTap: () => tapped = true),
      ));

      await tester.tap(find.text('Click'));
      expect(tapped, isTrue);
    });

    testWidgets('disabled prevents tap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(boilerplate(
        AppTextButton(
          text: 'Click',
          onTap: () => tapped = true,
          enabled: false,
        ),
      ));

      await tester.tap(find.text('Click'));
      expect(tapped, isFalse);
    });

    testWidgets('shows loading indicator', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppTextButton(text: 'Wait', loading: true),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error type', (tester) async {
      await tester.pumpWidget(boilerplate(
        const AppTextButton(
          text: 'Delete',
          type: AppButtonType.error,
        ),
      ));

      expect(find.text('Delete'), findsOneWidget);
    });
  });
}
