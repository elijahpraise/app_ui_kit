import 'package:flutter/material.dart';

/// A themed list tile with press animation, optional divider, and
/// customizable styling for leading, title, subtitle, and trailing widgets.
class ListTileV1 extends StatefulWidget {
  /// Creates a [ListTileV1].
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

  /// The primary content of the list tile.
  final Widget title;
  /// Additional content displayed below the title.
  final Widget? subtitle;
  /// A widget displayed before the title.
  final Widget? leading;
  /// A widget displayed after the title.
  final Widget? trailing;
  /// Callback invoked when the tile is tapped.
  final VoidCallback? onTap;
  /// Callback invoked when the tile is long-pressed.
  final VoidCallback? onLongPress;
  /// Whether the tile is interactive. Defaults to true.
  final bool enabled;
  /// Whether to use a dense layout with less vertical padding.
  final bool dense;
  /// Whether the tile appears in a selected state.
  final bool selected;
  /// Style override for the title text.
  final TextStyle? titleStyle;
  /// Style override for the subtitle text.
  final TextStyle? subtitleStyle;
  /// Size constraint for the leading widget.
  final double? leadingSize;
  /// Padding around the tile content.
  final EdgeInsetsGeometry? contentPadding;
  /// Background color of the tile.
  final Color? backgroundColor;
  /// Border radius of the tile.
  final double? radius;
  /// Border color of the tile.
  final Color? borderColor;
  /// Whether to show a divider below the tile. Defaults to false.
  final bool divider;
  /// Duration of press and layout animations. Defaults to 150ms.
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
