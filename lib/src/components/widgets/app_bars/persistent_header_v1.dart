import 'package:flutter/material.dart';

/// A sliver persistent header that fades its child as the user scrolls.
class PersistentHeaderV1 extends SliverPersistentHeaderDelegate {
  /// Creates a [PersistentHeaderV1] with the given [child].
  PersistentHeaderV1({
    required this.child,
    this.minHeaderHeight,
    this.maxHeaderHeight,
  });

  /// The widget displayed inside the header.
  final Widget child;

  /// The minimum height when fully scrolled. Defaults to 60.
  final double? minHeaderHeight;

  /// The maximum height when fully expanded. Defaults to 120.
  final double? maxHeaderHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    return Opacity(
      opacity: 1.0 - progress,
      child: child,
    );
  }

  @override
  double get minExtent => minHeaderHeight ?? 60;

  @override
  double get maxExtent => maxHeaderHeight ?? 120;

  @override
  bool shouldRebuild(PersistentHeaderV1 oldDelegate) {
    return child != oldDelegate.child ||
        minHeaderHeight != oldDelegate.minHeaderHeight ||
        maxHeaderHeight != oldDelegate.maxHeaderHeight;
  }
}
