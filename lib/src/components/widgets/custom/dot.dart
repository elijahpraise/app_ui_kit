import 'package:flutter/material.dart';

/// A small circular dot indicator that animates between active and
/// inactive states with color changes.
class Dot extends StatelessWidget {
  const Dot({
    super.key,
    this.size = 8,
    this.color,
    this.active = true,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  /// Diameter of the dot. Defaults to 8.
  final double size;
  /// Color when [active] is true. Defaults to the primary color.
  final Color? color;
  /// Whether the dot is in the active (filled) state.
  final bool active;
  /// Duration of the animated transition. Defaults to 200ms.
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeOut,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: active
            ? (color ?? theme.colorScheme.primary)
            : theme.colorScheme.onSurface.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
    );
  }
}
