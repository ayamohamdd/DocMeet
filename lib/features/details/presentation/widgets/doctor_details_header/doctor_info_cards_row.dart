import 'package:flutter/material.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'doctor_info_card.dart';

class DoctorInfoCardsRow extends StatelessWidget {
  const DoctorInfoCardsRow({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorInfoCard(
          icon: Icons.work_outline,
          value: '${specialistEntity.experienceYears} years',
          label: 'Experience',
        ),
        DoctorInfoCard(
          icon: Icons.star_border,
          value: '${specialistEntity.rating}',
          label: 'Rating',
        ),
        DoctorInfoCard(
          icon: Icons.person_outline,
          value: '${specialistEntity.patientCount}',
          label: 'Patients',
        ),
      ],
    );
  }
}
