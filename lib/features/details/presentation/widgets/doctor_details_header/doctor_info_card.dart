import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';

class DoctorInfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const DoctorInfoCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.29,
      height: context.screenHeight * 0.12,
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.03,
        vertical: context.screenHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundbluredColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(icon, color: AppColors.onSurface, size: 28),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.01),
              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.screenHeight * 0.004),
              Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
