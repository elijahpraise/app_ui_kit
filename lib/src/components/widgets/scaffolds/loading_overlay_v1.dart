import 'package:flutter/material.dart';

import '../states/loading_indicator.dart';

class LoadingOverlayV1 extends StatelessWidget {
  const LoadingOverlayV1({
    super.key,
    required this.isLoading,
    required this.child,
    this.indicator,
    this.opacity,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final Widget? indicator;
  final double? opacity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: color ?? Colors.black.withValues(alpha: opacity ?? 0.3),
              child: indicator ?? LoadingIndicator(color: theme.colorScheme.primary),
            ),
          ),
      ],
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.indicator,
    this.opacity = 0.3,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final Widget? indicator;
  final double? opacity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (!isLoading) return child;

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Container(
            color: color ?? Colors.black.withValues(alpha: opacity ?? 0.3),
            child: indicator ?? LoadingIndicator(color: theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
