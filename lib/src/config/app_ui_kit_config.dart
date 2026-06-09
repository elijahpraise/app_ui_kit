import 'package:flutter/material.dart';

import 'app_ui_kit_preset.dart';
import 'app_ui_kit_theme_bundle.dart';

/// Signature for building custom [ThemeData] from a [Brightness] and [AppUiKitConfig].
typedef AppUiKitThemeBuilder = ThemeData Function(
  Brightness brightness,
  AppUiKitConfig config,
);

/// Config contract supplied by host applications when initializing the package.
class AppUiKitConfig {
  /// Creates a [AppUiKitConfig] with default values and optional overrides.
  const AppUiKitConfig({
    this.fontFamily,
    this.preset = AppUiKitPreset.baseline,
    this.themeMode = ThemeMode.system,
    this.lightTheme,
    this.darkTheme,
    this.lightColorScheme,
    this.darkColorScheme,
    this.themeBuilder,
    this.uiTokens = const {},
  });

  /// Preferred app-wide font family (e.g. Inter, SF Pro, Nunito).
  final String? fontFamily;

  /// Quick preset for default visual style.
  final AppUiKitPreset preset;

  /// Default theme mode to use in the host app.
  final ThemeMode themeMode;

  /// Optional complete light theme override.
  final ThemeData? lightTheme;

  /// Optional complete dark theme override.
  final ThemeData? darkTheme;

  /// Optional light color scheme override used by default theme generation.
  final ColorScheme? lightColorScheme;

  /// Optional dark color scheme override used by default theme generation.
  final ColorScheme? darkColorScheme;

  /// Optional custom builder for generating themes.
  final AppUiKitThemeBuilder? themeBuilder;

  /// Extra host-defined tokens for UI needs not covered by core fields.
  final Map<String, Object?> uiTokens;

  /// Fetches a typed token if available.
  T? token<T>(String key) {
    final value = uiTokens[key];
    if (value is T) {
      return value;
    }
    return null;
  }

  /// Resolved light theme using overrides, builders, or package defaults.
  ThemeData get resolvedLightTheme => _resolveTheme(Brightness.light);

  /// Resolved dark theme using overrides, builders, or package defaults.
  ThemeData get resolvedDarkTheme => _resolveTheme(Brightness.dark);

  /// Builds a theme bundle for easy integration with [MaterialApp].
  AppUiKitThemeBundle toThemeBundle() {
    return AppUiKitThemeBundle(
      lightTheme: resolvedLightTheme,
      darkTheme: resolvedDarkTheme,
      themeMode: themeMode,
    );
  }

  /// Returns a copy of this config with the given fields replaced by new values.
  AppUiKitConfig copyWith({
    String? fontFamily,
    AppUiKitPreset? preset,
    ThemeMode? themeMode,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    ColorScheme? lightColorScheme,
    ColorScheme? darkColorScheme,
    AppUiKitThemeBuilder? themeBuilder,
    Map<String, Object?>? uiTokens,
  }) {
    return AppUiKitConfig(
      fontFamily: fontFamily ?? this.fontFamily,
      preset: preset ?? this.preset,
      themeMode: themeMode ?? this.themeMode,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      lightColorScheme: lightColorScheme ?? this.lightColorScheme,
      darkColorScheme: darkColorScheme ?? this.darkColorScheme,
      themeBuilder: themeBuilder ?? this.themeBuilder,
      uiTokens: uiTokens ?? this.uiTokens,
    );
  }

  ThemeData _resolveTheme(Brightness brightness) {
    final explicitTheme = brightness == Brightness.light ? lightTheme : darkTheme;
    if (explicitTheme != null) {
      return explicitTheme;
    }

    final builder = themeBuilder;
    if (builder != null) {
      return builder(brightness, this);
    }

    return _buildDefaultTheme(brightness);
  }

  ThemeData _buildDefaultTheme(Brightness brightness) {
    final colorScheme = _resolveColorScheme(brightness);
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
    );

    switch (preset) {
      case AppUiKitPreset.baseline:
        return baseTheme;
      case AppUiKitPreset.vercel:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.compact,
        );
      case AppUiKitPreset.airbnb:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.comfortable,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        );
      case AppUiKitPreset.apple:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.comfortable,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      case AppUiKitPreset.vibrant:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.comfortable,
        );
      case AppUiKitPreset.highContrast:
        return baseTheme.copyWith(
          colorScheme: colorScheme.copyWith(
            onPrimary: brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
            onSecondary: brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
          ),
        );
      case AppUiKitPreset.spotify:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.compact,
          cardTheme: CardTheme(
            color: brightness == Brightness.dark
                ? const Color(0xFF181818)
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      case AppUiKitPreset.starbucks:
        return baseTheme.copyWith(
          scaffoldBackgroundColor: brightness == Brightness.light
              ? const Color(0xFFF2F0EB)
              : baseTheme.scaffoldBackgroundColor,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      case AppUiKitPreset.linear:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.compact,
          scaffoldBackgroundColor: brightness == Brightness.dark
              ? const Color(0xFF010102)
              : baseTheme.scaffoldBackgroundColor,
          dividerColor: brightness == Brightness.dark
              ? const Color(0xFF23252A)
              : baseTheme.dividerColor,
        );
      case AppUiKitPreset.notion:
        return baseTheme.copyWith(
          scaffoldBackgroundColor: brightness == Brightness.light
              ? const Color(0xFFF6F5F4)
              : const Color(0xFF213183),
          dividerColor: brightness == Brightness.light
              ? const Color(0xFFE6E6E6)
              : baseTheme.dividerColor,
        );
      case AppUiKitPreset.mongodb:
        return baseTheme.copyWith(
          scaffoldBackgroundColor: brightness == Brightness.dark
              ? const Color(0xFF001E2B)
              : baseTheme.scaffoldBackgroundColor,
          visualDensity: VisualDensity.standard,
        );
      case AppUiKitPreset.raycast:
        return baseTheme.copyWith(
          visualDensity: VisualDensity.compact,
          scaffoldBackgroundColor: brightness == Brightness.dark
              ? const Color(0xFF07080A)
              : const Color(0xFFF4F4F6),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
    }
  }

  ColorScheme _resolveColorScheme(Brightness brightness) {
    final overrideScheme =
        brightness == Brightness.light ? lightColorScheme : darkColorScheme;
    if (overrideScheme != null) {
      return overrideScheme;
    }

    return ColorScheme.fromSeed(
      seedColor: _seedColorForPreset(preset, brightness),
      brightness: brightness,
    );
  }

  Color _seedColorForPreset(
    AppUiKitPreset currentPreset,
    Brightness brightness,
  ) {
    switch (currentPreset) {
      case AppUiKitPreset.baseline:
        return const Color(0xFF4F46E5);
      case AppUiKitPreset.vercel:
        return brightness == Brightness.dark
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
      case AppUiKitPreset.airbnb:
        return const Color(0xFFFF385C);
      case AppUiKitPreset.apple:
        return const Color(0xFF007AFF);
      case AppUiKitPreset.vibrant:
        return brightness == Brightness.dark
            ? const Color(0xFFE879F9)
            : const Color(0xFF7C3AED);
      case AppUiKitPreset.highContrast:
        return brightness == Brightness.dark
            ? const Color(0xFF22D3EE)
            : const Color(0xFF0F172A);
      case AppUiKitPreset.spotify:
        return const Color(0xFF1ED760);
      case AppUiKitPreset.starbucks:
        return brightness == Brightness.dark
            ? const Color(0xFF1E3932)
            : const Color(0xFF006241);
      case AppUiKitPreset.linear:
        return const Color(0xFF5E6AD2);
      case AppUiKitPreset.notion:
        return const Color(0xFF0075DE);
      case AppUiKitPreset.mongodb:
        return const Color(0xFF00ED64);
      case AppUiKitPreset.raycast:
        return brightness == Brightness.dark
            ? const Color(0xFFF4F4F6)
            : const Color(0xFF0D0D0D);
    }
  }
}
