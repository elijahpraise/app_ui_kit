import 'package:flutter/widgets.dart';

import '../controllers/headless_controller.dart';

/// Signature for building UI from a headless controller.
typedef HeadlessWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  HeadlessController<T> controller,
  Widget? child,
);

/// Listens to a [HeadlessController] and rebuilds when value changes.
class HeadlessBuilder<T> extends StatelessWidget {
  const HeadlessBuilder({
    super.key,
    required this.controller,
    required this.builder,
    this.child,
  });

  final HeadlessController<T> controller;
  final HeadlessWidgetBuilder<T> builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        return builder(context, controller.value, controller, child);
      },
    );
  }
}
