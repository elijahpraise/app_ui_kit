import 'package:flutter/material.dart';

/// Defines the visual style variants for toast notifications.
enum ToastType { info, error, success }

extension ToastTypeColor on ToastType {
  Color resolveColor(ThemeData theme) {
    return switch (this) {
      ToastType.info => theme.colorScheme.primary,
      ToastType.error => theme.colorScheme.error,
      ToastType.success => const Color(0xFF10B981),
    };
  }

  Color resolveOnColor(ThemeData theme) {
    return switch (this) {
      ToastType.info => theme.colorScheme.onPrimary,
      ToastType.error => theme.colorScheme.onError,
      ToastType.success => Colors.white,
    };
  }

  IconData get icon {
    return switch (this) {
      ToastType.info => Icons.info_outline,
      ToastType.error => Icons.error_outline,
      ToastType.success => Icons.check_circle_outline,
    };
  }
}

/// A lightweight toast notification widget with type-based styling.
class ToastV1 extends StatelessWidget {
  /// Creates a [ToastV1].
  const ToastV1({
    required this.message,
    this.type = ToastType.info,
    this.onClose,
    this.title,
    this.duration,
    super.key,
  });

  /// The message text displayed in the toast.
  final String message;

  /// The visual style variant of the toast.
  final ToastType type;

  /// Called when the close button is tapped. If null, the close button is hidden.
  final VoidCallback? onClose;

  /// An optional title displayed above the message.
  final String? title;

  /// The duration the toast should remain visible (for external use).
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = type.resolveColor(theme);
    final fgColor = type.resolveOnColor(theme);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(type.icon, color: fgColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: TextStyle(
                      color: fgColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                Text(
                  message,
                  style: TextStyle(
                    color: fgColor.withValues(alpha: 0.9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onClose,
              child: Icon(Icons.close, color: fgColor, size: 18),
            ),
          ],
        ],
      ),
    );
  }
}
