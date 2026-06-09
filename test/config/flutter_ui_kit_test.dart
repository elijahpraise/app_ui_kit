import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/flutter_ui_kit.dart';

void main() {
  setUp(() {
    FlutterUiKit.reset();
  });

  group('FlutterUiKitConfig', () {
    test('creates with defaults', () {
      const config = FlutterUiKitConfig();
      expect(config.preset, FlutterUiKitPreset.baseline);
      expect(config.themeMode, ThemeMode.system);
      expect(config.fontFamily, isNull);
    });

    test('accepts custom font family', () {
      const config = FlutterUiKitConfig(fontFamily: 'Inter');
      expect(config.fontFamily, 'Inter');
    });

    test('resolves light theme', () {
      const config = FlutterUiKitConfig();
      final theme = config.resolvedLightTheme;
      expect(theme.brightness, Brightness.light);
    });

    test('resolves dark theme', () {
      const config = FlutterUiKitConfig();
      final theme = config.resolvedDarkTheme;
      expect(theme.brightness, Brightness.dark);
    });

    test('respects light theme override', () {
      final overridden = ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.amber,
      );
      final config = FlutterUiKitConfig(lightTheme: overridden);
      expect(config.resolvedLightTheme.scaffoldBackgroundColor, Colors.amber);
    });

    test('respects dark theme override', () {
      final overridden = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.purple,
      );
      final config = FlutterUiKitConfig(darkTheme: overridden);
      expect(config.resolvedDarkTheme.scaffoldBackgroundColor, Colors.purple);
    });

    test('copyWith updates fields', () {
      const config = FlutterUiKitConfig(fontFamily: 'Inter');
      final updated = config.copyWith(fontFamily: 'Roboto');
      expect(updated.fontFamily, 'Roboto');
      expect(config.fontFamily, 'Inter');
    });

    test('copyWith keeps unchanged fields', () {
      const config = FlutterUiKitConfig(fontFamily: 'Inter');
      final updated = config.copyWith();
      expect(updated.fontFamily, 'Inter');
    });

    test('toThemeBundle returns resolved themes', () {
      final config = FlutterUiKitConfig(
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
      const config = FlutterUiKitConfig(uiTokens: {
        'borderRadius': 12.0,
        'darkMode': true,
      });
      expect(config.token<double>('borderRadius'), 12.0);
      expect(config.token<bool>('darkMode'), isTrue);
    });

    test('uiTokens returns null for missing key', () {
      const config = FlutterUiKitConfig();
      expect(config.token<String>('missing'), isNull);
    });

    test('themeBuilder is called when set', () {
      final config = FlutterUiKitConfig(
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

  group('FlutterUiKit', () {
    test('is not initialized by default', () {
      expect(FlutterUiKit.isInitialized, isFalse);
    });

    test('initialize sets config', () {
      FlutterUiKit.initialize(
        config: const FlutterUiKitConfig(fontFamily: 'Inter'),
      );
      expect(FlutterUiKit.isInitialized, isTrue);
      expect(FlutterUiKit.config.fontFamily, 'Inter');
    });

    test('update can modify config', () {
      FlutterUiKit.initialize(
        config: const FlutterUiKitConfig(),
      );
      FlutterUiKit.update((c) => c.copyWith(fontFamily: 'Updated'));
      expect(FlutterUiKit.config.fontFamily, 'Updated');
    });

    test('reset clears configuration', () {
      FlutterUiKit.initialize(
        config: const FlutterUiKitConfig(fontFamily: 'Inter'),
      );
      FlutterUiKit.reset();
      expect(FlutterUiKit.isInitialized, isFalse);
      expect(FlutterUiKit.config.fontFamily, isNull);
    });

    test('themes returns theme bundle after init', () {
      FlutterUiKit.initialize(
        config: const FlutterUiKitConfig(themeMode: ThemeMode.dark),
      );
      final themes = FlutterUiKit.themes;
      expect(themes.themeMode, ThemeMode.dark);
      expect(themes.darkTheme.brightness, Brightness.dark);
    });
  });

  group('FlutterUiKitPreset', () {
    test('baseline resolves without error', () {
      const config = FlutterUiKitConfig(preset: FlutterUiKitPreset.baseline);
      expect(config.resolvedLightTheme, isNotNull);
      expect(config.resolvedDarkTheme, isNotNull);
    });

    test('all presets resolve light and dark themes', () {
      for (final preset in FlutterUiKitPreset.values) {
        final config = FlutterUiKitConfig(preset: preset);
        expect(config.resolvedLightTheme, isNotNull);
        expect(config.resolvedDarkTheme, isNotNull);
      }
    });
  });
}
