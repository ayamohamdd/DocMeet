import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_details_info_header.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_info_cards_row.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_image.dart';

class DoctorDetailsHeader extends StatelessWidget {
  const DoctorDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(context.screenWidth * 0.15,0),
          child: const DoctorImage(),
        ),
        const DoctorDetailsInfoHeader(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.screenHeight * 0.015),
            child: const DoctorInfoCardsRow(),
          ),
        ),
      ],
    );
  }
}
