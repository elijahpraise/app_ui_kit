import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'base_text_field.dart';
import 'validators.dart';

class PasswordField extends HookWidget {
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

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValidatorCallback? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool enabled;
  final String? hintText;
  final String? labelText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final AutovalidateMode? autovalidateMode;
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
