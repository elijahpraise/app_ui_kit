import 'package:flutter/material.dart';

import '../color_values.dart';

class RaycastPreset {
  RaycastPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF0D0D0D),
        secondary: const Color(0xFF6B7280),
        error: const Color(0xFFEF4444),
        surface: const Color(0xFFF4F4F6),
        onSurface: const Color(0xFF0D0D0D),
        border: const Color(0xFFD1D5DB),
        inputLabel: const Color(0xFF6B7280),
        inputText: const Color(0xFF0D0D0D),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF10B981),
        toastError: const Color(0xFFEF4444),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE5E7EB),
        divider: const Color(0xFFD1D5DB),
        hover: const Color(0xFFE5E7EB),
        focusedBorder: const Color(0xFF0D0D0D),
        errorBorder: const Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF333333),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF0D0D0D),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFFF4F4F6),
        secondary: const Color(0xFF9CA3AF),
        error: const Color(0xFFF87171),
        surface: const Color(0xFF07080A),
        onSurface: const Color(0xFFF4F4F6),
        border: const Color(0xFF1F2128),
        inputLabel: const Color(0xFF9CA3AF),
        inputText: const Color(0xFFF4F4F6),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFF87171),
        onToastInfo: const Color(0xFF07080A),
        onToastSuccess: const Color(0xFF07080A),
        onToastError: Colors.white,
        shimmer: const Color(0xFF1F2128),
        divider: const Color(0xFF1F2128),
        hover: const Color(0xFF111115),
        focusedBorder: const Color(0xFFF4F4F6),
        errorBorder: const Color(0xFFF87171),
        onPrimary: const Color(0xFF07080A),
        onSecondary: const Color(0xFF07080A),
        onError: Colors.white,
        primaryPressed: const Color(0xFFD1D5DB),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF0D0D0D),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF1F2128),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 4;
  static int get radiusMedium => 8;
  static int get radiusLarge => 12;
}
