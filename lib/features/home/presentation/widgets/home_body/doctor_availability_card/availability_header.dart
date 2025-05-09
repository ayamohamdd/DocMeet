import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class AvailabilityHeader extends StatelessWidget {
  final String month;
  final int slotsCount;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  const AvailabilityHeader({
    super.key,
    required this.month,
    required this.slotsCount,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.screenWidth * 0.05,
        right: context.screenWidth * 0.05,
        top: context.screenHeight * 0.012,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Availability',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' .  $slotsCount slots',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onPreviousMonth,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 10,
                  color: AppColors.surface,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 15,
              ),

              Text(
                month,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.5,
                ),
                // overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                onPressed: onNextMonth,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: AppColors.surface,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
