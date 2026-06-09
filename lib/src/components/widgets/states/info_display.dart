import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

  final String? title;
  final String? subtitle;
  final String? iconData;
  final Widget? icon;
  final String? lottie;
  final Widget? subtitleAlt;
  final double iconSize;
  final double lottieSize;
  final Color? iconColor;
  final double? spacing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
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
