import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

void main() {
  group('DateTimeHelper', () {
    test('format returns formatted string', () {
      final dt = DateTime(2025, 3, 15, 14, 30);
      expect(DateTimeHelper.format(dt), contains('2025'));
      expect(DateTimeHelper.format(dt, pattern: 'MMM d, yyyy HH:mm'), contains('14:30'));
    });

    test('timeAgo returns correct relative time', () {
      final now = DateTime.now();
      expect(
        DateTimeHelper.timeAgo(now.subtract(const Duration(minutes: 5))),
        contains('5'),
      );
    });
  });
}
