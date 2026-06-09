import 'headless_controller.dart';

/// Generic concrete controller for headless state.
class HeadlessValueController<T> extends HeadlessController<T> {
  /// Creates a controller with the given [initialValue].
  HeadlessValueController(super.initialValue);
}
