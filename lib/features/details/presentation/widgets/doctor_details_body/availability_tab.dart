import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/day_chip.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/time_grid.dart';

/// A widget that displays the availability schedule for a specialist.
/// It allows users to select a day and view available time slots for that day.
class AvailabilityTab extends StatefulWidget {
  const AvailabilityTab({super.key, required this.specialistEntity});

  final SpecialistEntity specialistEntity;

  @override
  State<AvailabilityTab> createState() => _AvailabilityTabState();
}

class _AvailabilityTabState extends State<AvailabilityTab> {
  String? selectedDay;
  String? selectedTime;

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
          _buildDaySelector(),
          if (selectedDay != null) ...[
            SizedBox(height: context.screenHeight * 0.03),
            _buildTimeSelector(),
          ],
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Day', style: AppTextStyles.bodyLarge),
        SizedBox(height: context.screenHeight * 0.02),
        SizedBox(
          height: context.screenHeight * 0.06,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.specialistEntity.availabilityDays?.length ?? 0,
            itemBuilder: (context, index) {
              final day = widget.specialistEntity.availabilityDays?[index].day;
              return DayChip(
                day: day ?? '',
                isSelected: day == selectedDay,
                onSelected: (selected) {
                  setState(() {
                    selectedDay = selected ? day : null;
                    selectedTime = null;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Hours for $selectedDay',
          style: AppTextStyles.bodyLarge,
        ),
        SizedBox(height: context.screenHeight * 0.02),
        TimeGrid(
          selectedDay: selectedDay!,
          availabilityDays: widget.specialistEntity.availabilityDays ?? [],
          selectedTime: selectedTime,
          onTimeSelected: (time) {
            setState(() {
              selectedTime = time;
            });
          },
        ),
      ],
    );
  }
}
