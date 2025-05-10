import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class DoctorPrice extends StatelessWidget {
  const DoctorPrice({super.key, required this.price});
  final int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$$price',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.surfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '/session',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.onSurfaceDisabled,
          ),
        ),
      ],
    );
  }
}
