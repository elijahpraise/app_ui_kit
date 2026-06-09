import 'package:flutter/material.dart';

class IconFrame extends StatelessWidget {
  const IconFrame({
    super.key,
    required this.icon,
    this.size,
    this.padding,
    this.color,
    this.backgroundColor,
    this.radius,
    this.alignment,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final Widget icon;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? backgroundColor;
  final double? radius;
  final Alignment? alignment;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? 40;
    final effectiveRadius = radius ?? 8;

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeOut,
      width: effectiveSize,
      height: effectiveSize,
      alignment: alignment ?? Alignment.center,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(effectiveRadius),
        border: Border.all(color: theme.dividerColor),
      ),
      child: IconTheme.merge(
        data: IconThemeData(
          color: color ?? theme.colorScheme.onSurface,
          size: effectiveSize * 0.5,
        ),
        child: icon,
      ),
    );
  }
}
