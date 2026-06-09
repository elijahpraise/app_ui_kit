import 'package:flutter/material.dart';

/// A utility class with static methods for showing dialogs, bottom sheets,
/// and custom action dialogs.
class DialogHelper {
  DialogHelper._();

  /// Shows a Material dialog with the given [builder] and optional
  /// [barrierDismissible] behavior.
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return FlutterDialogHelper.showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  /// Shows a Material modal bottom sheet with the given [builder]. By default
  /// [isScrollControlled] and [useSafeArea] are true.
  static Future<T?> showModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool useSafeArea = true,
  }) {
    return FlutterModalBottomSheet.showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      builder: builder,
    );
  }

  /// Shows a dialog with a pre-built [dialog] widget as its content.
  static Future<T?> showActionDialog<T>({
    required BuildContext context,
    required Widget dialog,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) => dialog,
    );
  }
}

/// Private wrapper to avoid naming conflict with Flutter's showDialog.
class FlutterDialogHelper {
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return _showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }
}

/// Private wrapper to avoid naming conflict with Flutter's showModalBottomSheet.
class FlutterModalBottomSheet {
  static Future<T?> showModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool useSafeArea = true,
  }) {
    return _showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      builder: builder,
    );
  }
}

// Top-level delegates to Flutter's showDialog / showModalBottomSheet.
// These live at the library level so unqualified resolution finds Flutter's
// functions rather than shadowing class methods.
Future<T?> _showDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: builder,
  );
}

Future<T?> _showModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  bool useSafeArea = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    builder: builder,
  );
}
