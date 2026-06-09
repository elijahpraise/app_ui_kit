import 'package:flutter/material.dart';

class ListFrame extends StatelessWidget {
  const ListFrame({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.elevation,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final double? elevation;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeOut,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(radius ?? 12),
        border: Border.all(color: borderColor ?? theme.dividerColor),
        boxShadow: elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05 * elevation!),
                  blurRadius: elevation! * 2,
                  offset: Offset(0, elevation!),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
