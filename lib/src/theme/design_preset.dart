/// Design presets that define color palettes, typography, and radii.
///
/// These are the core theme identifiers consumed by [AppTheme.build].
/// For the equivalent config-layer enum see [AppUiKitPreset].
///
/// {@category Theme}
enum DesignPreset {
  /// Balanced defaults suitable for most products.
  defaultPreset,

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
  raycast;
}

/// Provides human-readable labels for each [DesignPreset] value.
extension DesignPresetLabel on DesignPreset {
  /// A human-readable label for this preset (e.g. "High Contrast").
  String get label {
    return switch (this) {
      DesignPreset.defaultPreset => 'Default',
      DesignPreset.vercel => 'Vercel',
      DesignPreset.airbnb => 'Airbnb',
      DesignPreset.apple => 'Apple',
      DesignPreset.spotify => 'Spotify',
      DesignPreset.vibrant => 'Vibrant',
      DesignPreset.highContrast => 'High Contrast',
      DesignPreset.starbucks => 'Starbucks',
      DesignPreset.linear => 'Linear',
      DesignPreset.notion => 'Notion',
      DesignPreset.mongodb => 'MongoDB',
      DesignPreset.raycast => 'Raycast',
    };
  }
}
