import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_card/doctor_card.dart';

class HomeBodyDoctorsList extends StatelessWidget {
  const HomeBodyDoctorsList({super.key, required this.specialists});
  final List<SpecialistEntity> specialists;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: context.screenHeight * 0.02);
      },
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: specialists.length,
      itemBuilder: (context, index) {
        return DoctorCard(specialist: specialists[index]);
      },
    );
  }
}
