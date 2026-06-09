import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/flutter_ui_kit.dart';

void main() {
  group('DesignPreset', () {
    test('has correct label for each preset', () {
      expect(DesignPreset.defaultPreset.label, 'Default');
      expect(DesignPreset.vercel.label, 'Vercel');
      expect(DesignPreset.airbnb.label, 'Airbnb');
      expect(DesignPreset.apple.label, 'Apple');
      expect(DesignPreset.spotify.label, 'Spotify');
      expect(DesignPreset.vibrant.label, 'Vibrant');
      expect(DesignPreset.highContrast.label, 'High Contrast');
      expect(DesignPreset.starbucks.label, 'Starbucks');
      expect(DesignPreset.linear.label, 'Linear');
      expect(DesignPreset.notion.label, 'Notion');
      expect(DesignPreset.mongodb.label, 'MongoDB');
      expect(DesignPreset.raycast.label, 'Raycast');
    });

    test('values contains all presets', () {
      expect(DesignPreset.values.length, 12);
    });
  });

  group('AppTheme', () {
    test('builds theme for each preset without error', () {
      for (final preset in DesignPreset.values) {
        final light = AppTheme.build(preset: preset, brightness: Brightness.light);
        final dark = AppTheme.build(preset: preset, brightness: Brightness.dark);
        expect(light, isNotNull);
        expect(dark, isNotNull);
        expect(light.brightness, Brightness.light);
        expect(dark.brightness, Brightness.dark);
      }
    });

    test('defaultPreset uses Material 3', () {
      final theme = AppTheme.build(preset: DesignPreset.defaultPreset);
      expect(theme.useMaterial3, isTrue);
    });

    test('vercel preset has correct scaffold color in light mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.vercel,
        brightness: Brightness.light,
      );
      expect(theme.scaffoldBackgroundColor, Colors.white);
    });

    test('vercel preset has correct scaffold color in dark mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.vercel,
        brightness: Brightness.dark,
      );
      expect(theme.scaffoldBackgroundColor, const Color(0xFF0A0A0A));
    });

    test('spotify preset has correct primary color in light mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.spotify,
        brightness: Brightness.light,
      );
      expect(theme.colorScheme.primary, const Color(0xFF1DB954));
    });

    test('highContrast preset has white primary in dark mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.highContrast,
        brightness: Brightness.dark,
      );
      expect(theme.colorScheme.primary, Colors.white);
    });

    test('highContrast preset has black primary in light mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.highContrast,
        brightness: Brightness.light,
      );
      expect(theme.colorScheme.primary, Colors.black);
    });

    test('starbucks preset renders light mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.starbucks,
        brightness: Brightness.light,
      );
      expect(theme.colorScheme.primary, const Color(0xFF006241));
    });

    test('linear preset renders dark mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.linear,
        brightness: Brightness.dark,
      );
      expect(theme.colorScheme.primary, const Color(0xFF5E6AD2));
    });

    test('notion preset has correct surface in light mode', () {
      final theme = AppTheme.build(
        preset: DesignPreset.notion,
        brightness: Brightness.light,
      );
      expect(theme.scaffoldBackgroundColor, const Color(0xFFF6F5F4));
    });

    test('apple preset renders default font', () {
      final theme = AppTheme.build(preset: DesignPreset.apple);
      expect(theme.textTheme.bodyMedium?.fontFamily, '.SF Pro Display');
    });

    test('each preset produces distinct primary colors', () {
      final colors = DesignPreset.values.map((p) {
        return AppTheme.build(preset: p, brightness: Brightness.light)
            .colorScheme
            .primary;
      }).toSet();
      expect(colors.length, greaterThanOrEqualTo(4));
    });

    test('accepts color scheme override', () {
      final override = ColorScheme.light(primary: Colors.pink);
      final theme = AppTheme.build(
        preset: DesignPreset.defaultPreset,
        colorSchemeOverride: override,
      );
      expect(theme.colorScheme.primary, Colors.pink);
    });

    test('accepts custom font family', () {
      final theme = AppTheme.build(
        preset: DesignPreset.defaultPreset,
        fontFamily: 'Inter',
      );
      expect(theme.textTheme.bodyMedium?.fontFamily, 'Inter');
    });
  });

  group('AppColors', () {
    test('all preset files define light and dark color sets', () {
      expect(DefaultPreset.light, isNotNull);
      expect(DefaultPreset.dark, isNotNull);
      expect(VercelPreset.light, isNotNull);
      expect(VercelPreset.dark, isNotNull);
      expect(AirbnbPreset.light, isNotNull);
      expect(AirbnbPreset.dark, isNotNull);
      expect(ApplePreset.light, isNotNull);
      expect(ApplePreset.dark, isNotNull);
      expect(SpotifyPreset.light, isNotNull);
      expect(SpotifyPreset.dark, isNotNull);
      expect(VibrantPreset.light, isNotNull);
      expect(VibrantPreset.dark, isNotNull);
      expect(HighContrastPreset.light, isNotNull);
      expect(HighContrastPreset.dark, isNotNull);
      expect(StarbucksPreset.light, isNotNull);
      expect(StarbucksPreset.dark, isNotNull);
      expect(LinearPreset.light, isNotNull);
      expect(LinearPreset.dark, isNotNull);
      expect(NotionPreset.light, isNotNull);
      expect(NotionPreset.dark, isNotNull);
      expect(MongodbPreset.light, isNotNull);
      expect(MongodbPreset.dark, isNotNull);
      expect(RaycastPreset.light, isNotNull);
      expect(RaycastPreset.dark, isNotNull);
    });

    test('AllAppColors has lerp method', () {
      final light = DefaultPreset.light;
      final dark = DefaultPreset.dark;
      final mid = light.lerp(dark, 0.5);
      expect(mid.primary, isNotNull);
    });
  });
}
