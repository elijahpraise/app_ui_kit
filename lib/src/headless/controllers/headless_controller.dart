import 'package:flutter/foundation.dart';

/// Base state holder for headless widget behavior.
abstract class HeadlessController<T> extends ChangeNotifier {
  HeadlessController(T initialValue)
      : _initialValue = initialValue,
        _value = initialValue;

  final T _initialValue;
  T _value;

  T get value => _value;

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
