import 'package:flutter/material.dart';

import '../color_values.dart';

/// Preset color definitions for [DesignPreset.spotify].
class SpotifyPreset {
  SpotifyPreset._();

  /// Light-mode [AppColors] for this preset.
  static AppColors get light => AppColors(
        primary: const Color(0xFF1DB954),
        secondary: const Color(0xFF535353),
        error: const Color(0xFFE91429),
        surface: Colors.white,
        onSurface: const Color(0xFF191414),
        border: const Color(0xFFD9D9D9),
        inputLabel: const Color(0xFF535353),
        inputText: const Color(0xFF191414),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF1DB954),
        toastError: const Color(0xFFE91429),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE8E8E8),
        divider: const Color(0xFFD9D9D9),
        hover: const Color(0xFFF5F5F5),
        focusedBorder: const Color(0xFF1DB954),
        errorBorder: const Color(0xFFE91429),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF169C46),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF7F7F7),
        onSurfaceDark: const Color(0xFF191414),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  /// Dark-mode [AppColors] for this preset.
  static AppColors get dark => AppColors(
        primary: const Color(0xFF1DB954),
        secondary: const Color(0xFFA7A7A7),
        error: const Color(0xFFE91429),
        surface: const Color(0xFF121212),
        onSurface: const Color(0xFFFFFFFF),
        border: const Color(0xFF292929),
        inputLabel: const Color(0xFFA7A7A7),
        inputText: const Color(0xFFFFFFFF),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF1DB954),
        toastError: const Color(0xFFE91429),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFF282828),
        divider: const Color(0xFF292929),
        hover: const Color(0xFF1A1A1A),
        focusedBorder: const Color(0xFF1DB954),
        errorBorder: const Color(0xFFE91429),
        onPrimary: const Color(0xFF121212),
        onSecondary: const Color(0xFF121212),
        onError: Colors.white,
        primaryPressed: const Color(0xFF169C46),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF7F7F7),
        onSurfaceDark: const Color(0xFF191414),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF282828),
      );

  /// The custom font family for this preset (Inter).
  static String get fontFamily => 'Inter';

  /// Small border radius.
  static int get radiusSmall => 4;
  /// Medium border radius.
  static int get radiusMedium => 8;
  /// Large border radius.
  static int get radiusLarge => 16;
}
