import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A themed expansion tile with animated background, border, and
/// customizable styling for expanded and collapsed states.
class ExpansionTileV1 extends HookWidget {
  const ExpansionTileV1({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
    this.leading,
    this.trailing,
    this.onExpansionChanged,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.titleStyle,
    this.iconColor,
    this.collapsedIconColor,
    this.padding,
    this.radius,
    this.borderColor,
  });

  /// The primary widget displayed in the tile header.
  final Widget title;
  /// Widgets shown when the tile is expanded.
  final List<Widget> children;
  /// Whether the tile starts expanded. Defaults to false.
  final bool initiallyExpanded;
  /// An optional widget displayed before the title.
  final Widget? leading;
  /// An optional widget displayed after the title.
  final Widget? trailing;
  /// Callback invoked when the expanded state changes.
  final ValueChanged<bool>? onExpansionChanged;
  /// Background color when expanded.
  final Color? backgroundColor;
  /// Background color when collapsed.
  final Color? collapsedBackgroundColor;
  /// Style override for the title text.
  final TextStyle? titleStyle;
  /// Color of the expand/collapse icon when expanded.
  final Color? iconColor;
  /// Color of the expand/collapse icon when collapsed.
  final Color? collapsedIconColor;
  /// Padding around the tile content.
  final EdgeInsetsGeometry? padding;
  /// Border radius of the tile. Defaults to 8.
  final double? radius;
  /// Border color around the tile.
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expanded = useState(initiallyExpanded);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: expanded.value
            ? (backgroundColor ?? theme.colorScheme.surface.withValues(alpha: 0.05))
            : (collapsedBackgroundColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(color: borderColor ?? theme.dividerColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8),
        child: ExpansionTile(
          title: DefaultTextStyle(
            style: titleStyle ?? theme.textTheme.titleSmall ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            child: title,
          ),
          leading: leading,
          trailing: trailing,
          initiallyExpanded: initiallyExpanded,
          onExpansionChanged: (v) {
            expanded.value = v;
            onExpansionChanged?.call(v);
          },
          collapsedBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          collapsedIconColor: collapsedIconColor ?? theme.colorScheme.onSurface,
          iconColor: iconColor ?? theme.colorScheme.onSurface,
          shape: const Border(),
          collapsedShape: const Border(),
          clipBehavior: Clip.antiAlias,
          children: children,
        ),
      ),
    );
  }
}
