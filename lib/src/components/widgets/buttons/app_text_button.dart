import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

/// A platform-adaptive text-only button that renders either a Material
/// [TextButton] or a Cupertino [CupertinoButton] with transparent background
/// based on the current platform.
class AppTextButton extends StatefulWidget {
  /// Creates an [AppTextButton].
  ///
  /// The [text] parameter is required. Use [loading] to show a spinner
  /// and [enabled] to control interactivity.
  const AppTextButton({
    super.key,

    /// The label text displayed on the button.
    required this.text,

    /// The visual style variant. Defaults to [AppButtonType.primary].
    this.type = AppButtonType.primary,

    /// Called when the button is pressed.
    this.onTap,

    /// Overrides the primary foreground color.
    this.primaryColor,

    /// Overrides the secondary foreground color.
    this.secondaryColor,

    /// Overrides the error foreground color.
    this.errorColor,

    /// Overrides the text foreground color.
    this.textColor,

    /// The text style applied to the button label.
    this.textStyle,

    /// The padding around the button content.
    this.padding,

    /// Whether to show a loading spinner. Defaults to false.
    this.loading = false,

    /// Whether the button is interactive. Defaults to true.
    this.enabled = true,

    /// The duration of the press-scale animation. Defaults to 150ms.
    this.animationDuration = const Duration(milliseconds: 150),
  });

  /// The label text displayed on the button.
  final String text;

  /// The visual style variant.
  final AppButtonType type;

  /// Called when the button is pressed.
  final VoidCallback? onTap;

  /// Overrides the primary foreground color.
  final Color? primaryColor;

  /// Overrides the secondary foreground color.
  final Color? secondaryColor;

  /// Overrides the error foreground color.
  final Color? errorColor;

  /// Overrides the text foreground color.
  final Color? textColor;

  /// The text style applied to the button label.
  final TextStyle? textStyle;

  /// The padding around the button content.
  final EdgeInsetsGeometry? padding;

  /// Whether to show a loading spinner in place of the label.
  final bool loading;

  /// Whether the button is interactive.
  final bool enabled;

  /// The duration of the press-scale animation.
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

    final fgColor =
        widget.textColor ??
        switch (widget.type) {
          AppButtonType.primary => widget.primaryColor ?? cs.primary,
          AppButtonType.secondary => widget.secondaryColor ?? cs.secondary,
          AppButtonType.error => widget.errorColor ?? cs.error,
        };

    Widget button = TextButton(
      onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
      style: TextButton.styleFrom(
        foregroundColor: fgColor,
        minimumSize: Size.fromHeight(52),
        disabledForegroundColor: fgColor.withValues(alpha: 0.4),
        padding:
            widget.padding ??
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle:
            widget.textStyle ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      child: AnimatedSwitcher(
        duration: widget.animationDuration,
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child:
            widget.loading
                ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: fgColor,
                  ),
                )
                : SizedBox(
                  key: const ValueKey('content'),
                  child: Text(widget.text),
                ),
      ),
    );

    if (isCupertino) {
      button = cupertino.CupertinoButton(
        onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
        padding:
            widget.padding ??
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        color: Colors.transparent,
        disabledColor: Colors.transparent,
        child: AnimatedSwitcher(
          duration: widget.animationDuration,
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child:
              widget.loading
                  ? SizedBox(
                    key: const ValueKey('loading'),
                    width: 20,
                    height: 20,
                    child: cupertino.CupertinoActivityIndicator(
                      radius: 10,
                      color: fgColor,
                    ),
                  )
                  : Text(
                    widget.text,
                    key: const ValueKey('content'),
                    style:
                        widget.textStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: fgColor,
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
