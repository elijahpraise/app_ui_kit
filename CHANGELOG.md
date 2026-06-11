## 0.0.1+3

* Added library-level doc comment to `app_ui_kit.dart`
* Added private constructors to `FlutterDialogHelper` and `FlutterModalBottomSheet` to suppress implicit public constructors
* Documentation coverage now at 100% (verified via `public_member_api_docs` lint)

## 0.0.1+2

* Removed `flutter_hooks` dependency — `PasswordField` and `ExpansionTileV1` migrated from `HookWidget` to `StatefulWidget`/`StatelessWidget` with plain `setState`
* `_SearchBottomSheetContent` in `SearchInputField` refactored from hooks to `StatefulWidget` with `onChanged` callback
* Added `///` documentation to all 145 previously undocumented public APIs across the library (verified via `public_member_api_docs` lint)
* `ExpansionTileV1` converted to `StatelessWidget` — no longer tracks expanded state

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
