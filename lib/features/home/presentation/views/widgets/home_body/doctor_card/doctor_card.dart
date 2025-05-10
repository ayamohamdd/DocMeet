import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/core/utils/transitions/bottom_to_top_transition.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_availability_card/doctor_availability_card.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_card/doctor_info.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_card/doctor_image.dart';
import 'package:quest_task/features/details/presentation/views/doctor_details_view.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.specialist});
  final SpecialistEntity specialist;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          BottomToTopTransition(
            page: DoctorDetailsView(specialistEntity: specialist),
          ),
        );
      },
      child: Container(
        height: context.screenHeight * 0.39,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            DoctorInfo(specialistEntity: specialist),
            DoctorImage(),
            DoctorAvailabilityCard(
              availability: specialist.availabilityDays ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
