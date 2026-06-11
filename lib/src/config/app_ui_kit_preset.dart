import '../theme/design_preset.dart';

/// Preset theme flavors matching [DesignPreset].
///
/// Maps 1:1 to [DesignPreset] values used by [AppTheme.build].
/// Use [toDesignPreset] to convert when calling theme APIs directly.
enum AppUiKitPreset {
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

/// Provides conversion from [AppUiKitPreset] to the core [DesignPreset].
extension AppUiKitPresetX on AppUiKitPreset {
  /// Converts this config-level preset to the equivalent [DesignPreset]
  /// used by [AppTheme.build] and the component library.
  DesignPreset toDesignPreset() {
    return switch (this) {
      AppUiKitPreset.baseline => DesignPreset.defaultPreset,
      AppUiKitPreset.vercel => DesignPreset.vercel,
      AppUiKitPreset.airbnb => DesignPreset.airbnb,
      AppUiKitPreset.apple => DesignPreset.apple,
      AppUiKitPreset.spotify => DesignPreset.spotify,
      AppUiKitPreset.vibrant => DesignPreset.vibrant,
      AppUiKitPreset.highContrast => DesignPreset.highContrast,
      AppUiKitPreset.starbucks => DesignPreset.starbucks,
      AppUiKitPreset.linear => DesignPreset.linear,
      AppUiKitPreset.notion => DesignPreset.notion,
      AppUiKitPreset.mongodb => DesignPreset.mongodb,
      AppUiKitPreset.raycast => DesignPreset.raycast,
    };
  }
}
