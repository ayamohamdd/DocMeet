import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';

class DoctorDetailsInfoHeader extends StatelessWidget {
  const DoctorDetailsInfoHeader({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.07,
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
                  specialistEntity.category ?? '',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                Text(specialistEntity.name ?? '', style: AppTextStyles.heading2),
              ],
            ),

          
            SizedBox(height: context.screenHeight * 0.02),
            Row(
              children: [
                Text(
                  '\$${specialistEntity.price}',
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
