import 'package:flutter/material.dart';

import '../color_values.dart';

class MongodbPreset {
  MongodbPreset._();

  static AppColors get light => AppColors(
        primary: const Color(0xFF00ED64),
        secondary: const Color(0xFF8B9DAB),
        error: const Color(0xFFE5484D),
        surface: Colors.white,
        onSurface: const Color(0xFF001E2B),
        border: const Color(0xFFD0D7DE),
        inputLabel: const Color(0xFF6C7A89),
        inputText: const Color(0xFF001E2B),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF00ED64),
        toastError: const Color(0xFFE5484D),
        onToastInfo: Colors.white,
        onToastSuccess: const Color(0xFF001E2B),
        onToastError: Colors.white,
        shimmer: const Color(0xFFE8ECF0),
        divider: const Color(0xFFD0D7DE),
        hover: const Color(0xFFF0F4F8),
        focusedBorder: const Color(0xFF00ED64),
        errorBorder: const Color(0xFFE5484D),
        onPrimary: const Color(0xFF001E2B),
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF00C050),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF8FAFC),
        onSurfaceDark: const Color(0xFF001E2B),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  static AppColors get dark => AppColors(
        primary: const Color(0xFF00ED64),
        secondary: const Color(0xFF8B9DAB),
        error: const Color(0xFFE5484D),
        surface: const Color(0xFF001E2B),
        onSurface: const Color(0xFFE8ECF0),
        border: const Color(0xFF083344),
        inputLabel: const Color(0xFF8B9DAB),
        inputText: const Color(0xFFE8ECF0),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF00ED64),
        toastError: const Color(0xFFE5484D),
        onToastInfo: const Color(0xFF001E2B),
        onToastSuccess: const Color(0xFF001E2B),
        onToastError: Colors.white,
        shimmer: const Color(0xFF083344),
        divider: const Color(0xFF083344),
        hover: const Color(0xFF002A3D),
        focusedBorder: const Color(0xFF00ED64),
        errorBorder: const Color(0xFFE5484D),
        onPrimary: const Color(0xFF001E2B),
        onSecondary: const Color(0xFF001E2B),
        onError: Colors.white,
        primaryPressed: const Color(0xFF00C050),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF8FAFC),
        onSurfaceDark: const Color(0xFF001E2B),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF083344),
      );

  static String get fontFamily => 'Inter';

  static int get radiusSmall => 4;
  static int get radiusMedium => 8;
  static int get radiusLarge => 16;
}
