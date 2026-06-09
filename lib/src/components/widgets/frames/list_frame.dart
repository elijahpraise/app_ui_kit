import 'package:flutter/material.dart';

/// A styled container frame for list items with configurable padding,
/// margin, background, border, elevation, and animated transitions.
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

  /// The widget to display inside the frame.
  final Widget child;
  /// Inner padding around [child]. Defaults to 16 on all sides.
  final EdgeInsetsGeometry? padding;
  /// Outer margin around the frame.
  final EdgeInsetsGeometry? margin;
  /// Background color of the frame.
  final Color? backgroundColor;
  /// Border radius of the frame. Defaults to 12.
  final double? radius;
  /// Border color of the frame.
  final Color? borderColor;
  /// Elevation for the drop shadow. No shadow when null or zero.
  final double? elevation;
  /// Duration of the animated container transition. Defaults to 200ms.
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
