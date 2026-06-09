import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

  final Widget title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final Widget? leading;
  final Widget? trailing;
  final ValueChanged<bool>? onExpansionChanged;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final TextStyle? titleStyle;
  final Color? iconColor;
  final Color? collapsedIconColor;
  final EdgeInsetsGeometry? padding;
  final double? radius;
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
