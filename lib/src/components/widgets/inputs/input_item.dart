import 'package:flutter/material.dart';

/// A function that builds a widget for a given [BuildContext].
typedef ItemWidgetBuilder = Widget Function(BuildContext);

/// A generic data model representing a selectable item in an input list.
class InputItem<T> {
  /// Creates an [InputItem].
  const InputItem({
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
  /// An optional widget builder for the leading position.
  final ItemWidgetBuilder? leading;
  /// An optional widget builder for the trailing position.
  final ItemWidgetBuilder? trailing;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InputItem &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value;

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}
