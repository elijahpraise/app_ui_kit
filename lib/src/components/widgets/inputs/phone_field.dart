import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'validators.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.hintText = 'Phone number',
    this.labelText,
    this.initialCountryCode = 'US',
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding,
    this.autovalidateMode,
    this.dropdownTextStyle,
    this.dropdownIcon,
  });

  final TextEditingController? controller;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValidatorCallback? validator;
  final bool enabled;
  final String? hintText;
  final String? labelText;
  final String initialCountryCode;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? dropdownTextStyle;
  final Icon? dropdownIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final radius = borderRadius ?? 6;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor ?? inputTheme.enabledBorder?.borderSide.color ?? theme.dividerColor),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: focusedBorderColor ?? inputTheme.focusedBorder?.borderSide.color ?? theme.colorScheme.primary, width: 2),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: errorBorderColor ?? inputTheme.errorBorder?.borderSide.color ?? theme.colorScheme.error),
    );

    return IntlPhoneField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      initialCountryCode: initialCountryCode,
      style: textStyle ?? inputTheme.labelStyle?.copyWith(color: theme.colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        filled: inputTheme.filled,
        fillColor: fillColor ?? inputTheme.fillColor,
        hintStyle: hintStyle ?? inputTheme.hintStyle,
        labelStyle: labelStyle ?? inputTheme.labelStyle,
        errorStyle: errorStyle ?? inputTheme.errorStyle,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: border,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedBorder.copyWith(
          borderSide: BorderSide(color: errorBorderColor ?? inputTheme.focusedErrorBorder?.borderSide.color ?? theme.colorScheme.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: theme.dividerColor.withValues(alpha: 0.5)),
        ),
      ),
      dropdownTextStyle: dropdownTextStyle ?? TextStyle(color: theme.colorScheme.onSurface),
      dropdownIcon: dropdownIcon ?? Icon(Icons.arrow_drop_down, color: theme.colorScheme.onSurface),
    );
  }
}
