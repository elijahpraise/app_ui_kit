import 'package:flutter/material.dart';

/// A tappable text widget styled as a hyperlink with an optional
/// underline decoration.
class HyperLinkText extends StatelessWidget {
  /// Creates a [HyperLinkText].
  const HyperLinkText({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.color,
    this.underline = true,
  });

  /// The text content to display as a hyperlink.
  final String text;
  /// Callback invoked when the text is tapped.
  final VoidCallback onTap;
  /// Style override for the hyperlink text.
  final TextStyle? style;
  /// Color of the hyperlink text. Defaults to the primary color.
  final Color? color;
  /// Whether to show an underline. Defaults to true.
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
