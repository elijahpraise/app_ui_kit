import '../theme/design_preset.dart';

/// Preset theme flavors matching [DesignPreset].
///
/// Maps 1:1 to [DesignPreset] values used by [AppTheme.build].
/// Use [toDesignPreset] to convert when calling theme APIs directly.
enum FlutterUiKitPreset {
  /// Balanced defaults suitable for most products.
  baseline,

  /// Inspired by Vercel's minimal, geometric design language.
  vercel,

  /// Inspired by Airbnb's warm and rounded consumer UI language.
  airbnb,

  /// Inspired by Apple's San Francisco typography and clean surfaces.
  apple,

  /// Inspired by Spotify's green-on-dark, media-centric visual style.
  spotify,

  /// More saturated palettes and slightly denser visual rhythm.
  vibrant,

  /// Higher-contrast defaults for readability-forward interfaces.
  highContrast,

  /// Inspired by Starbucks' warm neutrals and layered green palette.
  starbucks,

  /// Inspired by Linear's precise dark interface and lavender accent.
  linear,

  /// Inspired by Notion's calm neutral canvas and blue accents.
  notion,

  /// Inspired by MongoDB's developer-focused green and dark surfaces.
  mongodb,

  /// Inspired by Raycast's utility-dark shell and crisp neutrals.
  raycast,
}

extension FlutterUiKitPresetX on FlutterUiKitPreset {
  /// Converts this config-level preset to the equivalent [DesignPreset]
  /// used by [AppTheme.build] and the component library.
  DesignPreset toDesignPreset() {
    return switch (this) {
      FlutterUiKitPreset.baseline => DesignPreset.defaultPreset,
      FlutterUiKitPreset.vercel => DesignPreset.vercel,
      FlutterUiKitPreset.airbnb => DesignPreset.airbnb,
      FlutterUiKitPreset.apple => DesignPreset.apple,
      FlutterUiKitPreset.spotify => DesignPreset.spotify,
      FlutterUiKitPreset.vibrant => DesignPreset.vibrant,
      FlutterUiKitPreset.highContrast => DesignPreset.highContrast,
      FlutterUiKitPreset.starbucks => DesignPreset.starbucks,
      FlutterUiKitPreset.linear => DesignPreset.linear,
      FlutterUiKitPreset.notion => DesignPreset.notion,
      FlutterUiKitPreset.mongodb => DesignPreset.mongodb,
      FlutterUiKitPreset.raycast => DesignPreset.raycast,
    };
  }
}
