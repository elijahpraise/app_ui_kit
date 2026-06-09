import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_values.dart';
import '../design_preset.dart';
import '../presets/airbnb_preset.dart';
import '../presets/apple_preset.dart';
import '../presets/default_preset.dart';
import '../presets/high_contrast_preset.dart';
import '../presets/linear_preset.dart';
import '../presets/mongodb_preset.dart';
import '../presets/notion_preset.dart';
import '../presets/raycast_preset.dart';
import '../presets/spotify_preset.dart';
import '../presets/starbucks_preset.dart';
import '../presets/vercel_preset.dart';
import '../presets/vibrant_preset.dart';

/// Utility that builds a fully-themed [ThemeData] from a [DesignPreset] with
/// configurable brightness, font family, and color scheme overrides.
class AppTheme {
  AppTheme._();

  static bool? _gfAvailable;

  static bool get _canUseGoogleFonts {
    if (_gfAvailable == null) {
      try {
        WidgetsBinding.instance;
        _gfAvailable = true;
      } catch (_) {
        _gfAvailable = false;
      }
    }
    return _gfAvailable!;
  }

  static TextStyle _gf(String? fontFamily, TextStyle base) {
    if (fontFamily == null) return base;
    if (!_canUseGoogleFonts) return base.copyWith(fontFamily: fontFamily);
    return GoogleFonts.getFont(fontFamily, textStyle: base);
  }

  /// Builds a [ThemeData] from the given [preset], [brightness], and optional
  /// [fontFamily] or [colorSchemeOverride].
  ///
  /// [preset] selects the design preset (e.g. default, vercel, apple).
  /// [brightness] sets the theme to light or dark mode.
  /// [fontFamily] overrides the default font family from the preset.
  /// [colorSchemeOverride] replaces the computed [ColorScheme] entirely.
  static ThemeData build({
    required DesignPreset preset,
    Brightness brightness = Brightness.light,
    String? fontFamily,
    ColorScheme? colorSchemeOverride,
  }) {
    final appColors = _resolveColors(preset, brightness);
    final family = fontFamily ?? _resolveFontFamily(preset);

    final colorScheme = colorSchemeOverride ?? _buildColorScheme(appColors, brightness);
    final radii = _resolveRadii(preset).toDouble();

    final textTheme = _buildTextTheme(family);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: family,
      textTheme: textTheme,
      scaffoldBackgroundColor: appColors.surface,
      dividerColor: appColors.divider,
      dividerTheme: DividerThemeData(
        color: appColors.divider,
        thickness: 1,
        space: 1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appColors.surface,
        foregroundColor: appColors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: _gf(family, TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: appColors.onSurface,
        )),
        iconTheme: IconThemeData(color: appColors.onSurface),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.primary,
          foregroundColor: appColors.onPrimary,
          disabledBackgroundColor: appColors.primary.withValues(alpha: 0.4),
          disabledForegroundColor: appColors.onPrimary.withValues(alpha: 0.6),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: _gf(family, const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: appColors.primary,
          disabledForegroundColor: appColors.onSurface.withValues(alpha: 0.4),
          side: BorderSide(color: appColors.border),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: _gf(family, const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: appColors.primary,
          disabledForegroundColor: appColors.onSurface.withValues(alpha: 0.4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: _gf(family, const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brightness == Brightness.dark
            ? appColors.surface
            : appColors.onSurfaceLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: _gf(family, TextStyle(
          fontSize: 14,
          color: appColors.inputLabel,
        )),
        labelStyle: _gf(family, TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: appColors.inputLabel,
        )),
        floatingLabelStyle: _gf(family, TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: appColors.primary,
        )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii - 2),
          borderSide: BorderSide(color: appColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii - 2),
          borderSide: BorderSide(color: appColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii - 2),
          borderSide: BorderSide(color: appColors.focusedBorder, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii - 2),
          borderSide: BorderSide(color: appColors.errorBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii - 2),
          borderSide: BorderSide(color: appColors.errorBorder, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radii - 2),
          borderSide: BorderSide(color: appColors.border.withValues(alpha: 0.5)),
        ),
        errorStyle: _gf(family, TextStyle(
          fontSize: 12,
          color: appColors.error,
        )),
      ),
      cardTheme: CardThemeData(
        color: appColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii),
          side: BorderSide(color: appColors.border),
        ),
        margin: const EdgeInsets.all(0),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: appColors.dialogSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii + 8),
        ),
        titleTextStyle: _gf(family, TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: appColors.onSurface,
        )),
        contentTextStyle: _gf(family, TextStyle(
          fontSize: 14,
          color: appColors.onSurface.withValues(alpha: 0.8),
        )),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: appColors.dialogSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radii + 8)),
        ),
        showDragHandle: true,
        dragHandleColor: appColors.divider,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.onSurfaceDark,
        contentTextStyle: _gf(family, TextStyle(
          fontSize: 14,
          color: appColors.onSurfaceWhite,
        )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii - 2),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: appColors.surface,
        indicatorColor: appColors.primary.withValues(alpha: 0.12),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _gf(family, TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: appColors.primary,
            ));
          }
          return _gf(family, TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: appColors.onSurface.withValues(alpha: 0.6),
          ));
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: appColors.primary, size: 24);
          }
          return IconThemeData(
            color: appColors.onSurface.withValues(alpha: 0.6),
            size: 24,
          );
        }),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: appColors.primary,
        unselectedLabelColor: appColors.onSurface.withValues(alpha: 0.6),
        labelStyle: _gf(family, const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        )),
        unselectedLabelStyle: _gf(family, const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        )),
        indicatorColor: appColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: appColors.onSurfaceLight,
        labelStyle: _gf(family, TextStyle(
          fontSize: 13,
          color: appColors.onSurface,
        )),
        side: BorderSide(color: appColors.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii - 2),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.primary;
          }
          return appColors.onSurface.withValues(alpha: 0.4);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.primary.withValues(alpha: 0.3);
          }
          return appColors.onSurface.withValues(alpha: 0.1);
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.onPrimary;
          }
          return appColors.onSurface;
        }),
        side: BorderSide(color: appColors.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii - 4),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.primary;
          }
          return appColors.onSurface.withValues(alpha: 0.6);
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: appColors.primary,
        inactiveTrackColor: appColors.primary.withValues(alpha: 0.2),
        thumbColor: appColors.primary,
        overlayColor: appColors.primary.withValues(alpha: 0.12),
        valueIndicatorColor: appColors.primary,
        valueIndicatorTextStyle: _gf(family, TextStyle(
          fontSize: 12,
          color: appColors.onPrimary,
        )),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: appColors.dialogSurface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii - 2),
        ),
        textStyle: _gf(family, TextStyle(
          fontSize: 14,
          color: appColors.onSurface,
        )),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: appColors.primary,
        linearTrackColor: appColors.primary.withValues(alpha: 0.2),
        circularTrackColor: appColors.primary.withValues(alpha: 0.2),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: appColors.onSurfaceDark,
          borderRadius: BorderRadius.circular(radii - 4),
        ),
        textStyle: _gf(family, TextStyle(
          fontSize: 12,
          color: appColors.onSurfaceWhite,
        )),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.primary,
        foregroundColor: appColors.onPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: appColors.onSurface,
        collapsedIconColor: appColors.onSurface,
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shape: const Border(),
        collapsedShape: const Border(),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: _gf(family, TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: appColors.onSurface,
        )),
        subtitleTextStyle: _gf(family, TextStyle(
          fontSize: 13,
          color: appColors.inputLabel,
        )),
        leadingAndTrailingTextStyle: _gf(family, TextStyle(
          fontSize: 14,
          color: appColors.onSurface,
        )),
        iconColor: appColors.onSurface,
        textColor: appColors.onSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
      iconTheme: IconThemeData(
        color: appColors.onSurface,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: appColors.onPrimary,
        size: 24,
      ),
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(appColors.dialogSurface),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radii - 2),
            ),
          ),
        ),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: appColors.primary,
        textColor: appColors.onPrimary,
        textStyle: _gf(family, const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        )),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll(
          brightness == Brightness.dark
              ? appColors.surface
              : appColors.onSurfaceLight,
        ),
        elevation: WidgetStatePropertyAll(0),
        side: WidgetStatePropertyAll(BorderSide(color: appColors.border)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii),
          ),
        ),
        textStyle: WidgetStatePropertyAll(_gf(family, TextStyle(
          fontSize: 14,
          color: appColors.inputText,
        ))),
        hintStyle: WidgetStatePropertyAll(_gf(family, TextStyle(
          fontSize: 14,
          color: appColors.inputLabel,
        ))),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: appColors.dialogSurface,
        headerBackgroundColor: appColors.primary,
        headerForegroundColor: appColors.onPrimary,
        dayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.onPrimary;
          }
          return appColors.onSurface;
        }),
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appColors.primary;
          }
          return null;
        }),
        todayForegroundColor: WidgetStatePropertyAll(appColors.primary),
        todayBackgroundColor: WidgetStatePropertyAll(appColors.primary.withValues(alpha: 0.12)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii),
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: appColors.dialogSurface,
        dialBackgroundColor: appColors.onSurfaceLight,
        dialHandColor: appColors.primary,
        dialTextColor: appColors.onSurface,
        entryModeIconColor: appColors.primary,
        hourMinuteColor: appColors.onSurfaceLight,
        hourMinuteTextColor: appColors.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: appColors.surface,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(0)),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: appColors.surface,
        elevation: 0,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: appColors.surface,
        indicatorColor: appColors.primary.withValues(alpha: 0.12),
      ),
    );
  }

  static AppColors _resolveColors(DesignPreset preset, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return switch (preset) {
      DesignPreset.defaultPreset => isDark ? DefaultPreset.dark : DefaultPreset.light,
      DesignPreset.vercel => isDark ? VercelPreset.dark : VercelPreset.light,
      DesignPreset.airbnb => isDark ? AirbnbPreset.dark : AirbnbPreset.light,
      DesignPreset.apple => isDark ? ApplePreset.dark : ApplePreset.light,
      DesignPreset.spotify => isDark ? SpotifyPreset.dark : SpotifyPreset.light,
      DesignPreset.vibrant => isDark ? VibrantPreset.dark : VibrantPreset.light,
      DesignPreset.highContrast => isDark ? HighContrastPreset.dark : HighContrastPreset.light,
      DesignPreset.starbucks => isDark ? StarbucksPreset.dark : StarbucksPreset.light,
      DesignPreset.linear => isDark ? LinearPreset.dark : LinearPreset.light,
      DesignPreset.notion => isDark ? NotionPreset.dark : NotionPreset.light,
      DesignPreset.mongodb => isDark ? MongodbPreset.dark : MongodbPreset.light,
      DesignPreset.raycast => isDark ? RaycastPreset.dark : RaycastPreset.light,
    };
  }

  static int _resolveRadii(DesignPreset preset) {
    return switch (preset) {
      DesignPreset.defaultPreset => DefaultPreset.radiusMedium,
      DesignPreset.vercel => VercelPreset.radiusMedium,
      DesignPreset.airbnb => AirbnbPreset.radiusMedium,
      DesignPreset.apple => ApplePreset.radiusMedium,
      DesignPreset.spotify => SpotifyPreset.radiusMedium,
      DesignPreset.vibrant => VibrantPreset.radiusMedium,
      DesignPreset.highContrast => HighContrastPreset.radiusMedium,
      DesignPreset.starbucks => StarbucksPreset.radiusMedium,
      DesignPreset.linear => LinearPreset.radiusMedium,
      DesignPreset.notion => NotionPreset.radiusMedium,
      DesignPreset.mongodb => MongodbPreset.radiusMedium,
      DesignPreset.raycast => RaycastPreset.radiusMedium,
    };
  }

  static String? _resolveFontFamily(DesignPreset preset) {
    return switch (preset) {
      DesignPreset.defaultPreset => DefaultPreset.fontFamily,
      DesignPreset.vercel => VercelPreset.fontFamily,
      DesignPreset.airbnb => AirbnbPreset.fontFamily,
      DesignPreset.apple => ApplePreset.fontFamily,
      DesignPreset.spotify => SpotifyPreset.fontFamily,
      DesignPreset.vibrant => VibrantPreset.fontFamily,
      DesignPreset.highContrast => HighContrastPreset.fontFamily,
      DesignPreset.starbucks => StarbucksPreset.fontFamily,
      DesignPreset.linear => LinearPreset.fontFamily,
      DesignPreset.notion => NotionPreset.fontFamily,
      DesignPreset.mongodb => MongodbPreset.fontFamily,
      DesignPreset.raycast => RaycastPreset.fontFamily,
    };
  }

  static ColorScheme _buildColorScheme(AppColors appColors, Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: appColors.primary,
      onPrimary: appColors.onPrimary,
      secondary: appColors.secondary,
      onSecondary: appColors.onSecondary,
      error: appColors.error,
      onError: appColors.onError,
      surface: appColors.surface,
      onSurface: appColors.onSurface,
      outline: appColors.border,
      outlineVariant: appColors.divider,
    );
  }

  static TextTheme _buildTextTheme(String? fontFamily) {
    TextStyle _st(double size, FontWeight weight, {double? letterSpacing = 0}) {
      final base = TextStyle(fontSize: size, fontWeight: weight, letterSpacing: letterSpacing);
      if (fontFamily == null) return base;
      if (!_canUseGoogleFonts) return base.copyWith(fontFamily: fontFamily);
      try {
        return GoogleFonts.getFont(fontFamily, textStyle: base);
      } catch (_) {
        return base.copyWith(fontFamily: fontFamily);
      }
    }

    return TextTheme(
      displayLarge: _st(32, FontWeight.bold, letterSpacing: -0.5),
      displayMedium: _st(28, FontWeight.bold, letterSpacing: -0.25),
      displaySmall: _st(24, FontWeight.w600),
      headlineLarge: _st(22, FontWeight.w600),
      headlineMedium: _st(20, FontWeight.w600),
      headlineSmall: _st(18, FontWeight.w600),
      titleLarge: _st(18, FontWeight.w500),
      titleMedium: _st(16, FontWeight.w500),
      titleSmall: _st(14, FontWeight.w500),
      bodyLarge: _st(16, FontWeight.normal),
      bodyMedium: _st(14, FontWeight.normal),
      bodySmall: _st(12, FontWeight.normal),
      labelLarge: _st(14, FontWeight.w600),
      labelMedium: _st(12, FontWeight.w500),
      labelSmall: _st(10, FontWeight.w500, letterSpacing: 1.5),
    );
  }
}
