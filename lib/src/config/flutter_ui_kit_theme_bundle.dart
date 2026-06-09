import 'package:flutter/material.dart';

/// Pre-resolved application themes for MaterialApp wiring.
class FlutterUiKitThemeBundle {
  const FlutterUiKitThemeBundle({
    required this.lightTheme,
    required this.darkTheme,
    required this.themeMode,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
}
