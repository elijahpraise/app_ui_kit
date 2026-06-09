import 'package:flutter/material.dart';

import '../color_values.dart';

class NotionPreset {
  NotionPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF0075DE),
        secondary: const Color(0xFF9B9B9B),
        error: const Color(0xFFE03E3E),
        surface: const Color(0xFFF6F5F4),
        onSurface: const Color(0xFF2D2D2D),
        border: const Color(0xFFE6E6E6),
        inputLabel: const Color(0xFF9B9B9B),
        inputText: const Color(0xFF2D2D2D),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF10B981),
        toastError: const Color(0xFFE03E3E),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFEBEBEB),
        divider: const Color(0xFFE6E6E6),
        hover: const Color(0xFFEFEFEF),
        focusedBorder: const Color(0xFF0075DE),
        errorBorder: const Color(0xFFE03E3E),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF005BB0),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF2D2D2D),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFF0075DE),
        secondary: const Color(0xFF9B9B9B),
        error: const Color(0xFFE03E3E),
        surface: const Color(0xFF2D2D2D),
        onSurface: const Color(0xFFEBEBEB),
        border: const Color(0xFF404040),
        inputLabel: const Color(0xFF9B9B9B),
        inputText: const Color(0xFFEBEBEB),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFE03E3E),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFF404040),
        divider: const Color(0xFF404040),
        hover: const Color(0xFF383838),
        focusedBorder: const Color(0xFF0075DE),
        errorBorder: const Color(0xFFE03E3E),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF005BB0),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFFAFAFA),
        onSurfaceDark: const Color(0xFF2D2D2D),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF404040),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 4;
  static int get radiusMedium => 8;
  static int get radiusLarge => 12;
}
