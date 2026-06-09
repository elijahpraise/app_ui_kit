import 'package:flutter/material.dart';

import '../flutter_ui_kit.dart' as cfg;
import 'theme/design_preset.dart';
import 'theme/themes/app_theme.dart';

class FlutterUIKit extends StatefulWidget {
  const FlutterUIKit({
    super.key,
    this.preset = DesignPreset.defaultPreset,
    this.lightThemeOverride,
    this.darkThemeOverride,
    this.useMaterial3 = true,
    required this.child,
  });

  final DesignPreset preset;
  final ThemeData? lightThemeOverride;
  final ThemeData? darkThemeOverride;
  final bool useMaterial3;
  final Widget child;

  static FlutterUIKitState? of(BuildContext context) {
    return context.findAncestorStateOfType<FlutterUIKitState>();
  }

  static FlutterUIKitConfig? maybeConfigOf(BuildContext context) {
    return context.findAncestorWidgetOfExactType<FlutterUIKit>()?.toConfig();
  }

  FlutterUIKitConfig toConfig() {
    return FlutterUIKitConfig(
      preset: preset,
      lightTheme: lightThemeOverride,
      darkTheme: darkThemeOverride,
      useMaterial3: useMaterial3,
    );
  }

  @override
  State<FlutterUIKit> createState() => FlutterUIKitState();
}

class FlutterUIKitConfig {
  const FlutterUIKitConfig({
    this.preset = DesignPreset.defaultPreset,
    this.lightTheme,
    this.darkTheme,
    this.useMaterial3 = true,
  });

  final DesignPreset preset;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final bool useMaterial3;

  ThemeData resolveLightTheme() {
    return lightTheme ??
        AppTheme.build(preset: preset, brightness: Brightness.light);
  }

  ThemeData resolveDarkTheme() {
    return darkTheme ??
        AppTheme.build(preset: preset, brightness: Brightness.dark);
  }
}

class FlutterUIKitState extends State<FlutterUIKit> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

extension FlutterUIKitContext on BuildContext {
  FlutterUIKitConfig get uiKitConfig {
    final config = FlutterUIKit.maybeConfigOf(this);
    if (config != null) return config;
    final cfgConfig = cfg.FlutterUiKit.config;
    return FlutterUIKitConfig(
      preset: DesignPreset.defaultPreset,
      lightTheme: cfgConfig.lightTheme,
      darkTheme: cfgConfig.darkTheme,
    );
  }
}
