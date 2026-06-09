import 'package:flutter/material.dart';

/// A bottom sheet content widget for selecting from a list of items.
class BottomSheetSelectContent<T> extends StatelessWidget {
  /// Creates a [BottomSheetSelectContent].
  const BottomSheetSelectContent({
    super.key,
    required this.items,
    required this.onSelected,
    this.title,
    this.searchHint = 'Search...',
    this.emptyText = 'No results found',
  });

  /// The list of selectable items.
  final List<SelectItem<T>> items;
  /// Called when an item is selected.
  final ValueChanged<SelectItem<T>> onSelected;
  /// The optional title displayed at the top of the sheet.
  final String? title;
  /// The hint text for the search field.
  final String searchHint;
  /// The text shown when no search results match.
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title!,
              style: theme.textTheme.titleMedium,
            ),
          ),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (_, __) => Divider(height: 1, color: theme.dividerColor),
            itemBuilder: (_, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.label),
                subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
                leading: item.leading,
                trailing: item.trailing,
                onTap: () {
                  onSelected(item);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A generic data model for items displayed in a selection list.
class SelectItem<T> {
  /// Creates a [SelectItem].
  const SelectItem({
    required this.label,
    this.value,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  /// The display label for the item.
  final String label;
  /// The optional value associated with this item.
  final T? value;
  /// An optional subtitle displayed below the label.
  final String? subtitle;
  /// An optional leading widget.
  final Widget? leading;
  /// An optional trailing widget.
  final Widget? trailing;
}
