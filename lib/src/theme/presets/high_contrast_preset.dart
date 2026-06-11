import 'package:flutter/material.dart';

import '../color_values.dart';

/// Preset color definitions for [DesignPreset.highContrast].
class HighContrastPreset {
  HighContrastPreset._();

  /// Light-mode [AppColors] for this preset.
  static AppColors get light => AppColors(
        primary: const Color(0xFF000000),
        secondary: const Color(0xFF525252),
        error: const Color(0xFFDC2626),
        surface: Colors.white,
        onSurface: const Color(0xFF000000),
        border: const Color(0xFF000000),
        inputLabel: const Color(0xFF404040),
        inputText: const Color(0xFF000000),
        toastInfo: const Color(0xFF2563EB),
        toastSuccess: const Color(0xFF16A34A),
        toastError: const Color(0xFFDC2626),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE5E5E5),
        divider: const Color(0xFF000000),
        hover: const Color(0xFFF0F0F0),
        focusedBorder: const Color(0xFF000000),
        errorBorder: const Color(0xFFDC2626),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF333333),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF000000),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  /// Dark-mode [AppColors] for this preset.
  static AppColors get dark => AppColors(
        primary: Colors.white,
        secondary: const Color(0xFFD4D4D4),
        error: const Color(0xFFFCA5A5),
        surface: const Color(0xFF000000),
        onSurface: Colors.white,
        border: Colors.white,
        inputLabel: const Color(0xFFD4D4D4),
        inputText: Colors.white,
        toastInfo: const Color(0xFF93C5FD),
        toastSuccess: const Color(0xFF86EFAC),
        toastError: const Color(0xFFFCA5A5),
        onToastInfo: Colors.black,
        onToastSuccess: Colors.black,
        onToastError: Colors.black,
        shimmer: const Color(0xFF262626),
        divider: Colors.white,
        hover: const Color(0xFF141414),
        focusedBorder: Colors.white,
        errorBorder: const Color(0xFFFCA5A5),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onError: Colors.black,
        primaryPressed: const Color(0xFFE5E5E5),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF000000),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF1A1A1A),
      );

  /// The custom font family for this preset (Inter).
  static String get fontFamily => 'Inter';

  /// Small border radius.
  static int get radiusSmall => 2;
  /// Medium border radius.
  static int get radiusMedium => 4;
  /// Large border radius.
  static int get radiusLarge => 8;
}
