import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_card.dart';

class HomeBodyDoctorsList extends StatelessWidget {
  const HomeBodyDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: context.screenHeight * 0.02);
      },
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const DoctorCard();
      },
    );
  }
}
