import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_details_info_header.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_info_cards_row.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_card/doctor_image.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';

class DoctorDetailsHeader extends StatelessWidget {
  const DoctorDetailsHeader({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(context.screenWidth * 0.15, 0),
          child: DoctorImage(
            imageUrl: specialistEntity.imageUrl!,
            width: context.screenWidth * 0.7,
            height: context.screenHeight * 0.7,
          ),
        ),
        DoctorDetailsInfoHeader(specialistEntity: specialistEntity),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.screenHeight * 0.015),
            child: DoctorInfoCardsRow(specialistEntity: specialistEntity),
          ),
        ),
      ],
    );
  }
}
