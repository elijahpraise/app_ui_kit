import 'package:flutter/foundation.dart';

/// Whether the current platform is iOS or macOS, indicating that
/// Cupertino-style widgets should be used.
bool get isCupertino =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.macOS;
