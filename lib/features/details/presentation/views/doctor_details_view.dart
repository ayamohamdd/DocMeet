import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/widgets/header_action_button.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_image.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
            vertical: context.screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderActionButton(
                icon: Icons.arrow_back,
                iconSize: 20,
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              Container(
                height: context.screenHeight * 0.4,
                child: Stack(children: [DoctorImage()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
