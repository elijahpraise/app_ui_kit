import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A centered information display with an icon, Lottie animation, title,
/// and subtitle, commonly used for empty states or messages.
class InfoDisplay extends StatelessWidget {
  const InfoDisplay({
    super.key,
    this.title,
    this.subtitle,
    this.iconData,
    this.icon,
    this.lottie,
    this.subtitleAlt,
    this.iconSize = 32,
    this.lottieSize = 280,
    this.iconColor,
    this.spacing,
    this.titleStyle,
    this.subtitleStyle,
    this.padding,
  });

  /// The primary text displayed below the icon.
  final String? title;
  /// The secondary text displayed below the title.
  final String? subtitle;
  /// Code point string for a MaterialIcon to display.
  final String? iconData;
  /// A custom widget to use as the icon area.
  final Widget? icon;
  /// Asset path to a Lottie animation to display.
  final String? lottie;
  /// An alternative widget shown in place of the subtitle text.
  final Widget? subtitleAlt;
  /// Size of the icon when using [iconData]. Defaults to 32.
  final double iconSize;
  /// Width and height of the Lottie animation. Defaults to 280.
  final double lottieSize;
  /// Color applied to the icon.
  final Color? iconColor;
  /// Spacing between elements. Defaults to 16.
  final double? spacing;
  /// Style override for the title text.
  final TextStyle? titleStyle;
  /// Style override for the subtitle text.
  final TextStyle? subtitleStyle;
  /// Padding around the entire content. Defaults to 24 on all sides.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveSpacing = spacing ?? 16;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Center(
        child: Padding(
          padding: padding ?? const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (lottie != null)
                Lottie.asset(
                  lottie!,
                  width: lottieSize,
                  height: lottieSize,
                )
              else if (icon != null)
                icon!
              else if (iconData != null)
                Icon(
                  IconData(
                    int.parse(iconData!),
                    fontFamily: 'MaterialIcons',
                  ),
                  size: iconSize,
                  color: iconColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              if (title != null) ...[
                SizedBox(height: effectiveSpacing),
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: titleStyle ?? theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
              if (subtitleAlt != null) ...[
                SizedBox(height: effectiveSpacing / 2),
                subtitleAlt!,
              ] else if (subtitle != null) ...[
                SizedBox(height: effectiveSpacing / 2),
                Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: subtitleStyle ?? theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
