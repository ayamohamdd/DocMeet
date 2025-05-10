import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class TimeChip extends StatelessWidget {
  const TimeChip({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onSelected,
  });

  final String time;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(time),
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor: AppColors.surfaceVariant,
      selectedColor: AppColors.primary,
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: isSelected ? Colors.white : AppColors.onSurface,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.onPrimary,
        width: 1.5,
      ),
    );
  }
}
