import 'package:flutter/foundation.dart';

/// Base state holder for headless widget behavior.
abstract class HeadlessController<T> extends ChangeNotifier {
  /// Creates a controller with the given [initialValue].
  HeadlessController(T initialValue)
      : _initialValue = initialValue,
        _value = initialValue;

  final T _initialValue;
  T _value;

  /// The current value managed by this controller.
  T get value => _value;

  /// Sets a new value and notifies listeners when the value changes.
  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }

  /// Updates the current value by applying [updater].
  void update(T Function(T currentValue) updater) {
    value = updater(_value);
  }

  /// Resets state back to the original initial value.
  void reset() {
    value = _initialValue;
  }
}
