import 'package:flutter/material.dart';

/// A container for all predefined [TextStyle]s used throughout the app,
/// organized by semantic role (heading, body, caption, button, etc.).
class TextStyleTokens {
  /// Creates a [TextStyleTokens] with all required text styles.
  const TextStyleTokens({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.caption,
    required this.button,
    required this.overline,
    required this.label,
  });

  /// The largest heading style (32px / bold).
  final TextStyle heading1;

  /// The second-level heading style (28px / bold).
  final TextStyle heading2;

  /// The third-level heading style (24px / semi-bold).
  final TextStyle heading3;

  /// The fourth-level heading style (20px / semi-bold).
  final TextStyle heading4;

  /// A subtitle style (18px / medium).
  final TextStyle subtitle1;

  /// A secondary subtitle style (16px / medium).
  final TextStyle subtitle2;

  /// The primary body text style (16px / regular).
  final TextStyle body1;

  /// The secondary body text style (14px / regular).
  final TextStyle body2;

  /// A small caption style (12px / regular).
  final TextStyle caption;

  /// A button label style (14px / semi-bold).
  final TextStyle button;

  /// An overline / uppercase label style (10px / medium, 1.5 letter spacing).
  final TextStyle overline;

  /// A small label style (12px / medium).
  final TextStyle label;
}
