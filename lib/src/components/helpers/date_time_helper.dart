import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();

  static String format(
    DateTime date, {
    String pattern = 'MMM d, yyyy',
    String? locale,
  }) {
    final formatter = DateFormat(pattern, locale);
    return formatter.format(date);
  }

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

  static String formatTime(DateTime date, {String? locale}) {
    return DateFormat('h:mm a', locale).format(date);
  }

  static String formatDate(DateTime date, {String? locale}) {
    return DateFormat('MMM d, yyyy', locale).format(date);
  }

  static String formatDateTime(DateTime date, {String? locale}) {
    return DateFormat('MMM d, yyyy h:mm a', locale).format(date);
  }

  static String formatDay(DateTime date, {String? locale}) {
    return DateFormat('EEEE', locale).format(date);
  }

  static String formatMonth(DateTime date, {String? locale}) {
    return DateFormat('MMMM', locale).format(date);
  }

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
