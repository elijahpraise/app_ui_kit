import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../foundation/platform.dart';

/// A platform-aware scaffold that renders either a Material [Scaffold] or a
/// [CupertinoPageScaffold] depending on the current platform.
class BaseScaffold extends StatelessWidget {
  /// Creates a platform-aware [BaseScaffold].
  const BaseScaffold({
    super.key,
    this.appBar,
    this.body,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.persistentFooterButtons,
    this.persistentFooterAlignment,
    this.backgroundColor,
    this.brightness,
    this.systemNavigationBarColor,
  });

  /// An optional app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final Widget? body;

  /// An optional panel displayed from the leading edge of the scaffold.
  final Widget? drawer;

  /// An optional panel displayed from the trailing edge of the scaffold.
  final Widget? endDrawer;

  /// A navigation bar displayed at the bottom of the scaffold.
  final Widget? bottomNavigationBar;

  /// A persistent bottom sheet anchored to the bottom of the scaffold.
  final Widget? bottomSheet;

  /// A floating action button displayed above the body.
  final Widget? floatingActionButton;

  /// The location of the [floatingActionButton] on the screen.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Whether the body extends into the bottom navigation bar area.
  final bool extendBody;

  /// Whether the body extends behind the app bar.
  final bool extendBodyBehindAppBar;

  /// A list of buttons displayed at the bottom of the scaffold, above the
  /// bottom navigation bar.
  final List<Widget>? persistentFooterButtons;

  /// The alignment of [persistentFooterButtons].
  final AlignmentDirectional? persistentFooterAlignment;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// The brightness used for status bar icons and system UI overlays.
  final Brightness? brightness;

  /// The color of the system navigation bar on Android.
  final Color? systemNavigationBarColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (isCupertino) {
      return cupertino.CupertinoPageScaffold(
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: body ?? const SizedBox.shrink(),
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness ?? (isDark ? Brightness.light : Brightness.dark),
        statusBarBrightness: brightness ?? (isDark ? Brightness.dark : Brightness.light),
        systemNavigationBarColor: systemNavigationBarColor ?? theme.colorScheme.surface,
        systemNavigationBarIconBrightness: brightness ?? (isDark ? Brightness.light : Brightness.dark),
      ),
      child: Scaffold(
        appBar: appBar,
        body: body,
        drawer: drawer,
        endDrawer: endDrawer,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        persistentFooterButtons: persistentFooterButtons,
        persistentFooterAlignment: persistentFooterAlignment ?? AlignmentDirectional.centerEnd,
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      ),
    );
  }
}
