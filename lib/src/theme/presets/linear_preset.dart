import 'package:flutter/material.dart';

import '../color_values.dart';

class LinearPreset {
  LinearPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF5E6AD2),
        secondary: const Color(0xFF8B8FA3),
        error: const Color(0xFFDC2626),
        surface: const Color(0xFFFCFCFD),
        onSurface: const Color(0xFF1A1D23),
        border: const Color(0xFFD9DDE3),
        inputLabel: const Color(0xFF6C727F),
        inputText: const Color(0xFF1A1D23),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF10B981),
        toastError: const Color(0xFFDC2626),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE5E7EB),
        divider: const Color(0xFFD9DDE3),
        hover: const Color(0xFFF3F4F6),
        focusedBorder: const Color(0xFF5E6AD2),
        errorBorder: const Color(0xFFDC2626),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF4C52B3),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF9FAFB),
        onSurfaceDark: const Color(0xFF1A1D23),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFF5E6AD2),
        secondary: const Color(0xFF8B8FA3),
        error: const Color(0xFFF87171),
        surface: const Color(0xFF010102),
        onSurface: const Color(0xFFEBEDF0),
        border: const Color(0xFF23252A),
        inputLabel: const Color(0xFF6C727F),
        inputText: const Color(0xFFEBEDF0),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFF87171),
        onToastInfo: const Color(0xFF010102),
        onToastSuccess: const Color(0xFF010102),
        onToastError: Colors.white,
        shimmer: const Color(0xFF23252A),
        divider: const Color(0xFF23252A),
        hover: const Color(0xFF111113),
        focusedBorder: const Color(0xFF5E6AD2),
        errorBorder: const Color(0xFFF87171),
        onPrimary: Colors.white,
        onSecondary: const Color(0xFF010102),
        onError: Colors.white,
        primaryPressed: const Color(0xFF4C52B3),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF9FAFB),
        onSurfaceDark: const Color(0xFF1A1D23),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF181A1E),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 4;
  static int get radiusMedium => 8;
  static int get radiusLarge => 12;
}
