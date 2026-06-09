import 'package:flutter/material.dart';

import 'validators.dart';

/// A customizable text form field that wraps [TextFormField] with themed decoration and validation.
class BaseTextField extends StatelessWidget {
  /// Creates a [BaseTextField].
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
  /// Called to save the current field value.
  final FormFieldSetter<String>? onSaved;
  /// Called when the text field is tapped.
  final GestureTapCallback? onTap;
  /// The type of action button to show on the keyboard.
  final TextInputAction? textInputAction;
  /// How to capitalize entered text.
  final TextCapitalization textCapitalization;
  /// The type of keyboard to display.
  final TextInputType? keyboardType;
  /// The keyboard appearance (light or dark).
  final Brightness? keyboardAppearance;
  /// Whether to hide the text (e.g., for passwords).
  final bool obscureText;
  /// The character used to obscure text.
  final String obscuringCharacter;
  /// Whether to enable autocorrect.
  final bool autocorrect;
  /// Whether to show text suggestions.
  final bool enableSuggestions;
  /// Whether the field is interactive.
  final bool enabled;
  /// Whether the field is read-only.
  final bool readOnly;
  /// Whether to focus the field on build.
  final bool autofocus;
  /// The maximum number of visible lines.
  final int? maxLines;
  /// The minimum number of visible lines.
  final int? minLines;
  /// The maximum number of characters allowed.
  final int? maxLength;
  /// Placeholder text shown when the field is empty.
  final String? hintText;
  /// The label text displayed above the field.
  final String? labelText;
  /// Helper text displayed below the field.
  final String? helperText;
  /// Error text displayed below the field.
  final String? errorText;
  /// An icon to show before the input.
  final Widget? prefixIcon;
  /// An icon to show after the input.
  final Widget? suffixIcon;
  /// Text to show before the input.
  final String? prefixText;
  /// Text to show after the input.
  final String? suffixText;
  /// A widget to show before the input.
  final Widget? prefix;
  /// A widget to show after the input.
  final Widget? suffix;
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
  /// The border radius of the input.
  final double? borderRadius;
  /// Whether the input has a filled background.
  final bool? filled;
  /// The color of the cursor.
  final Color? cursorColor;
  /// The width of the cursor in pixels.
  final double cursorWidth;
  /// When to validate the field automatically.
  final AutovalidateMode? autovalidateMode;
  /// The padding when scrolling the field into view.
  final EdgeInsets? scrollPadding;
  /// How to align the input text.
  final TextAlign textAlign;
  /// How to vertically align the input text.
  final TextAlignVertical? textAlignVertical;
  /// Whether to show the cursor.
  final bool? showCursor;
  /// The controller for undo/redo history.
  final UndoHistoryController? undoController;
  /// A builder for the context menu.
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
