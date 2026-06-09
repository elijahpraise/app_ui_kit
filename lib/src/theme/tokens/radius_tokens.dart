/// A container for predefined border-radius values (small, medium, large)
/// used consistently across themed widgets.
class RadiusTokens {
  const RadiusTokens({
    required this.small,
    required this.medium,
    required this.large,
  });

  /// Small border radius.
  final double small;

  /// Medium border radius (default for most widgets).
  final double medium;

  /// Large border radius (e.g. dialogs, bottom sheets).
  final double large;
}
