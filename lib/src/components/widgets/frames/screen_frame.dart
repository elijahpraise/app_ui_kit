import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenFrame extends StatelessWidget {
  const ScreenFrame({
    super.key,
    required this.child,
    this.padding,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.useSlivers = false,
  }) : _mode = ScreenFrameMode.unbounded;

  const ScreenFrame.fixed({
    super.key,
    required this.child,
    this.padding,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.useSlivers = false,
  }) : _mode = ScreenFrameMode.fixed;

  const ScreenFrame.unbounded({
    super.key,
    required this.child,
    this.padding,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.useSlivers = false,
  }) : _mode = ScreenFrameMode.unbounded;

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final bool? useSlivers;
  final ScreenFrameMode _mode;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);

    switch (_mode) {
      case ScreenFrameMode.fixed:
        return SingleChildScrollView(
          controller: scrollController,
          scrollDirection: scrollDirection,
          child: SizedBox(
            height: context.frameSize().height,
            child: Padding(
              padding: effectivePadding,
              child: child,
            ),
          ),
        );
      case ScreenFrameMode.unbounded:
        if (useSlivers == true) {
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: effectivePadding,
                sliver: SliverToBoxAdapter(child: child),
              ),
            ],
          );
        }
        return SingleChildScrollView(
          controller: scrollController,
          scrollDirection: scrollDirection,
          padding: effectivePadding,
          child: child,
        );
    }
  }
}

enum ScreenFrameMode { fixed, unbounded }

extension ScreenFrameContext on BuildContext {
  Size frameSize() {
    final mediaQuery = MediaQuery.of(this);
    final bottomInset = mediaQuery.viewInsets.bottom;
    final topPadding = mediaQuery.padding.top;
    final appBarHeight = kToolbarHeight;

    return Size(
      mediaQuery.size.width,
      mediaQuery.size.height - topPadding - appBarHeight - bottomInset,
    );
  }
}
