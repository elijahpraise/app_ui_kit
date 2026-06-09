import 'package:flutter/material.dart';

class InputItem<T> {
  const InputItem({
    required this.label,
    this.value,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  final String label;
  final T? value;
  final String? subtitle;
  final WidgetBuilder? leading;
  final WidgetBuilder? trailing;

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

typedef WidgetBuilder = Widget Function(BuildContext);
