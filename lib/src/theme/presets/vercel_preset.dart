import 'package:flutter/material.dart';

import '../color_values.dart';

class VercelPreset {
  VercelPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF000000),
        secondary: const Color(0xFF64748B),
        error: const Color(0xFFEF4444),
        surface: Colors.white,
        onSurface: const Color(0xFF0A0A0A),
        border: const Color(0xFFE5E5E5),
        inputLabel: const Color(0xFF737373),
        inputText: const Color(0xFF0A0A0A),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF10B981),
        toastError: const Color(0xFFEF4444),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE5E5E5),
        divider: const Color(0xFFE5E5E5),
        hover: const Color(0xFFF5F5F5),
        focusedBorder: const Color(0xFF000000),
        errorBorder: const Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF333333),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF0A0A0A),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: Colors.white,
        secondary: const Color(0xFFA1A1AA),
        error: const Color(0xFFF87171),
        surface: const Color(0xFF0A0A0A),
        onSurface: const Color(0xFFFAFAFA),
        border: const Color(0xFF27272A),
        inputLabel: const Color(0xFFA1A1AA),
        inputText: const Color(0xFFFAFAFA),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFF87171),
        onToastInfo: const Color(0xFF0A0A0A),
        onToastSuccess: const Color(0xFF0A0A0A),
        onToastError: Colors.white,
        shimmer: const Color(0xFF27272A),
        divider: const Color(0xFF27272A),
        hover: const Color(0xFF18181B),
        focusedBorder: Colors.white,
        errorBorder: const Color(0xFFF87171),
        onPrimary: const Color(0xFF0A0A0A),
        onSecondary: const Color(0xFF0A0A0A),
        onError: Colors.white,
        primaryPressed: const Color(0xFFD4D4D8),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF0A0A0A),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF18181B),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 4;
  static int get radiusMedium => 8;
  static int get radiusLarge => 16;
}
