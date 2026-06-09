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
  group('BaseTextField', () {
    testWidgets('renders with hint text', (tester) async {
      await tester.pumpWidget(boilerplate(
        const BaseTextField(hintText: 'Enter text'),
      ));

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(boilerplate(
        const BaseTextField(hintText: 'Hint', labelText: 'Label'),
      ));

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('renders error text', (tester) async {
      await tester.pumpWidget(boilerplate(
        const BaseTextField(
          hintText: 'Test',
          errorText: 'Required field',
        ),
      ));

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('accepts text input', (tester) async {
      await tester.pumpWidget(boilerplate(
        const BaseTextField(hintText: 'Type here'),
      ));

      await tester.enterText(find.byType(TextField), 'Hello');
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('renders with prefix icon', (tester) async {
      await tester.pumpWidget(boilerplate(
        const BaseTextField(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ));

      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });

  group('InputField', () {
    testWidgets('renders with label and field', (tester) async {
      await tester.pumpWidget(boilerplate(
        const InputField(label: 'Email', hintText: 'Enter email'),
      ));

      expect(find.text('Email'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });

  group('PasswordField', () {
    testWidgets('renders and obscures text', (tester) async {
      await tester.pumpWidget(boilerplate(const PasswordField()));

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
    });

    testWidgets('toggles visibility on icon tap', (tester) async {
      await tester.pumpWidget(boilerplate(const PasswordField()));

      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isFalse);
    });
  });

  group('SearchInputField', () {
    testWidgets('renders with hint', (tester) async {
      await tester.pumpWidget(boilerplate(
        SearchInputField<String>(
          items: const [InputItem(label: 'A', value: 'a')],
          onSelected: (_) {},
          hintText: 'Select',
        ),
      ));

      expect(find.text('Select'), findsOneWidget);
    });
  });

  group('Validators', () {
    test('email returns null for valid email', () {
      expect(Validators.email('test@example.com'), isNull);
    });

    test('email returns error for invalid email', () {
      expect(Validators.email('not-email'), isNotEmpty);
    });

    test('email returns error for empty', () {
      expect(Validators.email(''), isNotEmpty);
    });

    test('required returns null for non-empty', () {
      expect(Validators.required('hello'), isNull);
    });

    test('required returns error for empty', () {
      expect(Validators.required(''), isNotEmpty);
    });

    test('minLength returns null for long enough', () {
      expect(Validators.minLength(5)('hello'), isNull);
    });

    test('minLength returns error for too short', () {
      expect(Validators.minLength(6)('hello'), isNotEmpty);
    });

    test('phone returns null for valid number', () {
      expect(Validators.phone('+1234567890'), isNull);
    });

    test('phone returns error for too short', () {
      expect(Validators.phone('12'), isNotEmpty);
    });
  });
}
