import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';

/// A platform-adaptive app bar that renders either a Material [AppBar] or a
/// Cupertino [CupertinoNavigationBar] based on the current platform.
class AppBarV1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarV1({
    super.key,
    /// The primary title widget displayed in the center of the app bar.
    this.title,
    /// Called when the back button is pressed; defaults to the system back
    /// behavior if null.
    this.onBackPressed,
    /// Whether to show a leading back button. Defaults to true.
    this.hasLeading = true,
    /// Whether to center the title horizontally. Defaults to false.
    this.centerTitle = false,
    /// The width of the leading area.
    this.leadingWidth,
    /// The height of the toolbar. Defaults to [kToolbarHeight].
    this.toolbarHeight,
    /// A list of action widgets placed at the trailing end of the app bar.
    this.actions,
    /// A custom leading widget replaces the default back button.
    this.leading,
    /// The icon data for the back button when [hasLeading] is true and
    /// [onBackPressed] is provided.
    this.iconData,
    /// The shape of the app bar.
    this.shape,
    /// An alternative title widget used when [isCupertino] is true.
    this.titleAlt,
    /// The style applied to the title text.
    this.titleStyle,
    /// The background color of the app bar.
    this.backgroundColor,
    /// A bottom widget, typically a [TabBar], pinned below the toolbar.
    this.bottom,
    /// The padding around the app bar content.
    this.padding,
    /// The elevation of the app bar.
    this.elevation,
  });

  /// The primary title widget displayed in the center of the app bar.
  final Widget? title;
  /// Called when the back button is pressed.
  final VoidCallback? onBackPressed;
  /// Whether to show a leading back button.
  final bool hasLeading;
  /// Whether to center the title horizontally.
  final bool centerTitle;
  /// The width of the leading area.
  final double? leadingWidth;
  /// The height of the toolbar.
  final double? toolbarHeight;
  /// Action widgets displayed at the trailing end of the app bar.
  final List<Widget>? actions;
  /// A custom leading widget.
  final Widget? leading;
  /// Icon data for the back button.
  final IconData? iconData;
  /// The shape border of the app bar.
  final ShapeBorder? shape;
  /// An alternative title widget used on Cupertino platforms.
  final Widget? titleAlt;
  /// The text style applied to the title.
  final TextStyle? titleStyle;
  /// The background color of the app bar.
  final Color? backgroundColor;
  /// A bottom widget pinned below the toolbar, such as a [TabBar].
  final PreferredSizeWidget? bottom;
  /// The padding inside the app bar.
  final EdgeInsetsGeometry? padding;
  /// The elevation cast by the app bar.
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;

    if (isCupertino) {
      return PreferredSize(
        preferredSize: preferredSize,
        child: cupertino.CupertinoNavigationBar(
          middle: DefaultTextStyle(
            style: titleStyle ?? const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            child: titleAlt ?? title ?? const SizedBox.shrink(),
          ),
          leading: leading ??
              (hasLeading
                  ? cupertino.CupertinoNavigationBarBackButton(
                      onPressed: onBackPressed,
                    )
                  : null),
          trailing: actions != null && actions!.isNotEmpty
              ? Row(mainAxisSize: MainAxisSize.min, children: actions!)
              : null,
          backgroundColor: backgroundColor ?? appBarTheme.backgroundColor ?? theme.colorScheme.surface,
          border: const Border(bottom: BorderSide(color: Color(0x1A000000))),
        ),
      );
    }

    return AppBar(
      leading: leading ??
          (hasLeading
              ? (onBackPressed != null
                  ? IconButton(
                      icon: Icon(iconData ?? Icons.arrow_back_ios_new_rounded),
                      onPressed: onBackPressed,
                    )
                  : const BackButton())
              : null),
      title: titleAlt ?? title,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      actions: actions,
      shape: shape,
      titleTextStyle: titleStyle ?? appBarTheme.titleTextStyle,
      backgroundColor: backgroundColor ?? appBarTheme.backgroundColor ?? theme.colorScheme.surface,
      bottom: bottom,
      elevation: elevation ?? appBarTheme.elevation ?? 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
