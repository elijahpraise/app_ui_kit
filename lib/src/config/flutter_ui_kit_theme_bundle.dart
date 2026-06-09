import 'package:flutter/material.dart';

/// Pre-resolved application themes for MaterialApp wiring.
class FlutterUiKitThemeBundle {
  /// Creates a theme bundle with the required [lightTheme], [darkTheme], and [themeMode].
  const FlutterUiKitThemeBundle({
    required this.lightTheme,
    required this.darkTheme,
    required this.themeMode,
  });

  /// The theme applied when the device is in light mode.
  final ThemeData lightTheme;
  /// The theme applied when the device is in dark mode.
  final ThemeData darkTheme;
  /// Controls whether [lightTheme] or [darkTheme] is active.
  final ThemeMode themeMode;
}
