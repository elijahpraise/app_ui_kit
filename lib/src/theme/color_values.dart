import 'package:flutter/material.dart';

/// A container for all color values used throughout the app theme, organized
/// by semantic purpose (primary, surface, toast, input, etc.).
class AppColors {
  /// Creates an [AppColors] with all required color fields.
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

  /// The primary brand color.
  final Color primary;

  /// The secondary brand color.
  final Color secondary;

  /// The color used for error states and messages.
  final Color error;

  /// The background / surface color of the app.
  final Color surface;

  /// The default text / icon color on [surface].
  final Color onSurface;

  /// The default border color.
  final Color border;

  /// The color of input field labels and hint text.
  final Color inputLabel;

  /// The color of input field text.
  final Color inputText;

  /// The background color for informational toasts.
  final Color toastInfo;

  /// The background color for success toasts.
  final Color toastSuccess;

  /// The background color for error toasts.
  final Color toastError;

  /// The text / icon color on [toastInfo].
  final Color onToastInfo;

  /// The text / icon color on [toastSuccess].
  final Color onToastSuccess;

  /// The text / icon color on [toastError].
  final Color onToastError;

  /// The color used for shimmer / skeleton loading effects.
  final Color shimmer;

  /// The color used for dividers and separators.
  final Color divider;

  /// The color used for hover state backgrounds.
  final Color hover;

  /// The color of the focused border for input fields.
  final Color focusedBorder;

  /// The color of the error border for input fields.
  final Color errorBorder;

  /// The text / icon color on [primary].
  final Color onPrimary;

  /// The text / icon color on [secondary].
  final Color onSecondary;

  /// The text / icon color on [error].
  final Color onError;

  /// The pressed state color for [primary].
  final Color primaryPressed;

  /// The text / icon color for content on dark surface backgrounds (white).
  final Color onSurfaceWhite;

  /// A light variant of [onSurface] for subtle backgrounds.
  final Color onSurfaceLight;

  /// A dark variant of [onSurface] for prominent foregrounds.
  final Color onSurfaceDark;

  /// The text / icon color for content on light surface backgrounds (black).
  final Color onSurfaceBlack;

  /// The background color of dialogs and bottom sheets.
  final Color dialogSurface;

  /// Linearly interpolates between this [AppColors] and [other] by [t].
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
