import 'package:flutter/material.dart';

class ProfileFrame extends StatelessWidget {
  const ProfileFrame({
    super.key,
    this.child,
    this.imageUrl,
    this.fit,
    this.size,
    this.radius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final Widget? child;
  final String? imageUrl;
  final BoxFit? fit;
  final double? size;
  final double? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? 48;
    final effectiveRadius = radius ?? effectiveSize / 2;

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeOut,
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(effectiveRadius),
        border: Border.all(
          color: borderColor ?? theme.dividerColor,
          width: borderWidth ?? 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              fit: fit ?? BoxFit.cover,
              width: effectiveSize,
              height: effectiveSize,
              errorBuilder: (_, __, ___) => child ?? Icon(Icons.person, size: effectiveSize * 0.5),
            )
          : child ?? Icon(Icons.person, size: effectiveSize * 0.5),
    );
  }
}
