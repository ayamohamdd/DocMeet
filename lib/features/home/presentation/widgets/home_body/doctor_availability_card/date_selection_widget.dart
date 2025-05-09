import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class DateSelectionWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDateSelected;

  const DateSelectionWidget({
    super.key,
    this.selectedIndex = 0,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final weekDays = [
      {'day': 'Mon', 'date': 16},
      {'day': 'Tue', 'date': 17},
      {'day': 'Wed', 'date': 18},
      {'day': 'Thu', 'date': 19},
      {'day': 'Fri', 'date': 20},
      {'day': 'Sat', 'date': 21},
      {'day': 'Sun', 'date': 22},
    ];

    return SizedBox(
      height: context.screenHeight * 0.095,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: context.screenWidth * 0.02),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onDateSelected(index),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.surface
                    : AppColors.surfaceBlurred,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      weekDays[index]['day'].toString(),
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: context.screenWidth * 0.09,
                      height: context.screenWidth * 0.09,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.surfaceBlurred,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.surfaceBlurred,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        weekDays[index]['date'].toString(),
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.surface
                              : AppColors.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 