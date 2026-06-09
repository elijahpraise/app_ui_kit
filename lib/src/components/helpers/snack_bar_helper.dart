import 'package:flutter/material.dart';

/// A utility class with static methods for showing styled snack bars
/// (default, success, error, info).
class SnackBarHelper {
  SnackBarHelper._();

  /// Shows a [SnackBar] with the given [message], [duration], optional
  /// [action], [backgroundColor], and [textColor].
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor ?? theme.snackBarTheme.contentTextStyle?.color ?? Colors.white),
        ),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor ?? theme.snackBarTheme.backgroundColor,
        behavior: theme.snackBarTheme.behavior ?? SnackBarBehavior.floating,
        shape: theme.snackBarTheme.shape,
      ),
    );
  }

  /// Shows a green success snack bar with the given [message].
  static void showSuccess(BuildContext context, String message) {
    show(
      context: context,
      message: message,
      backgroundColor: const Color(0xFF10B981),
    );
  }

  /// Shows a red error snack bar with the given [message].
  static void showError(BuildContext context, String message) {
    show(
      context: context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  /// Shows a primary-colored info snack bar with the given [message].
  static void showInfo(BuildContext context, String message) {
    show(
      context: context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
