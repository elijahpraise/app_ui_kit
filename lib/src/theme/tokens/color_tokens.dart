import '../color_values.dart';

/// A token wrapper around [AppColors] providing convenient access to the
/// color values.
class ColorTokens {
  const ColorTokens(this.values);

  /// The underlying [AppColors] instance.
  final AppColors values;

  /// Short-hand getter for the underlying [AppColors] values.
  AppColors get $ => values;
}
