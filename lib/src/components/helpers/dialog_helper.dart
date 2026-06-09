import 'package:flutter/material.dart';

class DialogHelper {
  DialogHelper._();

  static Future<T?> showDialog<T>({
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

  static Future<T?> showModalBottomSheet<T>({
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
