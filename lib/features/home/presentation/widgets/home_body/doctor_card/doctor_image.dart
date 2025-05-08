import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomRight,
      child: Image(
        image: AssetImage("assets/images/doctor2.webp"),
        fit: BoxFit.contain,
      ),
    );
  }
}
