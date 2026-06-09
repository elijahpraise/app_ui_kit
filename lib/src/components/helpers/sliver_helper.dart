import 'package:flutter/material.dart';

/// A utility class with static factory methods for creating common sliver
/// widgets (fill, scrollable, list, padding, etc.).
class SliverHelper {
  SliverHelper._();

  /// Creates a [SliverFillRemaining] that fills the remaining viewport with
  /// the given [child]. Does not scroll.
  static Widget fillRemaining({required Widget child}) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: child,
    );
  }

  /// Wraps [child] in a [SliverToBoxAdapter] for use in a CustomScrollView.
  static Widget scrollable({required Widget child}) {
    return SliverToBoxAdapter(child: child);
  }

  /// Creates a [SliverList.separated] with [itemCount] items built by
  /// [itemBuilder] and separated by [separatorBuilder].
  static Widget separatedList({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    required Widget Function(BuildContext, int) separatorBuilder,
  }) {
    return SliverList.separated(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  /// Creates a [SliverList] from a fixed list of [children].
  static Widget breadcrumb(List<Widget> children) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => children[index],
        childCount: children.length,
      ),
    );
  }

  /// Creates a [SliverFixedExtentList] where each item has a fixed
  /// [itemExtent] (default 48.0).
  static Widget fixedExtentList({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    double itemExtent = 48,
  }) {
    return SliverFixedExtentList(
      itemExtent: itemExtent,
      delegate: SliverChildBuilderDelegate(
        itemBuilder,
        childCount: itemCount,
      ),
    );
  }

  /// Wraps an existing [sliver] with [padding] using [SliverPadding] (default
  /// 16.0 on all sides).
  static Widget padded({
    required Widget sliver,
    EdgeInsets padding = const EdgeInsets.all(16),
  }) {
    return SliverPadding(
      padding: padding,
      sliver: sliver,
    );
  }
}
