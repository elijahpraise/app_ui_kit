import 'package:flutter/material.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

void main() {
  AppUiKit.initialize(
    config: const AppUiKitConfig(
      preset: AppUiKitPreset.baseline,
      themeMode: ThemeMode.light,
    ),
  );
  runApp(const AppUiKitExample());
}

class AppUiKitExample extends StatelessWidget {
  const AppUiKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App UI Kit Example',
      theme: AppUiKit.themes.lightTheme,
      darkTheme: AppUiKit.themes.darkTheme,
      themeMode: AppUiKit.themes.themeMode,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.$token;
    return BaseScaffold(
      appBar: AppBarV1(title: const Text('App UI Kit')),
      body: ScreenFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Widgets', style: tokens.textStyle.heading2),
            const SizedBox(height: 8),
            _SectionCard(
              label: 'Buttons',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  AppButton(
                    text: 'Primary',
                    onTap: () {},
                    type: AppButtonType.primary,
                  ),
                  AppButton(
                    text: 'Loading',
                    onTap: () {},
                    type: AppButtonType.primary,
                    loading: true,
                  ),
                  AppOutlineButton(
                    text: 'Outline',
                    onTap: () {},
                    type: AppButtonType.secondary,
                  ),
                  AppTextButton(
                    text: 'Text',
                    onTap: () {},
                    type: AppButtonType.primary,
                  ),
                ],
              ),
            ),
            _SectionCard(
              label: 'Inputs',
              child: Column(
                children: [
                  InputField(label: 'Email', validator: Validators.email),
                  const SizedBox(height: 12),
                  const PasswordField(labelText: 'Password'),
                  const SizedBox(height: 12),
                  PhoneField(
                    labelText: 'Phone',
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            _SectionCard(
              label: 'Custom Widgets',
              child: Column(
                children: [
                  ListTileV1(
                    leading: const Icon(Icons.star),
                    title: const Text('List Tile'),
                    subtitle: const Text('With subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const DividerV1(),
                  ExpansionTileV1(
                    title: const Text('Expansion Tile'),
                    children: [
                      const ListTile(title: Text('Expanded content')),
                      const ListTile(title: Text('More content')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  HyperLinkText(
                    text: 'Tap this hyperlink',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  const InitialsDisplay(name: 'John Doe', size: 48),
                  const SizedBox(height: 8),
                  IconFrame(size: 48, icon: const Icon(Icons.home)),
                  const SizedBox(height: 8),
                  const ProfileFrame(size: 64),
                ],
              ),
            ),
            _SectionCard(
              label: 'State Displays',
              child: Column(
                children: [
                  const LoadingIndicator(),
                  const SizedBox(height: 12),
                  InfoDisplay(
                    iconData: Icons.inbox_outlined,
                    title: 'No items yet',
                    subtitle: 'Your inbox is empty',
                  ),
                ],
              ),
            ),
            _SectionCard(
              label: 'Dialogs & Helpers',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  AppOutlineButton(
                    text: 'Show Dialog',
                    onTap: () => DialogHelper.showDialog(
                      context: context,
                      builder: (_) => const ActionDialog(
                        title: 'Confirm',
                        subtitle: 'Are you sure?',
                        primaryText: 'Yes',
                      ),
                    ),
                  ),
                  AppOutlineButton(
                    text: 'Show SnackBar',
                    onTap: () => SnackBarHelper.showInfo(
                      context,
                      'Info snackbar',
                    ),
                  ),
                  AppOutlineButton(
                    text: 'Show Toast',
                    onTap: () => ToastHelper.showInfo(
                      context,
                      'This is a toast',
                    ),
                  ),
                ],
              ),
            ),
            _SectionCard(
              label: 'Headless Pattern',
              child: _HeadlessExample(),
            ),
            _SectionCard(
              label: 'Design Presets',
              child: _PresetSelector(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String label;
  final Widget child;

  const _SectionCard({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final tokens = context.$token;
    return ListFrame(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: tokens.textStyle.heading4),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _HeadlessExample extends StatefulWidget {
  @override
  State<_HeadlessExample> createState() => _HeadlessExampleState();
}

class _HeadlessExampleState extends State<_HeadlessExample> {
  final _toggleController = ToggleController();

  @override
  void dispose() {
    _toggleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HeadlessBuilder<bool>(
      controller: _toggleController,
      builder: (context, value, controller, child) => Row(
        children: [
          const Text('Toggle me'),
          const Spacer(),
          Switch(
            value: value,
            onChanged: (_) => _toggleController.toggle(),
          ),
        ],
      ),
    );
  }
}

class _PresetSelector extends StatelessWidget {
  final List<(String, AppUiKitPreset)> presets = const [
    ('Baseline', AppUiKitPreset.baseline),
    ('Vercel', AppUiKitPreset.vercel),
    ('Airbnb', AppUiKitPreset.airbnb),
    ('Apple', AppUiKitPreset.apple),
    ('Spotify', AppUiKitPreset.spotify),
    ('Starbucks', AppUiKitPreset.starbucks),
    ('Linear', AppUiKitPreset.linear),
    ('Notion', AppUiKitPreset.notion),
    ('MongoDB', AppUiKitPreset.mongodb),
    ('Raycast', AppUiKitPreset.raycast),
    ('Vibrant', AppUiKitPreset.vibrant),
    ('High Contrast', AppUiKitPreset.highContrast),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: presets.map((preset) {
        return ActionChip(
          label: Text(preset.$1, style: const TextStyle(fontSize: 11)),
          onPressed: () {
            AppUiKit.update(
              (current) => current.copyWith(preset: preset.$2),
            );
          },
        );
      }).toList(),
    );
  }
}
