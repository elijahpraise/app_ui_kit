import 'headless_controller.dart';

/// Convenience controller for binary UI state.
class ToggleController extends HeadlessController<bool> {
  /// Creates a toggle controller with an optional [initialValue] (defaults to false).
  ToggleController({bool initialValue = false}) : super(initialValue);

  /// Toggles the current value between true and false.
  void toggle() {
    value = !value;
  }

  /// Sets the value to true.
  void on() {
    value = true;
  }

  /// Sets the value to false.
  void off() {
    value = false;
  }
}
