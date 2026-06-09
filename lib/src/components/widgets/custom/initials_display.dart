import 'package:flutter/material.dart';

class InitialsDisplay extends StatelessWidget {
  const InitialsDisplay({
    super.key,
    required this.name,
    this.size = 48,
    this.backgroundColor,
    this.textStyle,
    this.radius,
    this.maxLetters = 2,
    this.useAcronyms = false,
  });

  final String name;
  final double size;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? radius;
  final int maxLetters;
  final bool useAcronyms;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (useAcronyms) {
      return parts.map((p) => p.isNotEmpty ? p[0] : '').join().toUpperCase();
    }

    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    if (parts.isNotEmpty && parts.first.isNotEmpty) {
      return parts.first[0].toUpperCase();
    }
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveRadius = radius ?? size / 2;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(effectiveRadius),
      ),
      alignment: Alignment.center,
      child: Text(
        _initials.substring(0, maxLetters.clamp(1, _initials.length)),
        style: textStyle ?? theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
