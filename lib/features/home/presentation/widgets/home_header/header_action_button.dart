import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const HeaderActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.surface,
        child: Icon(icon, color: AppColors.onSurface),
      ),
    );
  }
}
