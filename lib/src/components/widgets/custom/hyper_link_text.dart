import 'package:flutter/material.dart';

class HyperLinkText extends StatelessWidget {
  const HyperLinkText({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.color,
    this.underline = true,
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle? style;
  final Color? color;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: (style ?? theme.textTheme.bodyMedium)?.copyWith(
          color: color ?? theme.colorScheme.primary,
          decoration: underline ? TextDecoration.underline : null,
          decorationColor: color ?? theme.colorScheme.primary,
        ),
      ),
    );
  }
}
