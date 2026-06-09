import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'input_item.dart';
import 'validators.dart';

/// A searchable dropdown field that opens a bottom sheet for item selection.
class SearchInputField<T> extends HookWidget {
  /// Creates a [SearchInputField].
  const SearchInputField({
    super.key,
    required this.items,
    required this.onSelected,
    this.controller,
    this.hintText = 'Search',
    this.labelText,
    this.validator,
    this.enabled = true,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding,
    this.searchHint = 'Search...',
    this.emptyText = 'No results found',
  });

  /// The list of selectable items.
  final List<InputItem<T>> items;
  /// Called when an item is selected from the bottom sheet.
  final ValueChanged<InputItem<T>> onSelected;
  /// The controller for the text field.
  final TextEditingController? controller;
  /// Placeholder text shown when the field is empty.
  final String? hintText;
  /// The label text displayed above the field.
  final String? labelText;
  /// A callback that validates the current field value.
  final ValidatorCallback? validator;
  /// Whether the field is interactive.
  final bool enabled;
  /// The border radius of the input.
  final double? borderRadius;
  /// The fill color of the input decoration.
  final Color? fillColor;
  /// The color of the enabled border.
  final Color? borderColor;
  /// The color of the focused border.
  final Color? focusedBorderColor;
  /// The color of the error border.
  final Color? errorBorderColor;
  /// The style for the input text.
  final TextStyle? textStyle;
  /// The style for the hint text.
  final TextStyle? hintStyle;
  /// The style for the label text.
  final TextStyle? labelStyle;
  /// The style for the error text.
  final TextStyle? errorStyle;
  /// The padding inside the input decoration.
  final EdgeInsetsGeometry? contentPadding;
  /// The hint text for the search field inside the bottom sheet.
  final String searchHint;
  /// The text shown when no search results match.
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final radius = borderRadius ?? 6;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor ?? inputTheme.enabledBorder?.borderSide.color ?? theme.dividerColor),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: focusedBorderColor ?? inputTheme.focusedBorder?.borderSide.color ?? theme.colorScheme.primary, width: 2),
    );

    return GestureDetector(
      onTap: enabled
          ? () => _showBottomSheet(context)
          : null,
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          validator: validator,
          enabled: enabled,
          style: textStyle ?? inputTheme.labelStyle?.copyWith(color: theme.colorScheme.onSurface),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            filled: inputTheme.filled,
            fillColor: fillColor ?? inputTheme.fillColor,
            hintStyle: hintStyle ?? inputTheme.hintStyle,
            labelStyle: labelStyle ?? inputTheme.labelStyle,
            errorStyle: errorStyle ?? inputTheme.errorStyle,
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: Icon(Icons.arrow_drop_down, color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
            border: border,
            enabledBorder: border,
            focusedBorder: focusedBorder,
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => _SearchBottomSheetContent<T>(
        items: items,
        onSelected: onSelected,
        searchHint: searchHint,
        emptyText: emptyText,
      ),
    );
  }
}

class _SearchBottomSheetContent<T> extends HookWidget {
  const _SearchBottomSheetContent({
    required this.items,
    required this.onSelected,
    required this.searchHint,
    required this.emptyText,
  });

  final List<InputItem<T>> items;
  final ValueChanged<InputItem<T>> onSelected;
  final String searchHint;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = useState('');
    final filtered = useState<List<InputItem<T>>>(items);

    useEffect(() {
      if (query.value.isEmpty) {
        filtered.value = items;
      } else {
        filtered.value = items.where((item) =>
          item.label.toLowerCase().contains(query.value.toLowerCase()),
        ).toList();
      }
      return null;
    }, [query.value, items]);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      expand: false,
      builder: (_, scrollController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextField(
                onChanged: (v) => query.value = v,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: searchHint,
                  prefixIcon: Icon(Icons.search, color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: filtered.value.isEmpty
                  ? Center(
                      child: Text(
                        emptyText,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    )
                  : ListView.separated(
                      controller: scrollController,
                      itemCount: filtered.value.length,
                      separatorBuilder: (_, __) => Divider(height: 1, color: theme.dividerColor),
                      itemBuilder: (_, index) {
                        final item = filtered.value[index];
                        return ListTile(
                          title: Text(item.label),
                          subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
                          leading: item.leading != null ? item.leading!(context) : null,
                          trailing: item.trailing != null ? item.trailing!(context) : null,
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
      },
    );
  }
}
