import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/styles/text_styles.dart';

class DoctorPrice extends StatelessWidget {
  const DoctorPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$95',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '/session',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.secondaryFontColor,
          ),
        ),
      ],
    );
  }
} 