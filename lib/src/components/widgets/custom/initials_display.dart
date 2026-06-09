import 'package:flutter/material.dart';

/// A circular or rounded avatar that displays initials derived from a
/// name, with support for acronyms and animated transitions.
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
    this.animationDuration = const Duration(milliseconds: 200),
  });

  /// The full name from which initials are extracted.
  final String name;
  /// Width and height of the avatar. Defaults to 48.
  final double size;
  /// Background color of the avatar circle.
  final Color? backgroundColor;
  /// Style override for the initials text.
  final TextStyle? textStyle;
  /// Border radius of the avatar. Defaults to half of [size] (circle).
  final double? radius;
  /// Maximum number of initials to display. Defaults to 2.
  final int maxLetters;
  /// Whether to take the first letter of every word as initials.
  final bool useAcronyms;
  /// Duration of the animated container transition. Defaults to 200ms.
  final Duration animationDuration;

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

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeOut,
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
