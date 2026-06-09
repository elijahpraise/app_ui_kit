import 'package:flutter/material.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.shape = BoxShape.rectangle,
    this.color,
    this.child,
  });

  final double? width;
  final double? height;
  final double? radius;
  final BoxShape shape;
  final Color? color;
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
