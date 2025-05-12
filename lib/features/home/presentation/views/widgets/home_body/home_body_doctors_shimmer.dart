import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:quest_task/core/constants/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class HomeBodyDoctorsShimmer extends StatelessWidget {
  const HomeBodyDoctorsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.onPrimary,
      highlightColor: AppColors.onSecondary,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: context.screenHeight * 0.02);
        },
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: context.screenHeight * 0.39,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: context.screenWidth * 0.05,
                  top: context.screenHeight * 0.02,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.screenWidth * 0.4,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.01),
                      Container(
                        width: context.screenWidth * 0.3,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      Container(
                        width: context.screenWidth * 0.5,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: context.screenWidth * 0.05,
                  top: context.screenHeight * 0.02,
                  child: Container(
                    width: context.screenWidth * 0.3,
                    height: context.screenWidth * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: context.screenHeight * 0.02,
                  left: context.screenWidth * 0.05,
                  right: context.screenWidth * 0.05,
                  child: Container(
                    height: context.screenHeight * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
