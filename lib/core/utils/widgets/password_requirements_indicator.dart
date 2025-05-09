import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class PasswordRequirement {
  final String text;
  final bool isMet;
  final String regex;

  const PasswordRequirement({
    required this.text,
    required this.isMet,
    required this.regex,
  });
}

class PasswordRequirementsIndicator extends StatelessWidget {
  final String password;

  const PasswordRequirementsIndicator({super.key, required this.password});

  List<PasswordRequirement> _getRequirements() {
    return [
      PasswordRequirement(
        text: 'At least 8 characters',
        isMet: password.length >= 8,
        regex: r'.{8,}',
      ),
      PasswordRequirement(
        text: 'At least one uppercase letter',
        isMet: password.contains(RegExp(r'[A-Z]')),
        regex: r'[A-Z]',
      ),
      PasswordRequirement(
        text: 'At least one number',
        isMet: password.contains(RegExp(r'[0-9]')),
        regex: r'[0-9]',
      ),
      PasswordRequirement(
        text: 'At least one special character',
        isMet: password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
        regex: r'[!@#$%^&*(),.?":{}|<>]',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) {
      return const SizedBox.shrink();
    }

    final requirements = _getRequirements();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password Requirements:',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ...requirements.map(
          (requirement) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Icon(
                  requirement.isMet
                      ? Icons.check_circle_outline
                      : Icons.circle_outlined,
                  size: 16,
                  color:
                      requirement.isMet
                          ? Colors.green
                          : AppColors.onSurfaceDisabled,
                ),
                const SizedBox(width: 8),
                Text(
                  requirement.text,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        requirement.isMet
                            ? Colors.green
                            : AppColors.onSurfaceDisabled,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
