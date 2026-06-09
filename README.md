# flutter_ui_kit

A comprehensive Flutter UI kit with theming, component library, design presets, headless state management, and Google Fonts integration.

## Features

### 🎨 12 Design Presets
Quickly theme your app with brand-inspired presets: `Default`, `Vercel`, `Airbnb`, `Apple`, `Spotify`, `Vibrant`, `High Contrast`, `Starbucks`, `Linear`, `Notion`, `MongoDB`, and `Raycast`. Each preset defines colors, typography, and border radii — applied automatically to 30+ Material sub-themes.

### 🧩 30+ Widget Components
- **App Bars:** `AppBarV1`, `TabBarV1`, `PersistentHeaderV1`
- **Buttons:** `AppButton` (with icon factory), `AppOutlineButton`, `AppTextButton`
- **Inputs:** `BaseTextField`, `InputField`, `PasswordField`, `PhoneField`, `SearchInputField`, `SearchFeatureField` + `Validators` utility
- **Dialogs:** `ActionDialog`, `BottomSheetSelectContent`, `ToastV1`
- **Frames:** `IconFrame`, `ListFrame`, `ProfileFrame`, `ScreenFrame`
- **Scaffolds:** `BaseScaffold`, `ScaffoldV1`, `LoadingOverlayV1`
- **States:** `LoadingIndicator`, `LoadingShimmer`, `InfoDisplay`
- **Custom Widgets:** `CustomIcon`, `DividerV1`, `Dot`, `ExpansionTileV1`, `HyperLinkText`, `InitialsDisplay`, `ListTileV1`, `PasswordStrengthChecker`

All adaptive widgets automatically render Material or Cupertino variants based on platform.

### 🧠 Headless State Management
Lightweight `ChangeNotifier`-based state management with `HeadlessValueController`, `ToggleController`, and `HeadlessBuilder` widget.

### 🛠 Helpers
`DateTimeHelper`, `DialogHelper`, `InteractionHelper`, `SliverHelper`, `SnackBarHelper`, `ToastHelper`.

### 🔤 Google Fonts Integration
When a `fontFamily` is provided (e.g., `'Inter'`, `'Roboto'`), the theme builder automatically resolves it via `GoogleFonts.getFont()`. Works with any Google Font — no manual font asset setup required. System fonts (`.SF Pro Display`, `Airbnb Cereal`) fall back gracefully.

### 🧪 162 Passing Tests
Full test coverage across all components, presets, themes, helpers, and controllers.

## Getting started

Add `flutter_ui_kit` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_ui_kit:
    path: path/to/flutter_ui_kit
```

Requires Dart SDK `^3.7.0` and Flutter `>=1.17.0`.

## Usage

### Quick start with a design preset

```dart
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.build(preset: DesignPreset.apple),
      home: const HomeScreen(),
    );
  }
}
```

### Using the FlutterUIKit widget

```dart
FlutterUIKit(
  preset: DesignPreset.defaultPreset,
  child: MaterialApp.router(...),
)
```

### Using the config system

```dart
FlutterUiKit.initialize(
  config: FlutterUiKitConfig(
    preset: FlutterUiKitPreset.spotify,
    fontFamily: 'Inter',
  ),
);
```

### Using components

```dart
AppButton(
  text: 'Get Started',
  type: AppButtonType.primary,
  onTap: () {},
)

ActionDialog(
  title: 'Confirm',
  subtitle: 'Are you sure?',
  primaryText: 'Yes',
  secondaryText: 'No',
  onPrimary: () => print('Confirmed'),
  onSecondary: () => print('Cancelled'),
)

BaseTextField(
  hintText: 'Enter your email',
  labelText: 'Email',
  prefixIcon: Icon(Icons.email_outlined),
)
```

## Components

| Category | Widgets |
|---|---|
| App Bars | `AppBarV1`, `TabBarV1`, `PersistentHeaderV1` |
| Buttons | `AppButton`, `AppOutlineButton`, `AppTextButton` |
| Inputs | `BaseTextField`, `InputField`, `PasswordField`, `PhoneField`, `SearchInputField`, `SearchFeatureField` |
| Dialogs | `ActionDialog`, `BottomSheetSelectContent`, `ToastV1` |
| Frames | `IconFrame`, `ListFrame`, `ProfileFrame`, `ScreenFrame` |
| Scaffolds | `BaseScaffold`, `ScaffoldV1`, `LoadingOverlayV1` |
| States | `LoadingIndicator`, `LoadingShimmer`, `InfoDisplay` |
| Custom | `CustomIcon`, `DividerV1`, `Dot`, `ExpansionTileV1`, `HyperLinkText`, `InitialsDisplay`, `ListTileV1`, `PasswordStrengthChecker` |

## Presets

| Preset | Font Family | Seed Color |
|---|---|---|
| Default | System | `#4F46E5` |
| Vercel | `Inter` | `#000000` |
| Airbnb | `Airbnb Cereal` | `#FF385C` |
| Apple | `.SF Pro Display` | `#007AFF` |
| Spotify | `Inter` | `#1ED760` |
| Vibrant | System | `#7C3AED` |
| High Contrast | System | `#000000` |
| Starbucks | System | `#006241` |
| Linear | `Inter` | `#5E6AD2` |
| Notion | System | `#0075DE` |
| MongoDB | System | `#00ED64` |
| Raycast | System | `#FFFFFF` |

## Additional information

- Run tests: `flutter test`
- Analyze: `flutter analyze`
- Example app available in the `example/widget_preview/` directory
