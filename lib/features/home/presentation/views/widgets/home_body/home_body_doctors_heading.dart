import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class HomeBodyDoctorsHeading extends StatelessWidget {
  const HomeBodyDoctorsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Top Doctors', style: AppTextStyles.heading3),
        TextButton(
          onPressed: () {},
          child: Text(
            "See More",
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
