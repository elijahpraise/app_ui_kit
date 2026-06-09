import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/flutter_ui_kit.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: AppTheme.build(preset: DesignPreset.defaultPreset),
    home: Scaffold(body: child),
  );
}

void main() {
  group('AppBarV1', () {
    testWidgets('renders title', (tester) async {
      await tester.pumpWidget(boilerplate(
        AppBarV1(hasLeading: false, title: const Text('My App')),
      ));

      expect(find.text('My App'), findsOneWidget);
    });

    testWidgets('renders actions', (tester) async {
      await tester.pumpWidget(boilerplate(
        AppBarV1(
          hasLeading: false,
          title: const Text('App'),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
      ));

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('has correct preferred size', (tester) async {
      const appBar = AppBarV1(hasLeading: false, title: Text('Test'));
      expect(appBar.preferredSize, const Size.fromHeight(kToolbarHeight));
    });

    testWidgets('renders with back button when hasLeading', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBarV1(title: const Text('Back')),
              body: const Text('Page'),
            ),
          ),
        ),
      ));

      expect(find.text('Page'), findsOneWidget);
    });
  });

  group('TabBarV1', () {
    testWidgets('renders tabs', (tester) async {
      await tester.pumpWidget(boilerplate(
        DefaultTabController(
          length: 2,
          child: TabBarV1(
            tabs: const [Tab(text: 'Tab A'), Tab(text: 'Tab B')],
          ),
        ),
      ));

      expect(find.text('Tab A'), findsOneWidget);
      expect(find.text('Tab B'), findsOneWidget);
    });

    testWidgets('has correct preferred size', (tester) async {
      const tabBar = TabBarV1(tabs: [Tab(text: 'A')]);
      expect(tabBar.preferredSize, const Size.fromHeight(kToolbarHeight));
    });
  });
}
