import 'package:flutter/material.dart';

import '../states/loading_indicator.dart';

/// An animated overlay that covers [child] with a semi-transparent layer and
/// loading indicator when [isLoading] is true.
class LoadingOverlayV1 extends StatelessWidget {
  /// Creates a [LoadingOverlayV1].
  const LoadingOverlayV1({
    super.key,
    required this.isLoading,
    required this.child,
    this.indicator,
    this.opacity,
    this.color,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  /// Whether the loading overlay should be visible.
  final bool isLoading;

  /// The widget to display beneath the overlay.
  final Widget child;

  /// A custom loading indicator. Defaults to [LoadingIndicator].
  final Widget? indicator;

  /// The opacity of the overlay color (0.0 – 1.0). Defaults to 0.3.
  final double? opacity;

  /// The overlay color. Defaults to black.
  final Color? color;

  /// The duration of the fade-in / fade-out animation. Defaults to 200ms.
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: isLoading ? 1.0 : 0.0,
            duration: animationDuration,
            curve: Curves.easeOut,
            child: IgnorePointer(
              ignoring: !isLoading,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.easeOut,
                color: color ?? Colors.black.withValues(alpha: opacity ?? 0.3),
                child: isLoading
                    ? (indicator ?? LoadingIndicator(color: theme.colorScheme.primary))
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


