import 'package:flutter/material.dart';

import 'base_text_field.dart';
import 'validators.dart';

/// A labeled form field that combines a label column with a [BaseTextField].
class InputField extends StatelessWidget {
  /// Creates an [InputField].
  const InputField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.labelStyle,
    this.errorStyle,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.autovalidateMode,
    this.spacing = 8,
    this.collapsed = false,
    this.required = false,
  });

  /// The label text displayed above the field.
  final String label;
  /// The controller for the text field.
  final TextEditingController? controller;
  /// The focus node for keyboard focus management.
  final FocusNode? focusNode;
  /// A callback that validates the current field value.
  final ValidatorCallback? validator;
  /// Called when the text changes.
  final ValueChanged<String>? onChanged;
  /// Called when the user submits the field value.
  final ValueChanged<String>? onFieldSubmitted;
  /// Whether to hide the text (e.g., for passwords).
  final bool obscureText;
  /// The type of keyboard to display.
  final TextInputType? keyboardType;
  /// The type of action button to show on the keyboard.
  final TextInputAction? textInputAction;
  /// Whether the field is interactive.
  final bool enabled;
  /// Whether the field is read-only.
  final bool readOnly;
  /// The maximum number of visible lines.
  final int? maxLines;
  /// Placeholder text shown when the field is empty.
  final String? hintText;
  /// Helper text displayed below the field.
  final String? helperText;
  /// Error text displayed below the field.
  final String? errorText;
  /// An icon to show before the input.
  final Widget? prefixIcon;
  /// An icon to show after the input.
  final Widget? suffixIcon;
  /// A widget to show before the input.
  final Widget? prefix;
  /// A widget to show after the input.
  final Widget? suffix;
  /// The style for the label text.
  final TextStyle? labelStyle;
  /// The style for the error text.
  final TextStyle? errorStyle;
  /// The style for the input text.
  final TextStyle? textStyle;
  /// The style for the hint text.
  final TextStyle? hintStyle;
  /// The padding inside the input decoration.
  final EdgeInsetsGeometry? contentPadding;
  /// The border radius of the input.
  final double? borderRadius;
  /// The fill color of the input decoration.
  final Color? fillColor;
  /// The color of the enabled border.
  final Color? borderColor;
  /// The color of the focused border.
  final Color? focusedBorderColor;
  /// The color of the error border.
  final Color? errorBorderColor;
  /// When to validate the field automatically.
  final AutovalidateMode? autovalidateMode;
  /// The vertical spacing between the label and the field.
  final double spacing;
  /// Whether the column uses [MainAxisSize.min] instead of [MainAxisSize.max].
  final bool collapsed;
  /// Whether to show an asterisk next to the label indicating a required field.
  final bool required;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: collapsed ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Row(
          children: [
            Text(
              required ? '$label *' : label,
              style: labelStyle ?? theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
        SizedBox(height: spacing),
        BaseTextField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          suffix: suffix,
          textStyle: textStyle,
          hintStyle: hintStyle,
          errorStyle: errorStyle,
          contentPadding: contentPadding,
          borderRadius: borderRadius,
          fillColor: fillColor,
          borderColor: borderColor,
          focusedBorderColor: focusedBorderColor,
          errorBorderColor: errorBorderColor,
          autovalidateMode: autovalidateMode,
        ),
      ],
    );
  }
}
