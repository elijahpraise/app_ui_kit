import 'package:flutter/material.dart';

class SliverHelper {
  SliverHelper._();

  static Widget fillRemaining({required Widget child}) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: child,
    );
  }

  static Widget scrollable({required Widget child}) {
    return SliverToBoxAdapter(child: child);
  }

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

  static Widget breadcrumb(List<Widget> children) {
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }

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
