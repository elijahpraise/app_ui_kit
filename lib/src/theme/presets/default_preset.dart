import 'package:flutter/material.dart';

import '../color_values.dart';

/// Preset color definitions for [DesignPreset.defaultPreset].
class DefaultPreset {
  DefaultPreset._();

  /// Light-mode [AppColors] for this preset.
  static AppColors get light => AppColors(
        primary: const Color(0xFF4F46E5),
        secondary: const Color(0xFF7C3AED),
        error: const Color(0xFFEF4444),
        surface: Colors.white,
        onSurface: const Color(0xFF1E293B),
        border: const Color(0xFFE2E8F0),
        inputLabel: const Color(0xFF64748B),
        inputText: const Color(0xFF1E293B),
        toastInfo: const Color(0xFF3B82F6),
        toastSuccess: const Color(0xFF10B981),
        toastError: const Color(0xFFEF4444),
        onToastInfo: Colors.white,
        onToastSuccess: Colors.white,
        onToastError: Colors.white,
        shimmer: const Color(0xFFE2E8F0),
        divider: const Color(0xFFE2E8F0),
        hover: const Color(0xFFF1F5F9),
        focusedBorder: const Color(0xFF4F46E5),
        errorBorder: const Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        primaryPressed: const Color(0xFF4338CA),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF8FAFC),
        onSurfaceDark: const Color(0xFF0F172A),
        onSurfaceBlack: Colors.black,
        dialogSurface: Colors.white,
      );

  /// Dark-mode [AppColors] for this preset.
  static AppColors get dark => AppColors(
        primary: const Color(0xFF818CF8),
        secondary: const Color(0xFFA78BFA),
        error: const Color(0xFFF87171),
        surface: const Color(0xFF0F172A),
        onSurface: const Color(0xFFF1F5F9),
        border: const Color(0xFF334155),
        inputLabel: const Color(0xFF94A3B8),
        inputText: const Color(0xFFF1F5F9),
        toastInfo: const Color(0xFF60A5FA),
        toastSuccess: const Color(0xFF34D399),
        toastError: const Color(0xFFF87171),
        onToastInfo: const Color(0xFF0F172A),
        onToastSuccess: const Color(0xFF0F172A),
        onToastError: Colors.white,
        shimmer: const Color(0xFF334155),
        divider: const Color(0xFF334155),
        hover: const Color(0xFF1E293B),
        focusedBorder: const Color(0xFF818CF8),
        errorBorder: const Color(0xFFF87171),
        onPrimary: const Color(0xFF0F172A),
        onSecondary: const Color(0xFF0F172A),
        onError: Colors.white,
        primaryPressed: const Color(0xFF6366F1),
        onSurfaceWhite: Colors.white,
        onSurfaceLight: const Color(0xFFF8FAFC),
        onSurfaceDark: const Color(0xFF0F172A),
        onSurfaceBlack: Colors.black,
        dialogSurface: const Color(0xFF1E293B),
      );

  /// Optional custom font family for this preset. Null means use system default.
  static String? get fontFamily => null;

  /// Small border radius (6).
  static int get radiusSmall => 6;

  /// Medium border radius (12).
  static int get radiusMedium => 12;

  /// Large border radius (20).
  static int get radiusLarge => 20;
}
