import 'package:flutter/material.dart';

import '../color_values.dart';

/// Design preset that captures Airbnb's brand identity through color,
/// typography, and spacing tokens. Mirrors the visual language used across
/// Airbnb's marketplace platform.
class AirbnbPreset {
  AirbnbPreset._();

  /// Light theme colors following Airbnb's brand palette.
  ///
  /// Features the signature `Razzmatazz` red (`0xFFFF385C`) as the primary
  /// color, paired with neutral surfaces and subtle borders for a clean,
  /// trust-oriented aesthetic.
  static AppColors get light => AppColors(
        primary: const Color(0xFFFF385C),
        secondary: const Color(0xFF222222),
        error: const Color(0xFFE31C5F),
        surface: Colors.white,
        onSurface: const Color(0xFF222222),
        border: const Color(0xFFDDDDDD),
        inputLabel: const Color(0xFF717171),
        inputText: const Color(0xFF222222),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF008A05),
        toastError: const Color(0xFFE31C5F),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFDDDDDD),
        divider: const Color(0xFFDDDDDD),
        hover: const Color(0xFFF7F7F7),
        focusedBorder: const Color(0xFFFF385C),
        errorBorder: const Color(0xFFE31C5F),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFFE31C5F),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF7F7F7),
        onSurfaceDark: const Color(0xFF222222),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  /// Dark theme colors aligned with Airbnb's brand identity.
  ///
  /// Maintains the signature red primary while shifting to darker surfaces
  /// (`0xFF222222`) and lighter text (`0xFFF7F7F7`) for comfortable
  /// low-light reading.
  static AppColors get dark => AppColors(
        primary: const Color(0xFFFF385C),
        secondary: const Color(0xFFDDDDDD),
        error: const Color(0xFFFF5A5F),
        surface: const Color(0xFF222222),
        onSurface: const Color(0xFFF7F7F7),
        border: const Color(0xFF444444),
        inputLabel: const Color(0xFFA0A0A0),
        inputText: const Color(0xFFF7F7F7),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFFF5A5F),
        onToastInfo: const Color(0xFF222222),
        onToastSuccess: const Color(0xFF222222),
        onToastError: Colors.white,
        shimmer: const Color(0xFF444444),
        divider: const Color(0xFF444444),
        hover: const Color(0xFF333333),
        focusedBorder: const Color(0xFFFF385C),
        errorBorder: const Color(0xFFFF5A5F),
        onPrimary: Colors.white,
        onSecondary: const Color(0xFF222222),
        onError: Colors.white,
        primaryPressed: const Color(0xFFE31C5F),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF7F7F7),
        onSurfaceDark: const Color(0xFF222222),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF333333),
      );

  /// Custom typeface used across Airbnb's UI — a rounded, friendly
  /// geometric sans-serif.
  static String get fontFamily => 'Airbnb Cereal';

  /// Border radius for small UI elements (e.g. chips, badges).
  static int get radiusSmall => 8;

  /// Border radius for medium-sized surfaces (e.g. cards, dialogs).
  static int get radiusMedium => 12;

  /// Border radius for large containers (e.g. bottom sheets, modals).
  static int get radiusLarge => 24;
}
