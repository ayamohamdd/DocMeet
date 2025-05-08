import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/styles/text_styles.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_availability_card/doctor_availability_card.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_info.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_image.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.39,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Stack(
        children: [
          DoctorInfo(),
          DoctorImage(),
          DoctorAvailabilityCard()
        ],
      ),
    );
  }
} 