# app_ui_kit

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
Lightweight `ChangeNotifier`-based state management with `HeadlessValueController`, `ToggleController`, and `HeadlessBuilder` widget. Zero external state management dependencies — no hooks, no providers, no blocs.

### 🛠 Helpers
`DateTimeHelper`, `DialogHelper`, `InteractionHelper`, `SliverHelper`, `SnackBarHelper`, `ToastHelper`.

### 🔤 Google Fonts Integration
When a `fontFamily` is provided (e.g., `'Inter'`, `'Roboto'`), the theme builder automatically resolves it via `GoogleFonts.getFont()`. Works with any Google Font — no manual font asset setup required. System fonts (`.SF Pro Display`, `Airbnb Cereal`) fall back gracefully.

### 🧪 180 Passing Tests
Full test coverage across all components, presets, themes, helpers, and controllers.

## Getting started

Add `app_ui_kit` to your `pubspec.yaml`:

```yaml
dependencies:
  app_ui_kit:
    path: path/to/app_ui_kit
```

Requires Dart SDK `^3.9.2` and Flutter `>=3.35.4`.

## Usage

### Using the config system (recommended)

```dart
import 'package:app_ui_kit/app_ui_kit.dart';

void main() {
  AppUiKit.initialize(
    config: AppUiKitConfig(
      preset: AppUiKitPreset.spotify,
      fontFamily: 'Inter',
    ),
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = AppUiKit.themes;
    return MaterialApp(
      theme: themes.lightTheme,
      darkTheme: themes.darkTheme,
      themeMode: themes.themeMode,
      home: const HomeScreen(),
    );
  }
}
```

### Quick start with a design preset

```dart
import 'package:app_ui_kit/app_ui_kit.dart';

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
| Scaffolds | `BaseScaffold`, `AppScaffold`, `LoadingOverlayV1` |
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
- Browse the example app in the `example/` directory to see all components in action:
  ```bash
  cd example && flutter run
  ```
