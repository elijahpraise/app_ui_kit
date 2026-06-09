import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'base_text_field.dart';
import 'validators.dart';

/// A password input field with a built-in visibility toggle button.
class PasswordField extends HookWidget {
  /// Creates a [PasswordField].
  const PasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.hintText = 'Enter password',
    this.labelText = 'Password',
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.autovalidateMode,
    this.prefixIcon,
  });

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
  /// Whether the field is interactive.
  final bool enabled;
  /// Placeholder text shown when the field is empty.
  final String? hintText;
  /// The label text displayed above the field.
  final String? labelText;
  /// The style for the input text.
  final TextStyle? textStyle;
  /// The style for the hint text.
  final TextStyle? hintStyle;
  /// The style for the label text.
  final TextStyle? labelStyle;
  /// The style for the error text.
  final TextStyle? errorStyle;
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
  /// An icon to show before the input.
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final obscure = useState(true);

    return BaseTextField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      obscureText: obscure.value,
      hintText: hintText,
      labelText: labelText,
      textStyle: textStyle,
      hintStyle: hintStyle,
      labelStyle: labelStyle,
      errorStyle: errorStyle,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      fillColor: fillColor,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      autovalidateMode: autovalidateMode,
      prefixIcon: prefixIcon,
      suffixIcon: IconButton(
        icon: Icon(obscure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined),
        onPressed: () => obscure.value = !obscure.value,
      ),
    );
  }
}
