import 'package:flutter/material.dart';

/// A shimmer placeholder that animates a sweeping gradient across its
/// surface to indicate loading content.
class LoadingShimmer extends StatefulWidget {
  /// Creates a [LoadingShimmer].
  const LoadingShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.shape = BoxShape.rectangle,
    this.color,
    this.child,
  });

  /// Width of the shimmer placeholder.
  final double? width;
  /// Height of the shimmer placeholder. Defaults to 20.
  final double? height;
  /// Border radius for rectangular shimmer shapes.
  final double? radius;
  /// Shape of the shimmer. Defaults to [BoxShape.rectangle].
  final BoxShape shape;
  /// Base color of the shimmer gradient.
  final Color? color;
  /// An optional child to render instead of the default shimmer container.
  final Widget? child;

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) return widget.child!;

    final theme = Theme.of(context);
    final baseColor = widget.color ?? theme.dividerColor;
    final highlightColor = baseColor.withValues(alpha: 0.5);

    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                _animation.value - 1,
                _animation.value,
                _animation.value + 1,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcOver,
          child: child,
        );
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.shape == BoxShape.rectangle
              ? BorderRadius.circular(widget.radius ?? 4)
              : null,
          shape: widget.shape,
        ),
      ),
    );
  }
}
