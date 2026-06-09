import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
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
    this.borderWidth = 1,
    this.loading = false,
    this.enabled = true,
  });

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
  final double borderWidth;
  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final fgColor = textColor ?? switch (type) {
      AppButtonType.primary => primaryColor ?? cs.primary,
      AppButtonType.secondary => secondaryColor ?? cs.secondary,
      AppButtonType.error => errorColor ?? cs.error,
    };

    final effectiveRadius = radius ?? 12;

    if (isCupertino) {
      return SizedBox(
        width: width,
        height: height ?? 44,
        child: cupertino.CupertinoButton(
          onPressed: enabled && !loading ? onTap : null,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          color: Colors.transparent,
          disabledColor: Colors.transparent,
          borderRadius: BorderRadius.circular(effectiveRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(effectiveRadius),
              border: Border.all(color: fgColor, width: borderWidth),
            ),
            alignment: Alignment.center,
            child: loading
                ? SizedBox(
                    width: 20, height: 20,
                    child: cupertino.CupertinoActivityIndicator(radius: 10, color: fgColor),
                  )
                : Text(text, style: textStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: fgColor)),
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: enabled && !loading ? onTap : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: fgColor,
          disabledForegroundColor: fgColor.withValues(alpha: 0.4),
          side: BorderSide(color: fgColor, width: borderWidth),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(effectiveRadius)),
        ),
        child: loading
            ? SizedBox(
                width: 20, height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: fgColor),
              )
            : Text(text),
      ),
    );
  }
}
