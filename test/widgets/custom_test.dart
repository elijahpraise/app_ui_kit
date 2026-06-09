import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: AppTheme.build(preset: DesignPreset.defaultPreset),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('Dot', () {
    testWidgets('renders with default size', (tester) async {
      await tester.pumpWidget(boilerplate(const Dot()));

      final container = find.descendant(
        of: find.byType(Dot),
        matching: find.byType(Container),
      );
      final size = tester.getSize(container);
      expect(size.width, 8);
      expect(size.height, 8);
    });

    testWidgets('renders with custom size', (tester) async {
      await tester.pumpWidget(boilerplate(const Dot(size: 16)));

      final container = find.descendant(
        of: find.byType(Dot),
        matching: find.byType(Container),
      );
      final size = tester.getSize(container);
      expect(size.width, 16);
    });

    testWidgets('active dot uses primary color', (tester) async {
      await tester.pumpWidget(boilerplate(const Dot(active: true)));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.shape, BoxShape.circle);
    });

    testWidgets('inactive dot renders', (tester) async {
      await tester.pumpWidget(boilerplate(const Dot(active: false)));

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('renders with custom active color', (tester) async {
      await tester.pumpWidget(
        boilerplate(const Dot(active: true, color: Colors.red)),
      );

      expect(find.byType(Container), findsOneWidget);
    });
  });

  group('InitialsDisplay', () {
    testWidgets('renders initials from full name', (tester) async {
      await tester.pumpWidget(
        boilerplate(const InitialsDisplay(name: 'John Doe')),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders single initial for one name', (tester) async {
      await tester.pumpWidget(
        boilerplate(const InitialsDisplay(name: 'Alice')),
      );

      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('renders acronym when useAcronyms is true', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const InitialsDisplay(
            name: 'International Business Machines',
            useAcronyms: true,
            maxLetters: 3,
          ),
        ),
      );

      expect(find.text('IBM'), findsOneWidget);
    });

    testWidgets('respects maxLetters', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const InitialsDisplay(name: 'John Michael Doe', maxLetters: 1),
        ),
      );

      expect(find.text('J'), findsOneWidget);
    });

    testWidgets('renders with custom size', (tester) async {
      await tester.pumpWidget(
        boilerplate(const InitialsDisplay(name: 'Test', size: 64)),
      );

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('renders fallback for empty name', (tester) async {
      await tester.pumpWidget(boilerplate(const InitialsDisplay(name: '')));

      expect(find.text('?'), findsOneWidget);
    });
  });

  group('DividerV1', () {
    testWidgets('renders horizontal divider', (tester) async {
      await tester.pumpWidget(boilerplate(const DividerV1()));

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('renders vertical divider', (tester) async {
      await tester.pumpWidget(
        boilerplate(const DividerV1(vertical: true, height: 100)),
      );

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('renders with custom thickness', (tester) async {
      await tester.pumpWidget(boilerplate(const DividerV1(thickness: 3)));

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, 3);
    });
  });

  group('ListTileV1', () {
    testWidgets('renders title', (tester) async {
      await tester.pumpWidget(
        boilerplate(const ListTileV1(title: Text('Item'))),
      );

      expect(find.text('Item'), findsOneWidget);
    });

    testWidgets('renders subtitle', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ListTileV1(title: Text('Item'), subtitle: Text('Description')),
        ),
      );

      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('renders leading icon', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ListTileV1(title: Text('Item'), leading: Icon(Icons.star)),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('fires onTap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        boilerplate(
          ListTileV1(title: const Text('Item'), onTap: () => tapped = true),
        ),
      );

      await tester.tap(find.text('Item'));
      expect(tapped, isTrue);
    });

    testWidgets('renders with divider', (tester) async {
      await tester.pumpWidget(
        boilerplate(const ListTileV1(title: Text('Item'), divider: true)),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('does not fire onTap when disabled', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        boilerplate(
          ListTileV1(
            title: const Text('Item'),
            onTap: () => tapped = true,
            enabled: false,
          ),
        ),
      );

      await tester.tap(find.text('Item'));
      expect(tapped, isFalse);
    });
  });

  group('ExpansionTileV1', () {
    testWidgets('renders title when collapsed', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ExpansionTileV1(
            title: Text('Expand'),
            children: [Text('Content')],
          ),
        ),
      );

      expect(find.text('Expand'), findsOneWidget);
      expect(find.text('Content'), findsNothing);
    });

    testWidgets('expands on tap', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ExpansionTileV1(
            title: Text('Expand'),
            children: [Text('Content')],
          ),
        ),
      );

      await tester.tap(find.text('Expand'));
      await tester.pumpAndSettle();

      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('expands initially when set', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ExpansionTileV1(
            title: Text('Expand'),
            initiallyExpanded: true,
            children: [Text('Content')],
          ),
        ),
      );

      expect(find.text('Content'), findsOneWidget);
    });
  });

  group('HyperLinkText', () {
    testWidgets('renders link text', (tester) async {
      await tester.pumpWidget(
        boilerplate(HyperLinkText(text: 'Click here', onTap: () {})),
      );

      expect(find.text('Click here'), findsOneWidget);
    });

    testWidgets('fires onTap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        boilerplate(HyperLinkText(text: 'Link', onTap: () => tapped = true)),
      );

      await tester.tap(find.text('Link'));
      expect(tapped, isTrue);
    });
  });

  group('PasswordStrengthChecker', () {
    testWidgets('renders with weak password', (tester) async {
      await tester.pumpWidget(
        boilerplate(const PasswordStrengthChecker(password: 'abc')),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with strong password', (tester) async {
      await tester.pumpWidget(
        boilerplate(const PasswordStrengthChecker(password: 'Abcd!2345xyz')),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with empty password', (tester) async {
      await tester.pumpWidget(
        boilerplate(const PasswordStrengthChecker(password: '')),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
  });
}
