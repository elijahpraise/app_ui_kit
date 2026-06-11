import 'package:flutter/material.dart';

/// A frame that wraps an icon with a styled container, providing size,
/// padding, color, background, and animated transitions.
class IconFrame extends StatelessWidget {
  /// Creates an [IconFrame].
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

  /// The icon widget to display inside the frame.
  final Widget icon;
  /// The total size (width and height) of the frame. Defaults to 40.
  final double? size;
  /// Padding around the icon within the frame.
  final EdgeInsetsGeometry? padding;
  /// The color applied to the icon via [IconTheme].
  final Color? color;
  /// The background color of the frame container.
  final Color? backgroundColor;
  /// The border radius of the frame. Defaults to 8.
  final double? radius;
  /// Alignment of the icon within the frame. Defaults to center.
  final Alignment? alignment;
  /// Duration of the animated container transition. Defaults to 200ms.
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
