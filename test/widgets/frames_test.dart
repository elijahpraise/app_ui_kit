import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: AppTheme.build(preset: DesignPreset.defaultPreset),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('IconFrame', () {
    testWidgets('renders icon', (tester) async {
      await tester.pumpWidget(
        boilerplate(const IconFrame(icon: Icon(Icons.star))),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('renders with custom size', (tester) async {
      await tester.pumpWidget(
        boilerplate(const IconFrame(icon: Icon(Icons.star), size: 64)),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('renders with custom radius', (tester) async {
      await tester.pumpWidget(
        boilerplate(const IconFrame(icon: Icon(Icons.star), radius: 16)),
      );

      expect(find.byType(Container), findsOneWidget);
    });
  });

  group('ListFrame', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpWidget(
        boilerplate(const ListFrame(child: Text('Content'))),
      );

      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('renders with custom padding', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ListFrame(padding: EdgeInsets.all(32), child: Text('Padded')),
        ),
      );

      expect(find.text('Padded'), findsOneWidget);
    });

    testWidgets('renders with elevation shadow', (tester) async {
      await tester.pumpWidget(
        boilerplate(const ListFrame(elevation: 4, child: Text('Elevated'))),
      );

      expect(find.text('Elevated'), findsOneWidget);
    });
  });

  group('ProfileFrame', () {
    testWidgets('renders with icon for no image', (tester) async {
      await tester.pumpWidget(boilerplate(const ProfileFrame()));

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('renders custom child', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const ProfileFrame(child: Icon(Icons.admin_panel_settings)),
        ),
      );

      expect(find.byIcon(Icons.admin_panel_settings), findsOneWidget);
    });

    testWidgets('renders with custom size', (tester) async {
      await tester.pumpWidget(boilerplate(const ProfileFrame(size: 80)));

      expect(find.byIcon(Icons.person), findsOneWidget);
    });
  });
}
