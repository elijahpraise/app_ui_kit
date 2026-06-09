import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'validators.dart';

/// An international phone number input field with country code selection.
class PhoneField extends StatelessWidget {
  /// Creates a [PhoneField].
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

  /// The controller for the phone text field.
  final TextEditingController? controller;
  /// Called when the selected phone number changes.
  final ValueChanged<PhoneNumber>? onChanged;
  /// A callback that validates the current field value.
  final ValidatorCallback? validator;
  /// Whether the field is interactive.
  final bool enabled;
  /// Placeholder text shown when the field is empty.
  final String? hintText;
  /// The label text displayed above the field.
  final String? labelText;
  /// The default country code (e.g., 'US').
  final String initialCountryCode;
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
  /// When to validate the field automatically.
  final AutovalidateMode? autovalidateMode;
  /// The style for the country code dropdown text.
  final TextStyle? dropdownTextStyle;
  /// The icon for the country code dropdown.
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
