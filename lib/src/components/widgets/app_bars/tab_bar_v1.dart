import 'package:flutter/material.dart';

/// A wrapper around the Material [TabBar] that applies sensible defaults from
/// the current theme's [TabBarTheme].
class TabBarV1 extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a themed [TabBarV1].
  const TabBarV1({
    super.key,
    /// The list of tab widgets to display.
    required this.tabs,
    /// The [TabController] that synchronizes the tab selection.
    this.controller,
    /// Whether the tabs are scrollable. Defaults to false.
    this.isScrollable = false,
    /// The color of the selected tab label.
    this.labelColor,
    /// The color of unselected tab labels.
    this.unselectedLabelColor,
    /// The text style of the selected tab label.
    this.labelStyle,
    /// The text style of unselected tab labels.
    this.unselectedLabelStyle,
    /// The color of the tab indicator.
    this.indicatorColor,
    /// The size strategy of the tab indicator.
    this.indicatorSize,
    /// The thickness of the tab indicator. Defaults to 2.
    this.indicatorWeight = 2,
    /// Called when a tab is tapped, receiving the tapped tab index.
    this.onTap,
    /// How the tabs are aligned within the tab bar.
    this.tabAlignment,
    /// The color of the divider drawn below the tab bar.
    this.dividerColor,
  });

  /// The list of tab widgets to display.
  final List<Widget> tabs;
  /// The [TabController] that synchronizes the tab selection.
  final TabController? controller;
  /// Whether the tabs are scrollable.
  final bool isScrollable;
  /// The color of the selected tab label.
  final Color? labelColor;
  /// The color of unselected tab labels.
  final Color? unselectedLabelColor;
  /// The text style of the selected tab label.
  final TextStyle? labelStyle;
  /// The text style of unselected tab labels.
  final TextStyle? unselectedLabelStyle;
  /// The color of the tab indicator.
  final Color? indicatorColor;
  /// The size strategy of the tab indicator.
  final TabBarIndicatorSize? indicatorSize;
  /// The thickness of the tab indicator.
  final double indicatorWeight;
  /// Called when a tab is tapped.
  final ValueChanged<int>? onTap;
  /// How the tabs are aligned within the tab bar.
  final TabAlignment? tabAlignment;
  /// The color of the divider below the tab bar.
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
