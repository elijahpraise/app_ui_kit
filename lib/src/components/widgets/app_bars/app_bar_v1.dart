import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';

class AppBarV1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarV1({
    super.key,
    this.title,
    this.onBackPressed,
    this.hasLeading = true,
    this.centerTitle = false,
    this.leadingWidth,
    this.toolbarHeight,
    this.actions,
    this.leading,
    this.iconData,
    this.shape,
    this.titleAlt,
    this.titleStyle,
    this.backgroundColor,
    this.bottom,
    this.padding,
    this.elevation,
  });

  final Widget? title;
  final VoidCallback? onBackPressed;
  final bool hasLeading;
  final bool centerTitle;
  final double? leadingWidth;
  final double? toolbarHeight;
  final List<Widget>? actions;
  final Widget? leading;
  final IconData? iconData;
  final ShapeBorder? shape;
  final Widget? titleAlt;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final EdgeInsetsGeometry? padding;
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
