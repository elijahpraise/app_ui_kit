import 'package:flutter/material.dart';

class ListTileV1 extends StatelessWidget {
  const ListTileV1({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.dense = false,
    this.selected = false,
    this.titleStyle,
    this.subtitleStyle,
    this.leadingSize,
    this.contentPadding,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.divider = false,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final bool dense;
  final bool selected;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double? leadingSize;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tileTheme = theme.listTileTheme;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
        border: borderColor != null
            ? Border.all(color: borderColor!)
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onTap: enabled ? onTap : null,
            onLongPress: enabled ? onLongPress : null,
            dense: dense,
            selected: selected,
            titleTextStyle: titleStyle ?? tileTheme.titleTextStyle,
            subtitleTextStyle: subtitleStyle ?? tileTheme.subtitleTextStyle,
            leadingAndTrailingTextStyle: tileTheme.leadingAndTrailingTextStyle,
            contentPadding: contentPadding ?? tileTheme.contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            iconColor: tileTheme.iconColor,
            textColor: tileTheme.textColor,
          ),
          if (divider)
            Divider(height: 1, color: theme.dividerColor, indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}
