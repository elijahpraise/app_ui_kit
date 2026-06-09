import 'package:flutter/material.dart';

import '../color_values.dart';

class VibrantPreset {
  VibrantPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF7C3AED),
        secondary: const Color(0xFFEC4899),
        error: const Color(0xFFEF4444),
        surface: Colors.white,
        onSurface: const Color(0xFF1A1A2E),
        border: const Color(0xFFE2E0F0),
        inputLabel: const Color(0xFF6B7280),
        inputText: const Color(0xFF1A1A2E),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF10B981),
        toastError: const Color(0xFFEF4444),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE8E8E8),
        divider: const Color(0xFFE2E0F0),
        hover: const Color(0xFFF5F3FF),
        focusedBorder: const Color(0xFF7C3AED),
        errorBorder: const Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF6D28D9),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF9F8FF),
        onSurfaceDark: const Color(0xFF1A1A2E),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFFA78BFA),
        secondary: const Color(0xFFF472B6),
        error: const Color(0xFFF87171),
        surface: const Color(0xFF1A1A2E),
        onSurface: const Color(0xFFF5F3FF),
        border: const Color(0xFF2D2B55),
        inputLabel: const Color(0xFF9CA3AF),
        inputText: const Color(0xFFF5F3FF),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFF87171),
        onToastInfo: const Color(0xFF1A1A2E),
        onToastSuccess: const Color(0xFF1A1A2E),
        onToastError: Colors.white,
        shimmer: const Color(0xFF2D2B55),
        divider: const Color(0xFF2D2B55),
        hover: const Color(0xFF16213E),
        focusedBorder: const Color(0xFFA78BFA),
        errorBorder: const Color(0xFFF87171),
        onPrimary: const Color(0xFF1A1A2E),
        onSecondary: const Color(0xFF1A1A2E),
        onError: Colors.white,
        primaryPressed: const Color(0xFF8B5CF6),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF9F8FF),
        onSurfaceDark: const Color(0xFF1A1A2E),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF2D2B55),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 6;
  static int get radiusMedium => 12;
  static int get radiusLarge => 20;
}
