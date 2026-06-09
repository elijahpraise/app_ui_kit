import 'package:flutter/material.dart';

class DividerV1 extends StatelessWidget {
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

  final Color? color;
  final double? thickness;
  final double? height;
  final double? indent;
  final double? endIndent;
  final bool vertical;
  final double? width;
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
