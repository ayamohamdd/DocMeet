import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppointmentLoadingView extends StatelessWidget {
  const AppointmentLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: context.screenHeight * 0.02),
          child: Shimmer.fromColors(
            baseColor: AppColors.onPrimary,
            highlightColor: AppColors.onSecondary,
            child: Container(
              padding: EdgeInsets.all(context.screenWidth * 0.04),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: context.screenWidth * 0.15,
                        height: context.screenWidth * 0.15,
                        decoration: const BoxDecoration(
                          color: AppColors.surface,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: context.screenHeight * 0.02,
                              color: AppColors.surface,
                            ),
                            SizedBox(height: context.screenHeight * 0.01),
                            Container(
                              width: context.screenWidth * 0.3,
                              height: context.screenHeight * 0.018,
                              color: AppColors.surface,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Container(
                    width: double.infinity,
                    height: context.screenHeight * 0.018,
                    color: AppColors.surface,
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  Container(
                    width: context.screenWidth * 0.5,
                    height: context.screenHeight * 0.018,
                    color: AppColors.surface,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: context.screenWidth * 0.25,
                        height: context.screenHeight * 0.045,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(
                            context.screenWidth * 0.02,
                          ),
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.03),
                      Container(
                        width: context.screenWidth * 0.25,
                        height: context.screenHeight * 0.045,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(
                            context.screenWidth * 0.02,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
