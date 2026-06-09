import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    this.size = 8,
    this.color,
    this.active = true,
  });

  final double size;
  final Color? color;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
