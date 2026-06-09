import 'package:flutter/material.dart';

class BottomSheetSelectContent<T> extends StatelessWidget {
  const BottomSheetSelectContent({
    super.key,
    required this.items,
    required this.onSelected,
    this.title,
    this.searchHint = 'Search...',
    this.emptyText = 'No results found',
  });

  final List<SelectItem<T>> items;
  final ValueChanged<SelectItem<T>> onSelected;
  final String? title;
  final String searchHint;
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

class SelectItem<T> {
  const SelectItem({
    required this.label,
    this.value,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  final String label;
  final T? value;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
}
