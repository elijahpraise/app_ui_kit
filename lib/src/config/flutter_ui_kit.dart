import 'flutter_ui_kit_config.dart';
import 'flutter_ui_kit_theme_bundle.dart';

/// Global initializer for configuring the UI kit in host applications.
class FlutterUiKit {
  FlutterUiKit._();

  static FlutterUiKitConfig _config = const FlutterUiKitConfig();
  static bool _isInitialized = false;

  /// Current runtime configuration.
  static FlutterUiKitConfig get config => _config;

  /// Whether [initialize] has been called.
  static bool get isInitialized => _isInitialized;

  /// Initializes or replaces package configuration.
  static void initialize({required FlutterUiKitConfig config}) {
    _config = config;
    _isInitialized = true;
  }

  /// Updates current configuration based on the existing value.
  static void update(
    FlutterUiKitConfig Function(FlutterUiKitConfig current) updater,
  ) {
    _config = updater(_config);
    _isInitialized = true;
  }

  /// Resets configuration back to defaults.
  static void reset() {
    _config = const FlutterUiKitConfig();
    _isInitialized = false;
  }

  /// Resolved light/dark themes and theme mode for app-level wiring.
  static FlutterUiKitThemeBundle get themes => _config.toThemeBundle();
}
