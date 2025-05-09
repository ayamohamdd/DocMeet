import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

enum PasswordStrength {
  weak,
  medium,
  strong,
}

class PasswordStrengthIndicator extends StatelessWidget {
  final PasswordStrength strength;

  const PasswordStrengthIndicator({
    super.key,
    required this.strength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStrengthBar(0, strength == PasswordStrength.weak),
        const SizedBox(width: 4),
        _buildStrengthBar(1, strength == PasswordStrength.medium || strength == PasswordStrength.strong),
        const SizedBox(width: 4),
        _buildStrengthBar(2, strength == PasswordStrength.strong),
        const SizedBox(width: 8),
        Text(
          _getStrengthText(),
          style: TextStyle(
            color: _getStrengthColor(),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStrengthBar(int index, bool isActive) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: isActive ? _getStrengthColor() : AppColors.onSurfaceDisabled,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  String _getStrengthText() {
    switch (strength) {
      case PasswordStrength.weak:
        return 'Weak';
      case PasswordStrength.medium:
        return 'Medium';
      case PasswordStrength.strong:
        return 'Strong';
    }
  }

  Color _getStrengthColor() {
    switch (strength) {
      case PasswordStrength.weak:
        return AppColors.error;
      case PasswordStrength.medium:
        return Colors.orange;
      case PasswordStrength.strong:
        return Colors.green;
    }
  }
} 