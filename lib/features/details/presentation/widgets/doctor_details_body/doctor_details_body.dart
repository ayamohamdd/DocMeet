import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.8,
      decoration: BoxDecoration(
        color: AppColors.onSecondary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,

          vertical: context.screenHeight * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: AppTextStyles.heading2.copyWith(
                color: AppColors.primary,
                fontSize: 20,
              ),
            ),
            Container(
              height: 1,
              width: context.screenHeight * 0.08,
              decoration: BoxDecoration(color: AppColors.primary),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              "${specialistEntity.bio}",
              style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
