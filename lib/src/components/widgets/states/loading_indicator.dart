import 'package:flutter/material.dart';

/// A centered circular progress indicator with customizable color, size,
/// and stroke width.
class LoadingIndicator extends StatelessWidget {
  /// Creates a [LoadingIndicator].
  const LoadingIndicator({
    super.key,
    this.color,
    this.size,
    this.strokeWidth,
  });

  /// Color of the circular progress indicator.
  final Color? color;
  /// Width and height of the indicator. Defaults to 24.
  final double? size;
  /// Thickness of the circular stroke. Defaults to 3.
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: size ?? 24,
        height: size ?? 24,
        child: CircularProgressIndicator(
          color: color ?? theme.colorScheme.primary,
          strokeWidth: strokeWidth ?? 3,
        ),
      ),
    );
  }
}
