import 'package:flutter/material.dart';

enum PasswordStrength { weak, fair, good, strong }

extension PasswordStrengthLabel on PasswordStrength {
  String get label {
    return switch (this) {
      PasswordStrength.weak => 'Weak',
      PasswordStrength.fair => 'Fair',
      PasswordStrength.good => 'Good',
      PasswordStrength.strong => 'Strong',
    };
  }

  Color resolveColor(ThemeData theme) {
    return switch (this) {
      PasswordStrength.weak => theme.colorScheme.error,
      PasswordStrength.fair => Colors.orange,
      PasswordStrength.good => Colors.amber,
      PasswordStrength.strong => const Color(0xFF10B981),
    };
  }

  double get progress {
    return switch (this) {
      PasswordStrength.weak => 0.25,
      PasswordStrength.fair => 0.5,
      PasswordStrength.good => 0.75,
      PasswordStrength.strong => 1.0,
    };
  }
}

class PasswordStrengthChecker extends StatelessWidget {
  const PasswordStrengthChecker({
    super.key,
    required this.password,
    this.showLabel = true,
    this.height = 4,
    this.radius,
  });

  final String password;
  final bool showLabel;
  final double height;
  final double? radius;

  PasswordStrength get _strength {
    if (password.isEmpty) return PasswordStrength.weak;

    int score = 0;
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[a-z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;

    if (score <= 2) return PasswordStrength.weak;
    if (score <= 3) return PasswordStrength.fair;
    if (score <= 5) return PasswordStrength.good;
    return PasswordStrength.strong;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strength = _strength;
    final color = strength.resolveColor(theme);

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
      ],
    );
  }
}
