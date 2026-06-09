import 'headless_controller.dart';

/// Convenience controller for binary UI state.
class ToggleController extends HeadlessController<bool> {
  ToggleController({bool initialValue = false}) : super(initialValue);

  void toggle() {
    value = !value;
  }

  void on() {
    value = true;
  }

  void off() {
    value = false;
  }
}
