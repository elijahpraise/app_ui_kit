import 'package:flutter/material.dart';

/// A customizable divider that supports horizontal and vertical
/// orientations with rounded corners.
class DividerV1 extends StatelessWidget {
  /// Creates a [DividerV1].
  const DividerV1({
    super.key,
    this.color,
    this.thickness,
    this.height,
    this.indent,
    this.endIndent,
    this.vertical = false,
    this.width,
    this.borderRadius,
  });

  /// Color of the divider line.
  final Color? color;
  /// Thickness of the divider. Defaults to 1.
  final double? thickness;
  /// Height (horizontal) or length (vertical) of the divider.
  final double? height;
  /// Leading space before the divider.
  final double? indent;
  /// Trailing space after the divider.
  final double? endIndent;
  /// Whether to render a vertical divider instead of horizontal.
  final bool vertical;
  /// Width of a vertical divider. Defaults to [thickness].
  final double? width;
  /// Border radius for vertical divider rounded ends.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = color ?? theme.dividerColor;
    final dividerThickness = thickness ?? 1;

    if (vertical) {
      return Container(
        width: width ?? dividerThickness,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          color: dividerColor,
          borderRadius: borderRadius,
        ),
      );
    }

    return Divider(
      color: dividerColor,
      thickness: dividerThickness,
      height: height ?? dividerThickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
