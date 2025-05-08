import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/home/presentation/widgets/home_body/home_body.dart';
import 'package:quest_task/features/home/presentation/widgets/home_header/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            children: [
              const HomeHeader(),
              SizedBox(height: context.screenHeight * 0.03),
              const Expanded(
                child: HomeBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
