import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:app_ui_kit/app_ui_kit.dart';

void main() {
  group('HeadlessValueController', () {
    test('initializes with given value', () {
      final controller = HeadlessValueController<int>(42);
      expect(controller.value, 42);
    });

    test('updates value via callback', () {
      final controller = HeadlessValueController<String>('hello');
      controller.update((value) => '$value world');
      expect(controller.value, 'hello world');
    });

    test('resets to initial value', () {
      final controller = HeadlessValueController<double>(1.0);
      controller.update((value) => value + 5.0);
      expect(controller.value, 6.0);
      controller.reset();
      expect(controller.value, 1.0);
    });

    test('supports custom equality', () {
      final controller = HeadlessValueController<List<int>>([1, 2, 3]);
      var notifyCount = 0;
      controller.addListener(() => notifyCount++);
      controller.update((_) => [1, 2, 3]);
      expect(notifyCount, 1);
    });
  });

  group('ToggleController', () {
    test('initializes as off', () {
      final controller = ToggleController();
      expect(controller.value, false);
    });

    test('turns on', () {
      final controller = ToggleController();
      controller.on();
      expect(controller.value, true);
    });

    test('turns off', () {
      final controller = ToggleController()..on();
      controller.off();
      expect(controller.value, false);
    });

    test('toggles', () {
      final controller = ToggleController();
      controller.toggle();
      expect(controller.value, true);
      controller.toggle();
      expect(controller.value, false);
    });

    test('toggle from off calls listeners', () {
      final controller = ToggleController();
      var callCount = 0;
      controller.addListener(() => callCount++);
      controller.toggle();
      expect(callCount, 1);
    });

    test('on from already-on does not notify', () {
      final controller = ToggleController()..on();
      var callCount = 0;
      controller.addListener(() => callCount++);
      controller.on();
      expect(callCount, 0);
    });
  });

  group('HeadlessBuilder', () {
    testWidgets('renders initial value', (tester) async {
      final controller = HeadlessValueController<String>('initial');

      await tester.pumpWidget(
        MaterialApp(
          home: HeadlessBuilder<String>(
            controller: controller,
            builder: (_, value, __, ___) => Text(value),
          ),
        ),
      );

      expect(find.text('initial'), findsOneWidget);
    });

    testWidgets('rebuilds on controller change', (tester) async {
      final controller = HeadlessValueController<int>(0);

      await tester.pumpWidget(
        MaterialApp(
          home: HeadlessBuilder<int>(
            controller: controller,
            builder: (_, value, __, ___) => Text('count: $value'),
          ),
        ),
      );

      expect(find.text('count: 0'), findsOneWidget);

      controller.update((v) => v + 1);
      await tester.pump();

      expect(find.text('count: 1'), findsOneWidget);
    });

    testWidgets('toggle builder reflects state', (tester) async {
      final controller = ToggleController();

      await tester.pumpWidget(
        MaterialApp(
          home: HeadlessBuilder<bool>(
            controller: controller,
            builder: (_, value, __, ___) => Text(value ? 'on' : 'off'),
          ),
        ),
      );

      expect(find.text('off'), findsOneWidget);

      controller.toggle();
      await tester.pump();

      expect(find.text('on'), findsOneWidget);
    });

    testWidgets('works without child widget', (tester) async {
      final controller = ToggleController();

      await tester.pumpWidget(
        MaterialApp(
          home: HeadlessBuilder<bool>(
            controller: controller,
            builder: (_, value, __, ___) => const SizedBox.shrink(),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}
