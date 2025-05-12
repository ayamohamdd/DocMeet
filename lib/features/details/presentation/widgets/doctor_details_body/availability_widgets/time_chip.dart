import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class TimeChip extends StatelessWidget {
  const TimeChip({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onSelected,
    this.isAvailable = true,
  });

  final String time;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(time),
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor:
          isAvailable
              ? AppColors.surfaceVariant
              : AppColors.surfaceVariant.withOpacity(0.5),
      selectedColor: AppColors.primary,
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color:
            isSelected
                ? AppColors.surface
                : isAvailable
                ? AppColors.onSurface
                : AppColors.onSurface.withOpacity(0.5),
      ),
      side: BorderSide(
        color:
            isSelected
                ? AppColors.primary
                : isAvailable
                ? AppColors.onPrimary
                : AppColors.onPrimary.withOpacity(0.5),
        width: 1.5,
      ),
    );
  }
}
