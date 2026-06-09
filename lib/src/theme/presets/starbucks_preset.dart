import 'package:flutter/material.dart';

import '../color_values.dart';

class StarbucksPreset {
  StarbucksPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF006241),
        secondary: const Color(0xFF8B8B7F),
        error: const Color(0xFFC41E3A),
        surface: const Color(0xFFF2F0EB),
        onSurface: const Color(0xFF2C2B26),
        border: const Color(0xFFD8D5CE),
        inputLabel: const Color(0xFF6B685E),
        inputText: const Color(0xFF2C2B26),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF006241),
        toastError: const Color(0xFFC41E3A),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE3E0D9),
        divider: const Color(0xFFD8D5CE),
        hover: const Color(0xFFE8E5DE),
        focusedBorder: const Color(0xFF006241),
        errorBorder: const Color(0xFFC41E3A),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF00482F),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF7F6F2),
        onSurfaceDark: const Color(0xFF2C2B26),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFF1E3932),
        secondary: const Color(0xFFB0AFA3),
        error: const Color(0xFFE5484D),
        surface: const Color(0xFF1E3932),
        onSurface: const Color(0xFFF2F0EB),
        border: const Color(0xFF2D4A42),
        inputLabel: const Color(0xFFB0AFA3),
        inputText: const Color(0xFFF2F0EB),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF1E3932),
        toastError: const Color(0xFFE5484D),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFF2D4A42),
        divider: const Color(0xFF2D4A42),
        hover: const Color(0xFF152B25),
        focusedBorder: const Color(0xFF1E3932),
        errorBorder: const Color(0xFFE5484D),
        onPrimary: const Color(0xFFF2F0EB),
        onSecondary: const Color(0xFF1E3932),
        onError: Colors.white,
        primaryPressed: const Color(0xFF152B25),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF7F6F2),
        onSurfaceDark: const Color(0xFF2C2B26),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF2D4A42),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 6;
  static int get radiusMedium => 12;
  static int get radiusLarge => 20;
}
