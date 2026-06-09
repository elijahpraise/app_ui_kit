import 'package:flutter/material.dart';

import 'base_scaffold.dart';
import 'loading_overlay_v1.dart';

class ScaffoldV1 extends StatelessWidget {
  const ScaffoldV1({
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
    this.isLoading = false,
    this.indicator,
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
  final bool isLoading;
  final Widget? indicator;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlayV1(
      isLoading: isLoading,
      indicator: indicator,
      child: BaseScaffold(
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
        persistentFooterAlignment: persistentFooterAlignment,
        backgroundColor: backgroundColor,
        brightness: brightness,
        systemNavigationBarColor: systemNavigationBarColor,
      ),
    );
  }
}
