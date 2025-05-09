import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class DoctorDetailsInfoHeader extends StatelessWidget {
  const DoctorDetailsInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.028,
      child: SizedBox(
        width: context.screenWidth * 0.35,
        height: context.screenHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Neurologist',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                Text('Dr. William James', style: AppTextStyles.heading2),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.01),
            Text(
              "MBBS, MD (Neuro), DM (Neurology), FRCP (UK), FINS, FAAN (USA)",
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.onSurfaceVariant,
                fontSize: 12
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Row(
              children: [
                Text(
                  '\$95',
                  style: AppTextStyles.heading2.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/session',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
