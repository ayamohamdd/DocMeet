import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';

import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_availability_card/availability_header.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_availability_card/date_selection_widget.dart';

class DoctorAvailabilityCard extends StatefulWidget {
  const DoctorAvailabilityCard({super.key, required this.availability});
  final List<AvailabilityDayEntity> availability;
  @override
  State<DoctorAvailabilityCard> createState() => _DoctorAvailabilityCardState();
}

class _DoctorAvailabilityCardState extends State<DoctorAvailabilityCard> {
  int selectedDateIndex = 0;
  // DateTime currentMonth = DateTime(2025, 5);

  void _onDateSelected(int index) {
    if (index >= 0 && index < widget.availability.length) {
      setState(() {
        selectedDateIndex = index;
      });
    }
  }

  int _getSlotsCount() {
    if (widget.availability.isEmpty) {
      return 0;
    }

    if (selectedDateIndex >= widget.availability.length) {
      selectedDateIndex = 0;
    }

    final selectedDay = widget.availability[selectedDateIndex];
    final slotsCount = selectedDay.hours?.where((hour) => hour['status'] == 'available').length ?? 0;
    return slotsCount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FrostedContainer(
          child: Column(
            children: [
              AvailabilityHeader(slotsCount: _getSlotsCount()),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.02,
                ),
                child: DateSelectionWidget(
                  selectedIndex: selectedDateIndex,
                  onDateSelected: _onDateSelected,
                  availability: widget.availability,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FrostedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final Color color;

  const FrostedContainer({
    super.key,
    required this.child,
    this.borderRadius = 30,
    this.blur = 5,
    this.color = AppColors.surfaceBlurred,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: double.infinity,
          height: context.screenHeight * 0.18,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(5),
              topRight: const Radius.circular(5),
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
