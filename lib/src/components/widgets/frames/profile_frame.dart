import 'package:flutter/material.dart';

/// A circular or rounded frame for displaying profile images or placeholder
/// widgets, with support for network images and animated transitions.
class ProfileFrame extends StatelessWidget {
  /// Creates a [ProfileFrame].
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

  /// Fallback widget shown when [imageUrl] is null or fails to load.
  final Widget? child;
  /// URL of the network image to display.
  final String? imageUrl;
  /// How the image should be inscribed into the frame. Defaults to [BoxFit.cover].
  final BoxFit? fit;
  /// Width and height of the frame. Defaults to 48.
  final double? size;
  /// Border radius of the frame. Defaults to half of [size] (circle).
  final double? radius;
  /// Background color shown when no image or child is provided.
  final Color? backgroundColor;
  /// Border color around the frame.
  final Color? borderColor;
  /// Width of the border. Defaults to 1.
  final double? borderWidth;
  /// Duration of the animated container transition. Defaults to 200ms.
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
