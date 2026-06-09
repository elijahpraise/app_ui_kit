import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';

class ActionDialog extends StatelessWidget {
  const ActionDialog({
    super.key,
    this.title,
    this.subtitle,
    this.titleAlt,
    this.subtitleAlt,
    this.primaryText = 'Confirm',
    this.secondaryText = 'Cancel',
    this.onPrimary,
    this.onSecondary,
    this.primaryColor,
    this.secondaryColor,
    this.borderRadius,
    this.padding,
  });

  final String? title;
  final String? subtitle;
  final Widget? titleAlt;
  final Widget? subtitleAlt;
  final String primaryText;
  final String secondaryText;
  final VoidCallback? onPrimary;
  final VoidCallback? onSecondary;
  final Color? primaryColor;
  final Color? secondaryColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isCupertino) {
      return cupertino.CupertinoAlertDialog(
        title: titleAlt ?? (title != null ? Text(title!) : null),
        content: subtitleAlt ?? (subtitle != null ? Text(subtitle!) : null),
        actions: [
          if (onSecondary != null)
            cupertino.CupertinoDialogAction(
              child: Text(secondaryText, style: TextStyle(color: secondaryColor)),
              onPressed: () {
                onSecondary?.call();
                Navigator.pop(context);
              },
            ),
          cupertino.CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(primaryText, style: TextStyle(color: primaryColor ?? theme.colorScheme.primary)),
            onPressed: () {
              onPrimary?.call();
              Navigator.pop(context);
            },
          ),
        ],
      );
    }

    final effectiveRadius = borderRadius ?? 20;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(effectiveRadius),
      ),
      backgroundColor: theme.dialogTheme.backgroundColor ?? theme.colorScheme.surface,
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: padding ?? const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (titleAlt != null)
              titleAlt!
            else if (title != null)
              Text(
                title!,
                style: theme.dialogTheme.titleTextStyle ?? theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            if ((titleAlt != null || title != null) && (subtitleAlt != null || subtitle != null))
              const SizedBox(height: 8),
            if (subtitleAlt != null)
              subtitleAlt!
            else if (subtitle != null)
              Text(
                subtitle!,
                style: theme.dialogTheme.contentTextStyle ?? theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 24),
            const Divider(height: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                if (onSecondary != null) ...[
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        onSecondary?.call();
                        Navigator.pop(context);
                      },
                      child: Text(
                        secondaryText,
                        style: TextStyle(color: secondaryColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      onPrimary?.call();
                      Navigator.pop(context);
                    },
                    child: Text(
                      primaryText,
                      style: TextStyle(color: primaryColor ?? theme.colorScheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
