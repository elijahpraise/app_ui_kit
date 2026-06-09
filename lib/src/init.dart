import 'package:flutter/material.dart';

import '../flutter_ui_kit.dart' as cfg;
import 'theme/design_preset.dart';
import 'theme/themes/app_theme.dart';

/// Root widget that provides theming and configuration to the widget subtree.
class FlutterUIKit extends StatefulWidget {
  /// Creates a [FlutterUIKit] wrapping [child] with the given theme configuration.
  const FlutterUIKit({
    super.key,
    this.preset = DesignPreset.defaultPreset,
    this.lightThemeOverride,
    this.darkThemeOverride,
    this.useMaterial3 = true,
    required this.child,
  });

  /// The visual preset defining default theme behavior.
  final DesignPreset preset;
  /// Optional full light theme used instead of the preset default.
  final ThemeData? lightThemeOverride;
  /// Optional full dark theme used instead of the preset default.
  final ThemeData? darkThemeOverride;
  /// Whether to use Material 3 theming.
  final bool useMaterial3;
  /// The widget to wrap with the configured theme.
  final Widget child;

  /// Returns the nearest [FlutterUIKitState] ancestor, or null.
  static FlutterUIKitState? of(BuildContext context) {
    return context.findAncestorStateOfType<FlutterUIKitState>();
  }

  /// Returns the [FlutterUIKitConfig] from the nearest [FlutterUIKit] ancestor, or null.
  static FlutterUIKitConfig? maybeConfigOf(BuildContext context) {
    return context.findAncestorWidgetOfExactType<FlutterUIKit>()?.toConfig();
  }

  /// Converts this widget's properties into a [FlutterUIKitConfig].
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

/// Immutable configuration extracted from [FlutterUIKit].
class FlutterUIKitConfig {
  /// Creates a [FlutterUIKitConfig] with the given values.
  const FlutterUIKitConfig({
    this.preset = DesignPreset.defaultPreset,
    this.lightTheme,
    this.darkTheme,
    this.useMaterial3 = true,
  });

  /// The visual preset used for theme generation.
  final DesignPreset preset;
  /// Optional override for the light theme.
  final ThemeData? lightTheme;
  /// Optional override for the dark theme.
  final ThemeData? darkTheme;
  /// Whether to use Material 3 theming.
  final bool useMaterial3;

  /// Resolves the light theme from overrides or the preset builder.
  ThemeData resolveLightTheme() {
    return lightTheme ??
        AppTheme.build(preset: preset, brightness: Brightness.light);
  }

  /// Resolves the dark theme from overrides or the preset builder.
  ThemeData resolveDarkTheme() {
    return darkTheme ??
        AppTheme.build(preset: preset, brightness: Brightness.dark);
  }
}

/// State class for [FlutterUIKit] that holds the current theme configuration.
class FlutterUIKitState extends State<FlutterUIKit> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Extension on [BuildContext] for convenient access to [FlutterUIKitConfig].
extension FlutterUIKitContext on BuildContext {
  /// Returns the nearest [FlutterUIKitConfig] from the widget tree or global defaults.
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
