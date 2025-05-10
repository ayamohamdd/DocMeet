import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class DayChip extends StatelessWidget {
  const DayChip({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onSelected,
  });

  final String day;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.screenWidth * 0.02),
      child: ChoiceChip(
        label: Text(day),
        selected: isSelected,
        onSelected: onSelected,
        backgroundColor: AppColors.surfaceVariant,
        selectedColor: AppColors.primary,
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: isSelected ? Colors.white : AppColors.onSurface,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.03,
          vertical: context.screenHeight * 0.01,
        ),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.onPrimary,
          width: 1.5,
        ),
      ),
    );
  }
}
