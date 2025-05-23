import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_card/doctor_price.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.068,
      left: context.screenWidth * 0.04,
      child: SizedBox(
        width: context.screenWidth * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${specialistEntity.category}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.onSurfaceDisabled,
              ),
            ),
            Text(
              '${specialistEntity.name}',
              style: AppTextStyles.heading3.copyWith(color: AppColors.surface),
            ),
            DoctorPrice(price: specialistEntity.price!),
          ],
        ),
      ),
    );
  }
}
