import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InteractionHelper {
  InteractionHelper._();

  static void copyToClipboard(String text, {String? snackBarMessage, BuildContext? context}) {
    Clipboard.setData(ClipboardData(text: text));
    if (context != null && snackBarMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(snackBarMessage)),
      );
    }
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

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
