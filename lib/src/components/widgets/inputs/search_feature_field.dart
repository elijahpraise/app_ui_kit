import 'package:flutter/material.dart';

/// A search input field styled for feature discovery with a search icon prefix.
class SearchFeatureField extends StatelessWidget {
  /// Creates a [SearchFeatureField].
  const SearchFeatureField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.hintText = 'Search',
    this.enabled = true,
    this.autofocus = false,
    this.borderRadius,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
  });

  /// The controller for the search text field.
  final TextEditingController? controller;
  /// Called when the search text changes.
  final ValueChanged<String>? onChanged;
  /// Called when the user submits the search query.
  final ValueChanged<String>? onSubmitted;
  /// The focus node for keyboard focus management.
  final FocusNode? focusNode;
  /// Placeholder text shown when the field is empty.
  final String? hintText;
  /// Whether the field is interactive.
  final bool enabled;
  /// Whether to focus the field on build.
  final bool autofocus;
  /// The border radius of the input.
  final double? borderRadius;
  /// The fill color of the input decoration.
  final Color? fillColor;
  /// The style for the input text.
  final TextStyle? textStyle;
  /// The style for the hint text.
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final radius = borderRadius ?? 8;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: enabled,
      autofocus: autofocus,
      style: textStyle ?? theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? inputTheme.hintStyle,
        filled: true,
        fillColor: fillColor ?? inputTheme.fillColor ?? theme.colorScheme.surface,
        prefixIcon: Icon(Icons.search, color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
