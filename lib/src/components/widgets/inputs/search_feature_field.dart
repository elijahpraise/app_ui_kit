import 'package:flutter/material.dart';

class SearchFeatureField extends StatelessWidget {
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

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final String? hintText;
  final bool enabled;
  final bool autofocus;
  final double? borderRadius;
  final Color? fillColor;
  final TextStyle? textStyle;
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
