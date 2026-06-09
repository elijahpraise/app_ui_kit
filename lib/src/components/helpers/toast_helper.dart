import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../widgets/dialog/toast_v1.dart';

class ToastHelper {
  ToastHelper._();

  static void show({
    required BuildContext context,
    required String message,
    ToastType type = ToastType.info,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    showToastWidget(
      ToastV1(
        message: message,
        type: type,
        title: title,
      ),
      context: context,
      duration: duration,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 300),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    show(context: context, message: message, type: ToastType.success);
  }

  static void showError(BuildContext context, String message) {
    show(context: context, message: message, type: ToastType.error);
  }

  static void showInfo(BuildContext context, String message) {
    show(context: context, message: message, type: ToastType.info);
  }
}
