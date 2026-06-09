import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.type = AppButtonType.primary,
    this.onTap,
    this.height,
    this.width,
    this.primaryColor,
    this.secondaryColor,
    this.errorColor,
    this.textColor,
    this.textStyle,
    this.padding,
    this.radius,
    this.loading = false,
    this.enabled = true,
    this.child,
  });

  factory AppButton.icon({
    required String text,
    required Widget icon,
    AppButtonType type = AppButtonType.primary,
    VoidCallback? onTap,
    double? height,
    double? width,
    Color? primaryColor,
    Color? secondaryColor,
    Color? errorColor,
    Color? textColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? radius,
    bool loading = false,
    bool enabled = true,
    double spacing = 8,
    IconAlignment iconAlignment = IconAlignment.start,
  }) {
    return AppButton(
      text: text,
      type: type,
      onTap: onTap,
      height: height,
      width: width,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      errorColor: errorColor,
      textColor: textColor,
      textStyle: textStyle,
      padding: padding,
      radius: radius,
      loading: loading,
      enabled: enabled,
      child: _IconButtonContent(
        icon: icon,
        text: text,
        spacing: spacing,
        iconAlignment: iconAlignment,
      ),
    );
  }

  final String text;
  final AppButtonType type;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? errorColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final bool loading;
  final bool enabled;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final bgColor = switch (type) {
      AppButtonType.primary => primaryColor ?? cs.primary,
      AppButtonType.secondary => secondaryColor ?? cs.secondary,
      AppButtonType.error => errorColor ?? cs.error,
    };

    final fgColor = textColor ?? switch (type) {
      AppButtonType.primary => cs.onPrimary,
      AppButtonType.secondary => cs.onSecondary,
      AppButtonType.error => cs.onError,
    };

    if (isCupertino) {
      return SizedBox(
        width: width,
        height: height ?? 44,
        child: cupertino.CupertinoButton(
          onPressed: enabled && !loading ? onTap : null,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          color: bgColor,
          disabledColor: bgColor.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(radius ?? 12),
          child: loading
              ? SizedBox(
                  width: 20, height: 20,
                  child: cupertino.CupertinoActivityIndicator(radius: 10, color: fgColor),
                )
              : DefaultTextStyle(
                  style: textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                  child: child ?? Text(text, style: TextStyle(color: fgColor)),
                ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: enabled && !loading ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.4),
          disabledForegroundColor: fgColor.withValues(alpha: 0.6),
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 12)),
        ),
        child: loading
            ? SizedBox(
                width: 20, height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: fgColor),
              )
            : child ?? Text(text),
      ),
    );
  }
}

class _IconButtonContent extends StatelessWidget {
  const _IconButtonContent({
    required this.icon,
    required this.text,
    required this.spacing,
    required this.iconAlignment,
  });

  final Widget icon;
  final String text;
  final double spacing;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    final isStart = iconAlignment == IconAlignment.start;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isStart) ...[icon, SizedBox(width: spacing)],
        Text(text),
        if (!isStart) ...[SizedBox(width: spacing), icon],
      ],
    );
  }
}
