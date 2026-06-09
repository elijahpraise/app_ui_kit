import 'package:flutter/material.dart';

import '../color_values.dart';

class ApplePreset {
  ApplePreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF007AFF),
        secondary: const Color(0xFF5856D6),
        error: const Color(0xFFFF3B30),
        surface: const Color(0xFFF2F2F7),
        onSurface: const Color(0xFF1C1C1E),
        border: const Color(0xFFC6C6C8),
        inputLabel: const Color(0xFF8E8E93),
        inputText: const Color(0xFF1C1C1E),
        toastInfo: const Color(0xFF007AFF),
        toastSuccess: const Color(0xFF34C759),
        toastError: const Color(0xFFFF3B30),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE5E5EA),
        divider: const Color(0xFFC6C6C8),
        hover: const Color(0xFFE5E5EA),
        focusedBorder: const Color(0xFF007AFF),
        errorBorder: const Color(0xFFFF3B30),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF0055CC),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF2F2F7),
        onSurfaceDark: const Color(0xFF1C1C1E),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFFF2F2F7),
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFF0A84FF),
        secondary: const Color(0xFF5E5CE6),
        error: const Color(0xFFFF453A),
        surface: const Color(0xFF1C1C1E),
        onSurface: const Color(0xFFF2F2F7),
        border: const Color(0xFF38383A),
        inputLabel: const Color(0xFF98989D),
        inputText: const Color(0xFFF2F2F7),
        toastInfo: const Color(0xFF0A84FF),
        toastSuccess: const Color(0xFF30D158),
        toastError: const Color(0xFFFF453A),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFF38383A),
        divider: const Color(0xFF38383A),
        hover: const Color(0xFF2C2C2E),
        focusedBorder: const Color(0xFF0A84FF),
        errorBorder: const Color(0xFFFF453A),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF0066CC),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF2F2F7),
        onSurfaceDark: const Color(0xFF1C1C1E),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF2C2C2E),
      );

  static String get fontFamily => '.SF Pro Display';

  static int get radiusSmall => 6;
  static int get radiusMedium => 10;
  static int get radiusLarge => 18;
}
