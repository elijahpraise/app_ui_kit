import 'package:flutter/material.dart';

import '../color_values.dart';
import 'color_tokens.dart';
import 'radius_tokens.dart';
import 'text_style_tokens.dart';

/// Aggregates the resolved [ColorTokens], [TextStyleTokens], and
/// [RadiusTokens] for the current [BuildContext]'s theme.
class ThemeToken {
  const ThemeToken({
    required this.color,
    required this.textStyle,
    required this.radius,
  });

  /// The resolved color tokens for the current theme.
  final ColorTokens color;

  /// The resolved text style tokens for the current theme.
  final TextStyleTokens textStyle;

  /// The resolved radius tokens for the current theme.
  final RadiusTokens radius;

  /// Resolves and returns a [ThemeToken] from the given [BuildContext].
  static ThemeToken of(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;
    final isDark = brightness == Brightness.dark;

    final appColors = _resolveAppColors(context, isDark);
    final textStyles = _resolveTextStyles(theme);
    final radii = _resolveRadii(theme);

    return ThemeToken(
      color: ColorTokens(appColors),
      textStyle: textStyles,
      radius: radii,
    );
  }

  static AppColors _resolveAppColors(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return AppColors(
      primary: cs.primary,
      secondary: cs.secondary,
      error: cs.error,
      surface: cs.surface,
      onSurface: cs.onSurface,
      border: theme.dividerColor,
      inputLabel: theme.inputDecorationTheme.labelStyle?.color ?? cs.onSurface.withValues(alpha: 0.6),
      inputText: theme.inputDecorationTheme.labelStyle?.color ?? cs.onSurface,
      toastInfo: const Color(0xFF3B82F6),
      toastSuccess: const Color(0xFF10B981),
      toastError: cs.error,
      onToastInfo: cs.onPrimary,
      onToastSuccess: cs.onPrimary,
      onToastError: cs.onError,
      shimmer: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
      divider: theme.dividerColor,
      hover: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
      focusedBorder: cs.primary,
      errorBorder: cs.error,
      onPrimary: cs.onPrimary,
      onSecondary: cs.onSecondary,
      onError: cs.onError,
      primaryPressed: cs.primary.withValues(alpha: 0.8),
      onSurfaceWhite: Colors.white,
      onSurfaceLight: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
      onSurfaceDark: isDark ? const Color(0xFFF1F5F9) : const Color(0xFF0F172A),
      onSurfaceBlack: Colors.black,
      dialogSurface: theme.dialogTheme.backgroundColor ?? cs.surface,
    );
  }

  static TextStyleTokens _resolveTextStyles(ThemeData theme) {
    final tt = theme.textTheme;
    return TextStyleTokens(
      heading1: tt.displayLarge ?? const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      heading2: tt.displayMedium ?? const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      heading3: tt.displaySmall ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      heading4: tt.headlineMedium ?? const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      subtitle1: tt.titleLarge ?? const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      subtitle2: tt.titleMedium ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      body1: tt.bodyLarge ?? const TextStyle(fontSize: 16),
      body2: tt.bodyMedium ?? const TextStyle(fontSize: 14),
      caption: tt.bodySmall ?? const TextStyle(fontSize: 12),
      button: tt.labelLarge ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      overline: tt.labelSmall ?? const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 1.5),
      label: tt.labelMedium ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    );
  }

  static RadiusTokens _resolveRadii(ThemeData theme) {
    return const RadiusTokens(
      small: 6,
      medium: 12,
      large: 20,
    );
  }
}

/// An extension on [BuildContext] to provide convenient access to the
/// resolved [ThemeToken].
extension ThemeTokenContext on BuildContext {
  /// Short-hand getter for the current [ThemeToken] resolved from this
  /// build context.
  ThemeToken get $token => ThemeToken.of(this);
}
