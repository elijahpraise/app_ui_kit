import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A scrollable screen frame that wraps a child with padding, supporting
/// fixed-height and unbounded scroll modes.
class ScreenFrame extends StatelessWidget {
  /// Creates a scrollable [ScreenFrame] in unbounded mode.
  const ScreenFrame({
    super.key,
    this.child,
    this.children,
    this.padding,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.useSlivers = false,
  }) : _mode = ScreenFrameMode.unbounded;

  /// Creates a fixed-height scrollable frame that constrains the child to
  /// the available screen height.
  const ScreenFrame.fixed({
    super.key,
    this.child,
    this.children,
    this.padding,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.useSlivers = false,
  }) : _mode = ScreenFrameMode.fixed;

  /// Creates an unbounded scrollable frame that allows the child to take
  /// its natural height.
  const ScreenFrame.unbounded({
    super.key,
    this.child,
    this.children,
    this.padding,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.useSlivers = false,
  }) : _mode = ScreenFrameMode.unbounded;

  /// The widget to display inside the scrollable frame.
  final Widget? child;

  /// The list of widgets to display inside the scrollable frame.
  final List<Widget>? children;

  /// Padding around the child. Defaults to horizontal 16.w and vertical 8.h.
  final EdgeInsetsGeometry? padding;

  /// Optional scroll controller for the scroll view.
  final ScrollController? scrollController;

  /// Axis along which the content scrolls. Defaults to [Axis.vertical].
  final Axis scrollDirection;

  /// Whether to use slivers (CustomScrollView) in unbounded mode.
  final bool? useSlivers;
  final ScreenFrameMode _mode;

  @override
  Widget build(BuildContext context) {
    final effectivePadding =
        padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);

    switch (_mode) {
      case ScreenFrameMode.fixed:
        return SingleChildScrollView(
          controller: scrollController,
          scrollDirection: scrollDirection,
          child: SizedBox(
            height: context.frameSize().height,
            child: Padding(padding: effectivePadding, child: child),
          ),
        );
      case ScreenFrameMode.unbounded:
        if (useSlivers == true) {
          return CustomScrollView(
            controller: scrollController,
            slivers:
                children ??
                [
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

/// Determines whether [ScreenFrame] constrains its child to the available
/// screen height ([fixed]) or allows unbounded scrolling ([unbounded]).
enum ScreenFrameMode {
  /// Constrains the child to the available screen height.
  fixed,

  /// Allows the child to take its natural height with scrolling.
  unbounded,
}

/// Extension on [BuildContext] that provides the available frame size
/// accounting for system insets, app bar, and keyboard.
/// Provides the available frame size accounting for system insets.
extension ScreenFrameContext on BuildContext {
  /// Returns the available screen size minus top padding, app bar height,
  /// and keyboard inset.
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
