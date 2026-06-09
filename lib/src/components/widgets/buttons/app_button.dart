import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

class AppButton extends StatefulWidget {
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
    this.animationDuration = const Duration(milliseconds: 150),
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
  final Duration animationDuration;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final bgColor = switch (widget.type) {
      AppButtonType.primary => widget.primaryColor ?? cs.primary,
      AppButtonType.secondary => widget.secondaryColor ?? cs.secondary,
      AppButtonType.error => widget.errorColor ?? cs.error,
    };

    final fgColor = widget.textColor ?? switch (widget.type) {
      AppButtonType.primary => cs.onPrimary,
      AppButtonType.secondary => cs.onSecondary,
      AppButtonType.error => cs.onError,
    };

    final scaleTween = _pressed ? 0.97 : 1.0;

    Widget button = SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.4),
          disabledForegroundColor: fgColor.withValues(alpha: 0.6),
          elevation: 0,
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: widget.textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius ?? 12)),
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
                  child: widget.child ?? Text(widget.text),
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
          color: bgColor,
          disabledColor: bgColor.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(widget.radius ?? 12),
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
                : DefaultTextStyle(
                    key: const ValueKey('content'),
                    style: widget.textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    child: widget.child ?? Text(widget.text, style: TextStyle(color: fgColor)),
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
        scale: scaleTween,
        duration: widget.animationDuration,
        curve: Curves.easeOut,
        child: button,
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
