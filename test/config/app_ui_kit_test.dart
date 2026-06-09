import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:app_ui_kit/app_ui_kit.dart';

void main() {
  setUp(() {
    AppUiKit.reset();
  });

  group('AppUiKitConfig', () {
    test('creates with defaults', () {
      const config = AppUiKitConfig();
      expect(config.preset, AppUiKitPreset.baseline);
      expect(config.themeMode, ThemeMode.system);
      expect(config.fontFamily, isNull);
    });

    test('accepts custom font family', () {
      const config = AppUiKitConfig(fontFamily: 'Inter');
      expect(config.fontFamily, 'Inter');
    });

    test('resolves light theme', () {
      const config = AppUiKitConfig();
      final theme = config.resolvedLightTheme;
      expect(theme.brightness, Brightness.light);
    });

    test('resolves dark theme', () {
      const config = AppUiKitConfig();
      final theme = config.resolvedDarkTheme;
      expect(theme.brightness, Brightness.dark);
    });

    test('respects light theme override', () {
      final overridden = ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.amber,
      );
      final config = AppUiKitConfig(lightTheme: overridden);
      expect(config.resolvedLightTheme.scaffoldBackgroundColor, Colors.amber);
    });

    test('respects dark theme override', () {
      final overridden = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.purple,
      );
      final config = AppUiKitConfig(darkTheme: overridden);
      expect(config.resolvedDarkTheme.scaffoldBackgroundColor, Colors.purple);
    });

    test('copyWith updates fields', () {
      const config = AppUiKitConfig(fontFamily: 'Inter');
      final updated = config.copyWith(fontFamily: 'Roboto');
      expect(updated.fontFamily, 'Roboto');
      expect(config.fontFamily, 'Inter');
    });

    test('copyWith keeps unchanged fields', () {
      const config = AppUiKitConfig(fontFamily: 'Inter');
      final updated = config.copyWith();
      expect(updated.fontFamily, 'Inter');
    });

    test('toThemeBundle returns resolved themes', () {
      final config = AppUiKitConfig(
        lightTheme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.orange,
        ),
        themeMode: ThemeMode.light,
      );
      final bundle = config.toThemeBundle();
      expect(bundle.themeMode, ThemeMode.light);
      expect(bundle.lightTheme.scaffoldBackgroundColor, Colors.orange);
    });

    test('uiTokens stores and retrieves values', () {
      const config = AppUiKitConfig(uiTokens: {
        'borderRadius': 12.0,
        'darkMode': true,
      });
      expect(config.token<double>('borderRadius'), 12.0);
      expect(config.token<bool>('darkMode'), isTrue);
    });

    test('uiTokens returns null for missing key', () {
      const config = AppUiKitConfig();
      expect(config.token<String>('missing'), isNull);
    });

    test('themeBuilder is called when set', () {
      final config = AppUiKitConfig(
        themeBuilder: (brightness, cfg) {
          return (brightness == Brightness.light
                  ? ThemeData.light()
                  : ThemeData.dark())
              .copyWith(
            scaffoldBackgroundColor: Colors.teal,
          );
        },
      );
      expect(config.resolvedLightTheme.scaffoldBackgroundColor, Colors.teal);
      expect(config.resolvedDarkTheme.scaffoldBackgroundColor, Colors.teal);
    });
  });

  group('AppUiKit', () {
    test('is not initialized by default', () {
      expect(AppUiKit.isInitialized, isFalse);
    });

    test('initialize sets config', () {
      AppUiKit.initialize(
        config: const AppUiKitConfig(fontFamily: 'Inter'),
      );
      expect(AppUiKit.isInitialized, isTrue);
      expect(AppUiKit.config.fontFamily, 'Inter');
    });

    test('update can modify config', () {
      AppUiKit.initialize(
        config: const AppUiKitConfig(),
      );
      AppUiKit.update((c) => c.copyWith(fontFamily: 'Updated'));
      expect(AppUiKit.config.fontFamily, 'Updated');
    });

    test('reset clears configuration', () {
      AppUiKit.initialize(
        config: const AppUiKitConfig(fontFamily: 'Inter'),
      );
      AppUiKit.reset();
      expect(AppUiKit.isInitialized, isFalse);
      expect(AppUiKit.config.fontFamily, isNull);
    });

    test('themes returns theme bundle after init', () {
      AppUiKit.initialize(
        config: const AppUiKitConfig(themeMode: ThemeMode.dark),
      );
      final themes = AppUiKit.themes;
      expect(themes.themeMode, ThemeMode.dark);
      expect(themes.darkTheme.brightness, Brightness.dark);
    });
  });

  group('AppUiKitPreset', () {
    test('baseline resolves without error', () {
      const config = AppUiKitConfig(preset: AppUiKitPreset.baseline);
      expect(config.resolvedLightTheme, isNotNull);
      expect(config.resolvedDarkTheme, isNotNull);
    });

    test('all presets resolve light and dark themes', () {
      for (final preset in AppUiKitPreset.values) {
        final config = AppUiKitConfig(preset: preset);
        expect(config.resolvedLightTheme, isNotNull);
        expect(config.resolvedDarkTheme, isNotNull);
      }
    });
  });
}
