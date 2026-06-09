import 'package:flutter/material.dart';

class TabBarV1 extends StatelessWidget implements PreferredSizeWidget {
  const TabBarV1({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.indicatorColor,
    this.indicatorSize,
    this.indicatorWeight = 2,
    this.onTap,
    this.tabAlignment,
    this.dividerColor,
  });

  final List<Widget> tabs;
  final TabController? controller;
  final bool isScrollable;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? indicatorColor;
  final TabBarIndicatorSize? indicatorSize;
  final double indicatorWeight;
  final ValueChanged<int>? onTap;
  final TabAlignment? tabAlignment;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabTheme = theme.tabBarTheme;

    return TabBar(
      controller: controller,
      isScrollable: isScrollable,
      labelColor: labelColor ?? tabTheme.labelColor ?? theme.colorScheme.primary,
      unselectedLabelColor: unselectedLabelColor ?? tabTheme.unselectedLabelColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.6),
      labelStyle: labelStyle ?? tabTheme.labelStyle,
      unselectedLabelStyle: unselectedLabelStyle ?? tabTheme.unselectedLabelStyle,
      indicatorColor: indicatorColor ?? tabTheme.indicatorColor ?? theme.colorScheme.primary,
      indicatorSize: indicatorSize ?? tabTheme.indicatorSize ?? TabBarIndicatorSize.tab,
      indicatorWeight: indicatorWeight,
      onTap: onTap,
      tabAlignment: tabAlignment,
      dividerColor: dividerColor ?? theme.dividerColor,
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
