import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/styles/text_styles.dart';
import 'package:quest_task/core/widgets/frosted_container.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_availability_card/availability_header.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_availability_card/date_selection_widget.dart';

class DoctorAvailabilityCard extends StatefulWidget {
  const DoctorAvailabilityCard({super.key});

  @override
  State<DoctorAvailabilityCard> createState() => _DoctorAvailabilityCardState();
}

class _DoctorAvailabilityCardState extends State<DoctorAvailabilityCard> {
  int selectedDateIndex = 0;
  DateTime currentMonth = DateTime(2024, 8); // Starting with August 2024

  void _onDateSelected(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  void _onPreviousMonth() {
    log("hello");
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  void _onNextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  String _formatMonthYear(DateTime date) {
    return _getMonthName(date.month);
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
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
              AvailabilityHeader(
                month: _formatMonthYear(currentMonth),
                slotsCount: 7,
                onPreviousMonth: _onPreviousMonth,
                onNextMonth: _onNextMonth,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.02,
                ),
                child: DateSelectionWidget(
                  selectedIndex: selectedDateIndex,
                  onDateSelected: _onDateSelected,
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
    this.color = AppColors.backgroundbluredColor,
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
