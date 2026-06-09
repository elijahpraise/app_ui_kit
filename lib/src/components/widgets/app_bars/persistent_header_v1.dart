import 'package:flutter/material.dart';

class PersistentHeaderV1 extends SliverPersistentHeaderDelegate {
  PersistentHeaderV1({
    required this.child,
    this.minHeaderHeight,
    this.maxHeaderHeight,
  });

  final Widget child;
  final double? minHeaderHeight;
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
