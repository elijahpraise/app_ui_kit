import 'package:flutter/material.dart';

import 'validators.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.keyboardAppearance,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding,
    this.borderRadius,
    this.filled,
    this.cursorColor,
    this.cursorWidth = 2,
    this.autovalidateMode,
    this.scrollPadding,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.showCursor,
    this.undoController,
    this.contextMenuBuilder,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValidatorCallback? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final Brightness? keyboardAppearance;
  final bool obscureText;
  final String obscuringCharacter;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final bool? filled;
  final Color? cursorColor;
  final double cursorWidth;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsets? scrollPadding;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? showCursor;
  final UndoHistoryController? undoController;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;

    final effectiveBorderRadius = BorderRadius.circular(
      borderRadius ?? 6,
    );

    final effectiveBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: BorderSide(color: borderColor ?? inputTheme.enabledBorder?.borderSide.color ?? theme.dividerColor),
    );

    final effectiveFocusedBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: BorderSide(
        color: focusedBorderColor ?? inputTheme.focusedBorder?.borderSide.color ?? theme.colorScheme.primary,
        width: 2,
      ),
    );

    final effectiveErrorBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: BorderSide(color: errorBorderColor ?? inputTheme.errorBorder?.borderSide.color ?? theme.colorScheme.error),
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      keyboardAppearance: keyboardAppearance,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      autovalidateMode: autovalidateMode,
      scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      showCursor: showCursor,
      undoController: undoController,
      contextMenuBuilder: contextMenuBuilder,
      style: textStyle ?? inputTheme.labelStyle?.copyWith(color: theme.colorScheme.onSurface),
      cursorColor: cursorColor ?? theme.colorScheme.primary,
      cursorWidth: cursorWidth,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixText: suffixText,
        prefix: prefix,
        suffix: suffix,
        fillColor: fillColor ?? inputTheme.fillColor,
        filled: filled ?? inputTheme.filled,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: hintStyle ?? inputTheme.hintStyle,
        labelStyle: labelStyle ?? inputTheme.labelStyle,
        errorStyle: errorStyle ?? inputTheme.errorStyle,
        border: effectiveBorder,
        enabledBorder: effectiveBorder,
        focusedBorder: effectiveFocusedBorder,
        errorBorder: effectiveErrorBorder,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(
            color: errorBorderColor ?? inputTheme.focusedErrorBorder?.borderSide.color ?? theme.colorScheme.error,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: theme.dividerColor.withValues(alpha: 0.5)),
        ),
      ),
    );
  }
}
