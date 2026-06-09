import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/flutter_ui_kit.dart';

void main() {
  setUp(() {
    FlutterUiKit.reset();
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

  test('FlutterUiKit initializes and resolves app themes', () {
    final config = FlutterUiKitConfig(
      fontFamily: 'Inter',
      preset: FlutterUiKitPreset.vibrant,
      themeMode: ThemeMode.dark,
      uiTokens: const {
        'borderRadius': 12.0,
      },
    );

    FlutterUiKit.initialize(config: config);

    expect(FlutterUiKit.isInitialized, isTrue);
    expect(FlutterUiKit.config.fontFamily, 'Inter');
    expect(FlutterUiKit.config.token<double>('borderRadius'), 12.0);

    final themes = FlutterUiKit.themes;
    expect(themes.themeMode, ThemeMode.dark);
    expect(themes.lightTheme.textTheme.bodyMedium?.fontFamily, 'Inter');
    expect(themes.darkTheme.textTheme.bodyMedium?.fontFamily, 'Inter');
  });

  test('FlutterUiKitConfig respects explicit light and dark theme overrides', () {
    final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.pink,
    );
    final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
    );

    final config = FlutterUiKitConfig(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
    );

    expect(config.resolvedLightTheme.scaffoldBackgroundColor, Colors.pink);
    expect(config.resolvedDarkTheme.scaffoldBackgroundColor, Colors.black);
  });

  test('FlutterUiKit reset clears initialization state', () {
    FlutterUiKit.initialize(
      config: const FlutterUiKitConfig(fontFamily: 'Outfit'),
    );
    expect(FlutterUiKit.isInitialized, isTrue);

    FlutterUiKit.reset();

    expect(FlutterUiKit.isInitialized, isFalse);
    expect(FlutterUiKit.config.fontFamily, isNull);
    expect(FlutterUiKit.config.themeMode, ThemeMode.system);
  });

  test('Spotify preset is available and initializes correctly', () {
    FlutterUiKit.initialize(
      config: const FlutterUiKitConfig(
        preset: FlutterUiKitPreset.spotify,
        themeMode: ThemeMode.dark,
      ),
    );

    expect(FlutterUiKit.config.preset, FlutterUiKitPreset.spotify);
    final themes = FlutterUiKit.themes;
    expect(themes.themeMode, ThemeMode.dark);
    expect(themes.darkTheme.visualDensity, VisualDensity.compact);
    expect(themes.darkTheme.cardTheme.color, const Color(0xFF181818));
  });

  test('getdesign presets resolve deterministic light and dark color schemes', () {
    const presetSeeds = <FlutterUiKitPreset, ({Color light, Color dark})>{
      FlutterUiKitPreset.vercel: (
        light: Color(0xFF000000),
        dark: Color(0xFFFFFFFF),
      ),
      FlutterUiKitPreset.airbnb: (
        light: Color(0xFFFF385C),
        dark: Color(0xFFFF385C),
      ),
      FlutterUiKitPreset.apple: (
        light: Color(0xFF007AFF),
        dark: Color(0xFF007AFF),
      ),
      FlutterUiKitPreset.spotify: (
        light: Color(0xFF1ED760),
        dark: Color(0xFF1ED760),
      ),
      FlutterUiKitPreset.starbucks: (
        light: Color(0xFF006241),
        dark: Color(0xFF1E3932),
      ),
      FlutterUiKitPreset.linear: (
        light: Color(0xFF5E6AD2),
        dark: Color(0xFF5E6AD2),
      ),
      FlutterUiKitPreset.notion: (
        light: Color(0xFF0075DE),
        dark: Color(0xFF0075DE),
      ),
      FlutterUiKitPreset.mongodb: (
        light: Color(0xFF00ED64),
        dark: Color(0xFF00ED64),
      ),
      FlutterUiKitPreset.raycast: (
        light: Color(0xFF0D0D0D),
        dark: Color(0xFFF4F4F6),
      ),
    };

    for (final entry in presetSeeds.entries) {
      final config = FlutterUiKitConfig(preset: entry.key);

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
