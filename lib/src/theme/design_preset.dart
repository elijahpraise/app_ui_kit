enum DesignPreset {
  defaultPreset,
  vercel,
  airbnb,
  apple,
  spotify,
  vibrant,
  highContrast,
  starbucks,
  linear,
  notion,
  mongodb,
  raycast;
}

extension DesignPresetLabel on DesignPreset {
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

