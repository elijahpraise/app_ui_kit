import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';
import 'app_button_type.dart';

/// A platform-adaptive filled button that renders either a Material
/// [ElevatedButton] or a Cupertino [CupertinoButton] based on the current
/// platform.
class AppButton extends StatefulWidget {
  /// Creates an [AppButton].
  ///
  /// The [text] parameter is required and displayed as the button label.
  /// Use [loading] to show a spinner and [enabled] to control interactivity.
  const AppButton({
    super.key,

    /// The label text displayed on the button.
    required this.text,

    /// The visual style variant. Defaults to [AppButtonType.primary].
    this.type = AppButtonType.primary,

    /// Called when the button is pressed.
    this.onTap,

    /// Overrides the primary background color.
    this.primaryColor,

    /// Overrides the secondary background color.
    this.secondaryColor,

    /// Overrides the error background color.
    this.errorColor,

    /// Overrides the text and icon foreground color.
    this.textColor,

    /// The text style applied to the button label.
    this.textStyle,

    /// The padding around the button content.
    this.padding,

    /// The border radius of the button.
    this.radius,

    /// Whether to show a loading spinner in place of the label. Defaults to false.
    this.loading = false,

    /// Whether the button is interactive. Defaults to true.
    this.enabled = true,

    /// An optional child widget that replaces the default text label.
    this.child,

    /// The duration of the press-scale animation. Defaults to 150ms.
    this.animationDuration = const Duration(milliseconds: 150),
  });

  /// Creates an [AppButton] with an icon and optional [spacing] and
  /// [iconAlignment].
  factory AppButton.icon({
    /// The label text displayed next to the icon.
    required String text,

    /// The icon widget displayed alongside the text.
    required Widget icon,

    /// The visual style variant. Defaults to [AppButtonType.primary].
    AppButtonType type = AppButtonType.primary,

    /// Called when the button is pressed.
    VoidCallback? onTap,

    /// The height of the button.
    double? height,

    /// The width of the button.
    double? width,

    /// Overrides the primary background color.
    Color? primaryColor,

    /// Overrides the secondary background color.
    Color? secondaryColor,

    /// Overrides the error background color.
    Color? errorColor,

    /// Overrides the text and icon foreground color.
    Color? textColor,

    /// The text style applied to the button label.
    TextStyle? textStyle,

    /// The padding around the button content.
    EdgeInsetsGeometry? padding,

    /// The border radius of the button.
    double? radius,

    /// Whether to show a loading spinner. Defaults to false.
    bool loading = false,

    /// Whether the button is interactive. Defaults to true.
    bool enabled = true,

    /// The spacing between the icon and the text. Defaults to 8.
    double spacing = 8,

    /// Whether the icon appears at the start or end of the label.
    /// Defaults to [IconAlignment.start].
    IconAlignment iconAlignment = IconAlignment.start,
  }) {
    return AppButton(
      text: text,
      type: type,
      onTap: onTap,
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

  /// The label text displayed on the button.
  final String text;

  /// The visual style variant ([primary], [secondary], or [error]).
  final AppButtonType type;

  /// Called when the button is pressed.
  final VoidCallback? onTap;

  /// Overrides the primary background color.
  final Color? primaryColor;

  /// Overrides the secondary background color.
  final Color? secondaryColor;

  /// Overrides the error background color.
  final Color? errorColor;

  /// Overrides the text and icon foreground color.
  final Color? textColor;

  /// The text style applied to the button label.
  final TextStyle? textStyle;

  /// The padding around the button content.
  final EdgeInsetsGeometry? padding;

  /// The border radius of the button.
  final double? radius;

  /// Whether to show a loading spinner in place of the label.
  final bool loading;

  /// Whether the button is interactive.
  final bool enabled;

  /// An optional child widget that replaces the default text label.
  final Widget? child;

  /// The duration of the press-scale animation.
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

    final fgColor =
        widget.textColor ??
        switch (widget.type) {
          AppButtonType.primary => cs.onPrimary,
          AppButtonType.secondary => cs.onSecondary,
          AppButtonType.error => cs.onError,
        };

    final scaleTween = _pressed ? 0.97 : 1.0;

    Widget button = ElevatedButton(
      onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        disabledBackgroundColor: bgColor.withValues(alpha: 0.4),
        disabledForegroundColor: fgColor.withValues(alpha: 0.6),
        elevation: 0,
        minimumSize: Size.fromHeight(62),
        padding:
            widget.padding ??
            const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        textStyle:
            widget.textStyle ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 12),
        ),
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
                  child: widget.child ?? Text(widget.text),
                ),
      ),
    );

    if (isCupertino) {
      button = cupertino.CupertinoButton(
        onPressed: widget.enabled && !widget.loading ? widget.onTap : null,
        padding:
            widget.padding ??
            const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        color: bgColor,
        disabledColor: bgColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(widget.radius ?? 12),
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
                  : DefaultTextStyle(
                    key: const ValueKey('content'),
                    style:
                        widget.textStyle ??
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                    child:
                        widget.child ??
                        Text(widget.text, style: TextStyle(color: fgColor)),
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
