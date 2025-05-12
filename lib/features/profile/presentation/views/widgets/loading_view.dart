import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.onPrimary,
            highlightColor: AppColors.onSecondary,
            child: Container(
              height: context.screenHeight * 0.25,
              color: AppColors.surface,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.06,
              vertical: context.screenHeight * 0.02,
            ),
            child: Column(
              children: [
                _buildShimmerCard(context),
                SizedBox(height: context.screenHeight * 0.02),
                _buildShimmerCard(context),
                SizedBox(height: context.screenHeight * 0.02),
                _buildShimmerCard(context),
                SizedBox(height: context.screenHeight * 0.04),
                Shimmer.fromColors(
                  baseColor: AppColors.onPrimary,
                  highlightColor: AppColors.onSecondary,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCard(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.onPrimary,
      highlightColor: AppColors.onSecondary,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: AppColors.surface,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: context.screenWidth * 0.4,
                    height: context.screenHeight * 0.1,
                    color: AppColors.surface,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
