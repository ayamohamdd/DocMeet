import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';

class DateSelectionWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDateSelected;
  final List<AvailabilityDayEntity> availability;

  const DateSelectionWidget({
    super.key,
    this.selectedIndex = 0,
    required this.onDateSelected,
    required this.availability,
  });

  bool _isDayAvailable(String day) {
    final dayAvailability = availability.firstWhere(
      (a) => a.day?.toLowerCase() == day.toLowerCase(),
      orElse: () => AvailabilityDayEntity(),
    );
    return (dayAvailability.hours?.isNotEmpty ?? false);
  }

  int _getAvailabilityIndex(String day) {
    return availability.indexWhere(
      (a) => a.day?.toLowerCase() == day.toLowerCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];

    return SizedBox(
      height: context.screenHeight * 0.095,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        separatorBuilder:
            (context, index) => SizedBox(width: context.screenWidth * 0.02),
        itemBuilder: (context, index) {
          final day = weekDays[index];
          final isAvailable = _isDayAvailable(day);
          final availabilityIndex =
              isAvailable ? _getAvailabilityIndex(day) : -1;
          final isSelected = isAvailable && availabilityIndex == selectedIndex;

          return GestureDetector(
            onTap: isAvailable ? () => onDateSelected(availabilityIndex) : null,
            child: Container(
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.surface : AppColors.surfaceBlurred,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      day.substring(0, 3),
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isAvailable
                                ? AppColors.onSurface
                                : AppColors.onSurface.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: context.screenWidth * 0.09,
                      height: context.screenWidth * 0.09,
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? AppColors.primary
                                : AppColors.surfaceBlurred,
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.surfaceBlurred,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected
                                  ? AppColors.surface
                                  : isAvailable
                                  ? AppColors.onSurface
                                  : AppColors.onSurface.withOpacity(0.5),
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
