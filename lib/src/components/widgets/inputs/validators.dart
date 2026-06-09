/// A callback type that validates a value and returns an error message, or null if valid.
typedef ValidatorCallback = String? Function(String?);

/// A utility class providing common form validation functions.
class Validators {
  Validators._();

  /// Validates an email address. Returns an error message if null, empty, or invalid.
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Please enter an email';
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value)) return 'Please enter a valid email';
    return null;
  }

  /// Validates that a value is non-null and non-empty. Returns an error message if empty.
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  /// Returns a validator that checks the value has at least [length] characters.
  static String? Function(String?) minLength(int length) {
    return (String? value) {
      if (value == null || value.length < length) {
        return 'Must be at least $length characters';
      }
      return null;
    };
  }

  /// Validates a phone number format. Returns an error message if null, empty, or invalid.
  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a phone number';
    final regex = RegExp(r'^\+?[\d\s\-()]{7,15}$');
    if (!regex.hasMatch(value)) return 'Please enter a valid phone number';
    return null;
  }
}
