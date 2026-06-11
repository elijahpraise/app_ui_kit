## 0.0.1+1

* Removed `FlutterUIKit` widget — use `AppUiKit.initialize()` instead
* `PasswordStrengthChecker` accepts custom `requirements` and optional `showRequirements` checklist
* Added `PasswordRequirement` class for defining custom password validation rules
* Increased button default sizes (padding, font size) for better visibility
* Cupertino buttons no longer have a fixed default height
* Removed `lints` dev dependency (conflict with `flutter_lints`)
* Updated README to reflect current API

## 0.0.1

* Initial release
* 12 design presets (Default, Vercel, Airbnb, Apple, Spotify, Vibrant, High Contrast, Starbucks, Linear, Notion, MongoDB, Raycast)
* 30+ widget components (app bars, buttons, inputs, dialogs, frames, scaffolds, states, custom widgets)
* Headless state management system (HeadlessValueController, ToggleController, HeadlessBuilder)
* Helper utilities (DateTime, Dialog, Interaction, Sliver, SnackBar, Toast)
* Theme system with 30+ Material sub-theme configurations
* AppTheme builder and FlutterUiKitConfig initialization
* Adaptive widgets with automatic Material/Cupertino platform detection
* Google Fonts integration — font families are automatically resolved via `GoogleFonts.getFont()`
* 162 passing tests
