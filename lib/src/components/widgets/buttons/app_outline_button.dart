import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

/// A platform-adaptive outlined button that renders either a Material
/// [OutlinedButton] or a Cupertino-style outlined button based on the current
/// platform.
class AppOutlineButton extends StatefulWidget {
  /// Creates an [AppOutlineButton].
  ///
  /// The [text] parameter is required. Use [loading] to show a spinner
  /// and [borderWidth] to control the stroke thickness.
  const AppOutlineButton({
    super.key,
    /// The label text displayed on the button.
    required this.text,
    /// The visual style variant. Defaults to [AppButtonType.primary].
    this.type = AppButtonType.primary,
    /// Called when the button is pressed.
    this.onTap,
    /// The height of the button.
    this.height,
    /// The width of the button.
    this.width,
    /// Overrides the primary border/foreground color.
    this.primaryColor,
    /// Overrides the secondary border/foreground color.
    this.secondaryColor,
    /// Overrides the error border/foreground color.
    this.errorColor,
    /// Overrides the text foreground color.
    this.textColor,
    /// The text style applied to the button label.
    this.textStyle,
    /// The padding around the button content.
    this.padding,
    /// The border radius of the button.
    this.radius,
    /// The width of the border stroke. Defaults to 1.
    this.borderWidth = 1,
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
  /// The height of the button.
  final double? height;
  /// The width of the button.
  final double? width;
  /// Overrides the primary border/foreground color.
  final Color? primaryColor;
  /// Overrides the secondary border/foreground color.
  final Color? secondaryColor;
  /// Overrides the error border/foreground color.
  final Color? errorColor;
  /// Overrides the text foreground color.
  final Color? textColor;
  /// The text style applied to the button label.
  final TextStyle? textStyle;
  /// The padding around the button content.
  final EdgeInsetsGeometry? padding;
  /// The border radius of the button.
  final double? radius;
  /// The width of the border stroke.
  final double borderWidth;
  /// Whether to show a loading spinner in place of the label.
  final bool loading;
  /// Whether the button is interactive.
  final bool enabled;
  /// The duration of the press-scale animation.
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
