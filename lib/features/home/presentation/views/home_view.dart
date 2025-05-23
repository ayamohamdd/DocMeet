import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/home_body.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_header/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceVariant,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.screenWidth * 0.05,
            right: context.screenWidth * 0.05,
            top: context.screenHeight * 0.03,
          ),
          child: Column(
            children: [
              const HomeHeader(),
              SizedBox(height: context.screenHeight * 0.03),
              const Expanded(child: HomeBody()),
            ],
          ),
        ),
      ),
    );
  }
}
