import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
        vertical: context.screenHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: AppTextStyles.bodyLarge),
          SizedBox(height: context.screenHeight * 0.02),
          Text(
            specialistEntity.bio ?? 'No description available',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
