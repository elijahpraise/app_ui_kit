import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

import '../../foundation/platform.dart';

/// A platform-aware dialog with primary and secondary action buttons.
class ActionDialog extends StatelessWidget {
  /// Creates an [ActionDialog].
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

  /// The title text of the dialog.
  final String? title;
  /// The subtitle text of the dialog.
  final String? subtitle;
  /// An optional custom widget used instead of [title].
  final Widget? titleAlt;
  /// An optional custom widget used instead of [subtitle].
  final Widget? subtitleAlt;
  /// The label for the primary action button.
  final String primaryText;
  /// The label for the secondary action button.
  final String secondaryText;
  /// Called when the primary action is tapped.
  final VoidCallback? onPrimary;
  /// Called when the secondary action is tapped.
  final VoidCallback? onSecondary;
  /// The color of the primary action button text.
  final Color? primaryColor;
  /// The color of the secondary action button text.
  final Color? secondaryColor;
  /// The border radius of the dialog (Material only).
  final double? borderRadius;
  /// The padding around the dialog content.
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
