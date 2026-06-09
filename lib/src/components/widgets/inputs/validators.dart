typedef ValidatorCallback = String? Function(String?);

class Validators {
  Validators._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Please enter an email';
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value)) return 'Please enter a valid email';
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  static String? Function(String?) minLength(int length) {
    return (String? value) {
      if (value == null || value.length < length) {
        return 'Must be at least $length characters';
      }
      return null;
    };
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a phone number';
    final regex = RegExp(r'^\+?[\d\s\-()]{7,15}$');
    if (!regex.hasMatch(value)) return 'Please enter a valid phone number';
    return null;
  }
}
