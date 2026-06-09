import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

class AppTextButton extends StatefulWidget {
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
    this.animationDuration = const Duration(milliseconds: 150),
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
  final Duration animationDuration;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final fgColor = widget.textColor ?? switch (widget.type) {
      AppButtonType.primary => widget.primaryColor ?? cs.primary,
      AppButtonType.secondary => widget.secondaryColor ?? cs.secondary,
      AppButtonType.error => widget.errorColor ?? cs.error,
    };

    Widget button = SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
        style: TextButton.styleFrom(
          foregroundColor: fgColor,
          disabledForegroundColor: fgColor.withValues(alpha: 0.4),
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: widget.textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        child: AnimatedSwitcher(
          duration: widget.animationDuration,
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: widget.loading
              ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: fgColor),
                )
              : SizedBox(
                  key: const ValueKey('content'),
                  child: Text(widget.text),
                ),
        ),
      ),
    );

    if (isCupertino) {
      button = cupertino.CupertinoButton(
        onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.transparent,
        disabledColor: Colors.transparent,
        child: AnimatedSwitcher(
          duration: widget.animationDuration,
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: widget.loading
              ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 20, height: 20,
                  child: cupertino.CupertinoActivityIndicator(radius: 10, color: fgColor),
                )
              : Text(widget.text, key: const ValueKey('content'), style: widget.textStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: fgColor)),
        ),
      );
    }

    return Listener(
      onPointerDown: (_) => setState(() => _pressed = true),
      onPointerUp: (_) => setState(() => _pressed = false),
      onPointerCancel: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: widget.animationDuration,
        curve: Curves.easeOut,
        child: button,
      ),
    );
  }
}
