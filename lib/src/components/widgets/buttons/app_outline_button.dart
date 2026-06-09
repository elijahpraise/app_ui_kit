import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

class AppOutlineButton extends StatefulWidget {
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
  final double? radius;
  final double borderWidth;
  final bool loading;
  final bool enabled;
  final Duration animationDuration;

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
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

    final effectiveRadius = widget.radius ?? 12;

    Widget button = SizedBox(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton(
        onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: fgColor,
          disabledForegroundColor: fgColor.withValues(alpha: 0.4),
          side: BorderSide(color: fgColor, width: widget.borderWidth),
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: widget.textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(effectiveRadius)),
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
      button = SizedBox(
        width: widget.width,
        height: widget.height ?? 44,
        child: cupertino.CupertinoButton(
          onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          color: Colors.transparent,
          disabledColor: Colors.transparent,
          borderRadius: BorderRadius.circular(effectiveRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(effectiveRadius),
              border: Border.all(color: fgColor, width: widget.borderWidth),
            ),
            alignment: Alignment.center,
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
          ),
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
