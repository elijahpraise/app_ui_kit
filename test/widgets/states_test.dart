import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:app_ui_kit/app_ui_kit.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: AppTheme.build(preset: DesignPreset.defaultPreset),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('LoadingIndicator', () {
    testWidgets('renders without crashing', (tester) async {
      await tester.pumpWidget(boilerplate(
        const SizedBox(height: 48, child: LoadingIndicator()),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with custom color', (tester) async {
      await tester.pumpWidget(boilerplate(
        SizedBox(
          height: 48,
          child: LoadingIndicator(color: Colors.red),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('LoadingShimmer', () {
    testWidgets('renders with given dimensions', (tester) async {
      await tester.pumpWidget(boilerplate(
        const LoadingShimmer(height: 20, width: 150),
      ));

      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('renders circular shimmer', (tester) async {
      await tester.pumpWidget(boilerplate(
        const LoadingShimmer(height: 40, width: 40, radius: 20),
      ));

      expect(find.byType(LoadingShimmer), findsOneWidget);
    });
  });

  group('InfoDisplay', () {
    testWidgets('renders title and subtitle', (tester) async {
      await tester.pumpWidget(boilerplate(
        const InfoDisplay(
          title: 'No items',
          subtitle: 'Your list is empty.',
        ),
      ));

      expect(find.text('No items'), findsOneWidget);
      expect(find.text('Your list is empty.'), findsOneWidget);
    });

    testWidgets('renders icon', (tester) async {
      await tester.pumpWidget(boilerplate(
        const InfoDisplay(
          title: 'Empty',
          icon: Icon(Icons.inbox),
        ),
      ));

      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });

    testWidgets('renders with subtitleAlt', (tester) async {
      await tester.pumpWidget(boilerplate(
        InfoDisplay(
          title: 'Error',
          subtitleAlt: const Text('Custom widget'),
        ),
      ));

      expect(find.text('Custom widget'), findsOneWidget);
    });

    testWidgets('renders title only', (tester) async {
      await tester.pumpWidget(boilerplate(
        const InfoDisplay(title: 'Just a title'),
      ));

      expect(find.text('Just a title'), findsOneWidget);
    });
  });
}
