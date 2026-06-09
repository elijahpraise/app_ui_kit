import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:app_ui_kit/app_ui_kit.dart';

void main() {
  setUp(() {
    AppUiKit.reset();
  });
  test('HeadlessValueController updates and resets value', () {
    final controller = HeadlessValueController<int>(2);

    controller.update((value) => value + 3);
    expect(controller.value, 5);

    controller.reset();
    expect(controller.value, 2);
  });

  test('ToggleController handles on/off/toggle', () {
    final controller = ToggleController();

    expect(controller.value, false);
    controller.on();
    expect(controller.value, true);
    controller.toggle();
    expect(controller.value, false);
    controller.off();
    expect(controller.value, false);
  });

  testWidgets('HeadlessBuilder rebuilds when controller changes', (tester) async {
    final controller = ToggleController();

    await tester.pumpWidget(
      MaterialApp(
        home: HeadlessBuilder<bool>(
          controller: controller,
          builder: (_, value, __, ___) => Text(value ? 'on' : 'off'),
        ),
      ),
    );

    expect(find.text('off'), findsOneWidget);

    controller.toggle();
    await tester.pump();

    expect(find.text('on'), findsOneWidget);
  });

  test('AppUiKit initializes and resolves app themes', () {
    final config = AppUiKitConfig(
      fontFamily: 'Inter',
      preset: AppUiKitPreset.vibrant,
      themeMode: ThemeMode.dark,
      uiTokens: const {
        'borderRadius': 12.0,
      },
    );

    AppUiKit.initialize(config: config);

    expect(AppUiKit.isInitialized, isTrue);
    expect(AppUiKit.config.fontFamily, 'Inter');
    expect(AppUiKit.config.token<double>('borderRadius'), 12.0);

    final themes = AppUiKit.themes;
    expect(themes.themeMode, ThemeMode.dark);
    expect(themes.lightTheme.textTheme.bodyMedium?.fontFamily, 'Inter');
    expect(themes.darkTheme.textTheme.bodyMedium?.fontFamily, 'Inter');
  });

  test('AppUiKitConfig respects explicit light and dark theme overrides', () {
    final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.pink,
    );
    final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
    );

    final config = AppUiKitConfig(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
    );

    expect(config.resolvedLightTheme.scaffoldBackgroundColor, Colors.pink);
    expect(config.resolvedDarkTheme.scaffoldBackgroundColor, Colors.black);
  });

  test('AppUiKit reset clears initialization state', () {
    AppUiKit.initialize(
      config: const AppUiKitConfig(fontFamily: 'Outfit'),
    );
    expect(AppUiKit.isInitialized, isTrue);

    AppUiKit.reset();

    expect(AppUiKit.isInitialized, isFalse);
    expect(AppUiKit.config.fontFamily, isNull);
    expect(AppUiKit.config.themeMode, ThemeMode.system);
  });

  test('Spotify preset is available and initializes correctly', () {
    AppUiKit.initialize(
      config: const AppUiKitConfig(
        preset: AppUiKitPreset.spotify,
        themeMode: ThemeMode.dark,
      ),
    );

    expect(AppUiKit.config.preset, AppUiKitPreset.spotify);
    final themes = AppUiKit.themes;
    expect(themes.themeMode, ThemeMode.dark);
    expect(themes.darkTheme.visualDensity, VisualDensity.compact);
    expect(themes.darkTheme.cardTheme.color, const Color(0xFF181818));
  });

  test('getdesign presets resolve deterministic light and dark color schemes', () {
    const presetSeeds = <AppUiKitPreset, ({Color light, Color dark})>{
      AppUiKitPreset.vercel: (
        light: Color(0xFF000000),
        dark: Color(0xFFFFFFFF),
      ),
      AppUiKitPreset.airbnb: (
        light: Color(0xFFFF385C),
        dark: Color(0xFFFF385C),
      ),
      AppUiKitPreset.apple: (
        light: Color(0xFF007AFF),
        dark: Color(0xFF007AFF),
      ),
      AppUiKitPreset.spotify: (
        light: Color(0xFF1ED760),
        dark: Color(0xFF1ED760),
      ),
      AppUiKitPreset.starbucks: (
        light: Color(0xFF006241),
        dark: Color(0xFF1E3932),
      ),
      AppUiKitPreset.linear: (
        light: Color(0xFF5E6AD2),
        dark: Color(0xFF5E6AD2),
      ),
      AppUiKitPreset.notion: (
        light: Color(0xFF0075DE),
        dark: Color(0xFF0075DE),
      ),
      AppUiKitPreset.mongodb: (
        light: Color(0xFF00ED64),
        dark: Color(0xFF00ED64),
      ),
      AppUiKitPreset.raycast: (
        light: Color(0xFF0D0D0D),
        dark: Color(0xFFF4F4F6),
      ),
    };

    for (final entry in presetSeeds.entries) {
      final config = AppUiKitConfig(preset: entry.key);

      final expectedLight = ColorScheme.fromSeed(
        seedColor: entry.value.light,
        brightness: Brightness.light,
      );
      expect(config.resolvedLightTheme.colorScheme.primary, expectedLight.primary);

      final expectedDark = ColorScheme.fromSeed(
        seedColor: entry.value.dark,
        brightness: Brightness.dark,
      );
      expect(config.resolvedDarkTheme.colorScheme.primary, expectedDark.primary);
    }
  });
}
