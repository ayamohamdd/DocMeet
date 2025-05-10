import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/time_chip.dart';

class TimeGrid extends StatelessWidget {
  const TimeGrid({
    super.key,
    required this.selectedDay,
    required this.availabilityDays,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final String selectedDay;
  final List<AvailabilityDayEntity> availabilityDays;
  final String? selectedTime;
  final ValueChanged<String?> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    final selectedDayEntity = availabilityDays.firstWhere(
      (element) => element.day == selectedDay,
      orElse: () => AvailabilityDayEntity(hours: []),
    );
    final hours = selectedDayEntity.hours ?? [];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.0,
        crossAxisSpacing: context.screenWidth * 0.02,
        mainAxisSpacing: context.screenHeight * 0.01,
      ),
      itemCount: hours.length,
      itemBuilder: (context, index) {
        final time = hours[index];
        return TimeChip(
          time: time,
          isSelected: time == selectedTime,
          onSelected: (selected) {
            onTimeSelected(selected ? time : null);
          },
        );
      },
    );
  }
}
