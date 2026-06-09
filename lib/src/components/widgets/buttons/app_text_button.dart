import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
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

    if (isCupertino) {
      return cupertino.CupertinoButton(
        onPressed: enabled && !loading ? onTap : null,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.transparent,
        disabledColor: Colors.transparent,
        child: loading
            ? SizedBox(
                width: 20, height: 20,
                child: cupertino.CupertinoActivityIndicator(radius: 10, color: fgColor),
              )
            : Text(text, style: textStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: fgColor)),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: enabled && !loading ? onTap : null,
        style: TextButton.styleFrom(
          foregroundColor: fgColor,
          disabledForegroundColor: fgColor.withValues(alpha: 0.4),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
