import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.surface,
    required this.onSurface,
    required this.border,
    required this.inputLabel,
    required this.inputText,
    required this.toastInfo,
    required this.toastSuccess,
    required this.toastError,
    required this.onToastInfo,
    required this.onToastSuccess,
    required this.onToastError,
    required this.shimmer,
    required this.divider,
    required this.hover,
    required this.focusedBorder,
    required this.errorBorder,
    required this.onPrimary,
    required this.onSecondary,
    required this.onError,
    required this.primaryPressed,
    required this.onSurfaceWhite,
    required this.onSurfaceLight,
    required this.onSurfaceDark,
    required this.onSurfaceBlack,
    required this.dialogSurface,
  });

  final Color primary;
  final Color secondary;
  final Color error;
  final Color surface;
  final Color onSurface;
  final Color border;
  final Color inputLabel;
  final Color inputText;
  final Color toastInfo;
  final Color toastSuccess;
  final Color toastError;
  final Color onToastInfo;
  final Color onToastSuccess;
  final Color onToastError;
  final Color shimmer;
  final Color divider;
  final Color hover;
  final Color focusedBorder;
  final Color errorBorder;
  final Color onPrimary;
  final Color onSecondary;
  final Color onError;
  final Color primaryPressed;
  final Color onSurfaceWhite;
  final Color onSurfaceLight;
  final Color onSurfaceDark;
  final Color onSurfaceBlack;
  final Color dialogSurface;

  AppColors lerp(AppColors other, double t) {
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      border: Color.lerp(border, other.border, t)!,
      inputLabel: Color.lerp(inputLabel, other.inputLabel, t)!,
      inputText: Color.lerp(inputText, other.inputText, t)!,
      toastInfo: Color.lerp(toastInfo, other.toastInfo, t)!,
      toastSuccess: Color.lerp(toastSuccess, other.toastSuccess, t)!,
      toastError: Color.lerp(toastError, other.toastError, t)!,
      onToastInfo: Color.lerp(onToastInfo, other.onToastInfo, t)!,
      onToastSuccess: Color.lerp(onToastSuccess, other.onToastSuccess, t)!,
      onToastError: Color.lerp(onToastError, other.onToastError, t)!,
      shimmer: Color.lerp(shimmer, other.shimmer, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      hover: Color.lerp(hover, other.hover, t)!,
      focusedBorder: Color.lerp(focusedBorder, other.focusedBorder, t)!,
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      onSurfaceWhite: Color.lerp(onSurfaceWhite, other.onSurfaceWhite, t)!,
      onSurfaceLight: Color.lerp(onSurfaceLight, other.onSurfaceLight, t)!,
      onSurfaceDark: Color.lerp(onSurfaceDark, other.onSurfaceDark, t)!,
      onSurfaceBlack: Color.lerp(onSurfaceBlack, other.onSurfaceBlack, t)!,
      dialogSurface: Color.lerp(dialogSurface, other.dialogSurface, t)!,
    );
  }
}
