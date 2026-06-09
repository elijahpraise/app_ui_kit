import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

import '../widgets/app_bar_preview.dart';
import '../widgets/button_preview.dart';
import '../widgets/input_preview.dart';
import '../widgets/dialog_preview.dart';
import '../widgets/frame_preview.dart';
import '../widgets/scaffold_preview.dart';
import '../widgets/state_preview.dart';
import '../widgets/custom_preview.dart';
import '../widgets/helper_preview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DesignPreset _preset = DesignPreset.defaultPreset;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return FlutterUIKit(
      preset: _preset,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.build(
          preset: _preset,
          brightness: Brightness.light,
        ),
        darkTheme: AppTheme.build(
          preset: _preset,
          brightness: Brightness.dark,
        ),
        themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter UI Kit Preview'),
            actions: [
              IconButton(
                icon: Icon(_darkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => setState(() => _darkMode = !_darkMode),
                tooltip: 'Toggle theme',
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildPresetSelector(),
              const SizedBox(height: 16),
              const _CategoryCard(title: 'App Bars', child: AppBarPreview()),
              const _CategoryCard(title: 'Buttons', child: ButtonPreview()),
              const _CategoryCard(title: 'Inputs', child: InputPreview()),
              const _CategoryCard(title: 'Dialogs', child: DialogPreview()),
              const _CategoryCard(title: 'Frames', child: FramePreview()),
              const _CategoryCard(title: 'Scaffolds', child: ScaffoldPreview()),
              const _CategoryCard(title: 'States', child: StatePreview()),
              const _CategoryCard(title: 'Custom', child: CustomPreview()),
              const _CategoryCard(title: 'Helpers', child: HelperPreview()),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPresetSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Text('Preset:', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            DropdownButton<DesignPreset>(
              value: _preset,
              items: DesignPreset.values.map((p) {
                return DropdownMenuItem(value: p, child: Text(p.label));
              }).toList(),
              onChanged: (v) {
                if (v != null) setState(() => _preset = v);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const Divider(),
            child,
          ],
        ),
      ),
    );
  }
}
