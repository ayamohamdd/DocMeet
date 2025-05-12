import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class EmptySpecialists extends StatelessWidget {
  const EmptySpecialists({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services_outlined,
            size: context.screenWidth * 0.2,
            color: AppColors.primary,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          Text(
            'No Specialists Found',
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.01),
          Text(
            'There are no specialists available at the moment.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 