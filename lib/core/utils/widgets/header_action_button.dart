import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;

  const HeaderActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size ?? 20,
        backgroundColor: backgroundColor ?? AppColors.surface,
        child: Icon(
          icon,
          color: iconColor ?? AppColors.onSurface,
          size: iconSize ?? 20,
        ),
      ),
    );
  }
}
