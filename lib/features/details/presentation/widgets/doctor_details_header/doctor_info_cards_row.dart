import 'package:flutter/material.dart';
import 'doctor_info_card.dart';

class DoctorInfoCardsRow extends StatelessWidget {
  const DoctorInfoCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        DoctorInfoCard(
          icon: Icons.work_outline,
          value: '12 years',
          label: 'Experience',
        ),
        DoctorInfoCard(
          icon: Icons.star_border,
          value: '4.8',
          label: 'Rating',
        ),
        DoctorInfoCard(
          icon: Icons.person_outline,
          value: '2500+',
          label: 'Patients',
        ),
      ],
    );
  }
} 