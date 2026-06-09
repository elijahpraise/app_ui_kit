import 'package:intl/intl.dart';

/// A utility class with static methods for formatting and displaying dates
/// and times in various human-readable forms.
class DateTimeHelper {
  DateTimeHelper._();

  /// Formats [date] with the given [pattern] (e.g. 'MMM d, yyyy') and
  /// optional [locale].
  static String format(
    DateTime date, {
    String pattern = 'MMM d, yyyy',
    String? locale,
  }) {
    final formatter = DateFormat(pattern, locale);
    return formatter.format(date);
  }

  /// Returns a relative time string (e.g. "3h ago", "2d ago", "Just now")
  /// for the given [date].
  static String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()}y ago';
    }
    if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()}mo ago';
    }
    if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    }
    if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    }
    if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    }
    return 'Just now';
  }

  /// Formats [date] as a time string (e.g. "3:30 PM").
  static String formatTime(DateTime date, {String? locale}) {
    return DateFormat('h:mm a', locale).format(date);
  }

  /// Formats [date] as a date string (e.g. "Jan 5, 2025").
  static String formatDate(DateTime date, {String? locale}) {
    return DateFormat('MMM d, yyyy', locale).format(date);
  }

  /// Formats [date] as a combined date and time string (e.g. "Jan 5, 2025
  /// 3:30 PM").
  static String formatDateTime(DateTime date, {String? locale}) {
    return DateFormat('MMM d, yyyy h:mm a', locale).format(date);
  }

  /// Formats [date] as a full day name (e.g. "Monday").
  static String formatDay(DateTime date, {String? locale}) {
    return DateFormat('EEEE', locale).format(date);
  }

  /// Formats [date] as a full month name (e.g. "January").
  static String formatMonth(DateTime date, {String? locale}) {
    return DateFormat('MMMM', locale).format(date);
  }

  /// Returns a relative human-readable string (e.g. "Today", "Yesterday",
  /// "3 weeks ago") for the given [date].
  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 14) return 'Last week';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} weeks ago';
    if (diff.inDays < 60) return 'Last month';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()} months ago';
    return '${(diff.inDays / 365).floor()} years ago';
  }
}
