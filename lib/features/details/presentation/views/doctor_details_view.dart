import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/styles/text_styles.dart';
import 'package:quest_task/core/widgets/header_action_button.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/doctor_details_body.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_details_header.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_details_info_header.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_image.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/doctor_card/doctor_price.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_info_cards_row.dart';

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
              SizedBox(
                height: context.screenHeight * 0.45,
                child: const DoctorDetailsHeader(),
              ),
              DoctorDetailsBody(),
            ],
          ),
        ),
      ),
    );
  }
}
