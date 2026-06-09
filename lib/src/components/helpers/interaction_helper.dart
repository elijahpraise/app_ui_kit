import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A utility class with static methods for common user interaction tasks
/// such as clipboard access and keyboard management.
class InteractionHelper {
  InteractionHelper._();

  /// Copies [text] to the system clipboard. Optionally shows a [snackBarMessage]
  /// via the given [context].
  static void copyToClipboard(String text, {String? snackBarMessage, BuildContext? context}) {
    Clipboard.setData(ClipboardData(text: text));
    if (context != null && snackBarMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(snackBarMessage)),
      );
    }
  }

  /// Dismisses the soft keyboard by unfocusing the current [context].
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Displays a temporary tooltip overlay with the given [message] centered
  /// on screen. Auto-removes after 2 seconds.
  static void showTooltip(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: MediaQuery.of(context).size.height / 2,
        left: MediaQuery.of(context).size.width / 2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              message,
              style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 12),
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), entry.remove);
  }
}
