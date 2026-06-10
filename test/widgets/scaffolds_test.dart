import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: AppTheme.build(preset: DesignPreset.defaultPreset),
    home: child,
  );
}

void main() {
  group('BaseScaffold', () {
    testWidgets('renders body content', (tester) async {
      await tester.pumpWidget(
        boilerplate(const BaseScaffold(body: Text('Hello'))),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('renders with app bar', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          BaseScaffold(
            appBar: AppBarV1(hasLeading: false, title: const Text('Title')),
            body: const Text('Body'),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
    });
  });

  group('ScaffoldV1', () {
    testWidgets('renders body when not loading', (tester) async {
      await tester.pumpWidget(
        boilerplate(const AppScaffold(body: Text('Content'), isLoading: false)),
      );

      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('shows overlay when loading', (tester) async {
      await tester.pumpWidget(
        boilerplate(const AppScaffold(body: Text('Content'), isLoading: true)),
      );

      expect(find.byType(LoadingOverlayV1), findsOneWidget);
    });
  });

  group('LoadingOverlayV1', () {
    testWidgets('shows child when not loading', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const LoadingOverlayV1(isLoading: false, child: Text('Content')),
        ),
      );

      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('shows overlay when loading', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          const LoadingOverlayV1(isLoading: true, child: Text('Content')),
        ),
      );

      expect(find.byType(LoadingIndicator), findsOneWidget);
    });

    testWidgets('shows custom indicator when loading', (tester) async {
      await tester.pumpWidget(
        boilerplate(
          LoadingOverlayV1(
            isLoading: true,
            indicator: const Text('Custom Loader'),
            child: const Text('Content'),
          ),
        ),
      );

      expect(find.text('Custom Loader'), findsOneWidget);
    });
  });
}
