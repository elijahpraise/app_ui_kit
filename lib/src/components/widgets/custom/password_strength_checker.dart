import 'package:flutter/material.dart';

/// Represents the strength level of a password, from [weak] to [strong].
enum PasswordStrength {
  /// Weak password.
  weak,

  /// Fair password.
  fair,

  /// Good password.
  good,

  /// Strong password.
  strong,
}

/// Provides label, color, and progress resolution for [PasswordStrength].
extension PasswordStrengthLabel on PasswordStrength {
  /// A human-readable label for this strength level.
  String get label {
    return switch (this) {
      PasswordStrength.weak => 'Weak',
      PasswordStrength.fair => 'Fair',
      PasswordStrength.good => 'Good',
      PasswordStrength.strong => 'Strong',
    };
  }

  /// Returns the color associated with this strength level.
  Color resolveColor(ThemeData theme) {
    return switch (this) {
      PasswordStrength.weak => theme.colorScheme.error,
      PasswordStrength.fair => Colors.orange,
      PasswordStrength.good => Colors.amber,
      PasswordStrength.strong => const Color(0xFF10B981),
    };
  }

  /// A 0.0–1.0 progress value for this strength level.
  double get progress {
    return switch (this) {
      PasswordStrength.weak => 0.25,
      PasswordStrength.fair => 0.5,
      PasswordStrength.good => 0.75,
      PasswordStrength.strong => 1.0,
    };
  }
}

/// A single password requirement with a label and a validation function.
class PasswordRequirement {
  /// Creates a [PasswordRequirement] with a [label] and [isMet] checker.
  const PasswordRequirement({
    required this.label,
    required this.isMet,
  });

  /// Human-readable description (e.g. "At least 8 characters").
  final String label;

  /// Whether the given [password] satisfies this requirement.
  final bool Function(String password) isMet;
}

/// A password strength indicator that evaluates a password against
/// length, case, digit, and special character rules.
///
/// Supports custom [requirements] and an optional display of which
/// requirements are met via [showRequirements].
class PasswordStrengthChecker extends StatelessWidget {
  /// Creates a [PasswordStrengthChecker].
  const PasswordStrengthChecker({
    super.key,
    required this.password,
    this.showLabel = true,
    this.height = 4,
    this.radius,
    this.requirements,
    this.showRequirements = false,
  });

  /// The password string to evaluate.
  final String password;
  /// Whether to display the strength label below the bar. Defaults to true.
  final bool showLabel;
  /// Thickness of the progress bar. Defaults to 4.
  final double height;
  /// Border radius of the progress bar. Defaults to 2.
  final double? radius;
  /// Custom password requirements. When null, built-in defaults are used.
  final List<PasswordRequirement>? requirements;
  /// Whether to display the requirement checklist below the bar.
  final bool showRequirements;

  /// The built-in default password requirements.
  static List<PasswordRequirement> get defaultRequirements => const [
    PasswordRequirement(
      label: 'At least 8 characters',
      isMet: _min8,
    ),
    PasswordRequirement(
      label: 'At least 12 characters',
      isMet: _min12,
    ),
    PasswordRequirement(
      label: 'Uppercase letter',
      isMet: _hasUpper,
    ),
    PasswordRequirement(
      label: 'Lowercase letter',
      isMet: _hasLower,
    ),
    PasswordRequirement(
      label: 'Digit',
      isMet: _hasDigit,
    ),
    PasswordRequirement(
      label: 'Special character',
      isMet: _hasSpecial,
    ),
  ];

  static bool _min8(String p) => p.length >= 8;
  static bool _min12(String p) => p.length >= 12;
  static bool _hasUpper(String p) => RegExp(r'[A-Z]').hasMatch(p);
  static bool _hasLower(String p) => RegExp(r'[a-z]').hasMatch(p);
  static bool _hasDigit(String p) => RegExp(r'[0-9]').hasMatch(p);
  static bool _hasSpecial(String p) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(p);

  List<PasswordRequirement> get _effectiveRequirements =>
      requirements ?? defaultRequirements;

  PasswordStrength get _strength {
    final reqs = _effectiveRequirements;
    if (password.isEmpty || reqs.isEmpty) return PasswordStrength.weak;

    final met = reqs.where((r) => r.isMet(password)).length;
    final ratio = met / reqs.length;

    if (ratio <= 0.33) return PasswordStrength.weak;
    if (ratio <= 0.5) return PasswordStrength.fair;
    if (ratio <= 0.83) return PasswordStrength.good;
    return PasswordStrength.strong;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strength = _strength;
    final color = strength.resolveColor(theme);
    final reqs = _effectiveRequirements;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 2),
          child: LinearProgressIndicator(
            value: strength.progress,
            backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: height,
          ),
        ),
        if (showLabel) ...[
          const SizedBox(height: 4),
          Text(
            strength.label,
            style: theme.textTheme.bodySmall?.copyWith(color: color),
          ),
        ],
        if (showRequirements && reqs.isNotEmpty) ...[
          const SizedBox(height: 8),
          ...reqs.map((req) {
            final met = req.isMet(password);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    met ? Icons.check_circle : Icons.radio_button_unchecked,
                    size: 14,
                    color: met
                        ? const Color(0xFF10B981)
                        : theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    req.label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: met
                          ? const Color(0xFF10B981)
                          : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ],
    );
  }
}
