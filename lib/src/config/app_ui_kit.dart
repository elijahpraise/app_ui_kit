import 'app_ui_kit_config.dart';
import 'app_ui_kit_theme_bundle.dart';

/// Global initializer for configuring the UI kit in host applications.
class AppUiKit {
  /// Private constructor to prevent external instantiation.
  AppUiKit._();

  static AppUiKitConfig _config = const AppUiKitConfig();
  static bool _isInitialized = false;

  /// Current runtime configuration.
  static AppUiKitConfig get config => _config;

  /// Whether [initialize] has been called.
  static bool get isInitialized => _isInitialized;

  /// Initializes or replaces package configuration.
  static void initialize({required AppUiKitConfig config}) {
    _config = config;
    _isInitialized = true;
  }

  /// Updates current configuration based on the existing value.
  static void update(
    AppUiKitConfig Function(AppUiKitConfig current) updater,
  ) {
    _config = updater(_config);
    _isInitialized = true;
  }

  /// Resets configuration back to defaults.
  static void reset() {
    _config = const AppUiKitConfig();
    _isInitialized = false;
  }

  /// Resolved light/dark themes and theme mode for app-level wiring.
  static AppUiKitThemeBundle get themes => _config.toThemeBundle();
}
