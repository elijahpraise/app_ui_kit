import 'package:flutter/material.dart';

class ListTileV1 extends StatefulWidget {
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
    this.animationDuration = const Duration(milliseconds: 150),
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
  final Duration animationDuration;

  @override
  State<ListTileV1> createState() => _ListTileV1State();
}

class _ListTileV1State extends State<ListTileV1> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tileTheme = theme.listTileTheme;

    final bgColor = widget.backgroundColor ?? Colors.transparent;
    final pressedColor = widget.onTap != null && widget.enabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.05)
        : bgColor;

    return AnimatedContainer(
      duration: widget.animationDuration,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: _pressed ? pressedColor : bgColor,
        borderRadius: widget.radius != null ? BorderRadius.circular(widget.radius!) : null,
        border: widget.borderColor != null
            ? Border.all(color: widget.borderColor!)
            : null,
      ),
      child: Listener(
        onPointerDown: widget.onTap != null && widget.enabled
            ? (_) => setState(() => _pressed = true)
            : null,
        onPointerUp: (_) => setState(() => _pressed = false),
        onPointerCancel: (_) => setState(() => _pressed = false),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedPadding(
              duration: widget.animationDuration,
              curve: Curves.easeOut,
              padding: _pressed
                  ? const EdgeInsets.only(left: 4)
                  : EdgeInsets.zero,
              child: ListTile(
                title: widget.title,
                subtitle: widget.subtitle,
                leading: widget.leading,
                trailing: widget.trailing,
                onTap: widget.enabled ? widget.onTap : null,
                onLongPress: widget.enabled ? widget.onLongPress : null,
                dense: widget.dense,
                selected: widget.selected,
                titleTextStyle: widget.titleStyle ?? tileTheme.titleTextStyle,
                subtitleTextStyle: widget.subtitleStyle ?? tileTheme.subtitleTextStyle,
                leadingAndTrailingTextStyle: tileTheme.leadingAndTrailingTextStyle,
                contentPadding: widget.contentPadding ?? tileTheme.contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                iconColor: tileTheme.iconColor,
                textColor: tileTheme.textColor,
              ),
            ),
            if (widget.divider)
              Divider(height: 1, color: theme.dividerColor, indent: 16, endIndent: 16),
          ],
        ),
      ),
    );
  }
}
