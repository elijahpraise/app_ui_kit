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
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final bool isLoading;
  final Widget child;
  final Widget? indicator;
  final double? opacity;
  final Color? color;
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

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.indicator,
    this.opacity = 0.3,
    this.color,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final bool isLoading;
  final Widget child;
  final Widget? indicator;
  final double? opacity;
  final Color? color;
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
