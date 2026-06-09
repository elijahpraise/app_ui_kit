import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const WidgetPreviewApp());
}

class WidgetPreviewApp extends StatelessWidget {
  const WidgetPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
