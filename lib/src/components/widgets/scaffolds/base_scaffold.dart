import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../foundation/platform.dart';

class BaseScaffold extends StatelessWidget {
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

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional? persistentFooterAlignment;
  final Color? backgroundColor;
  final Brightness? brightness;
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
