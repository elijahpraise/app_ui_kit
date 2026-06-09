import 'package:flutter/material.dart';

import 'base_text_field.dart';
import 'validators.dart';

class InputField extends StatelessWidget {
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

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValidatorCallback? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final AutovalidateMode? autovalidateMode;
  final double spacing;
  final bool collapsed;
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
