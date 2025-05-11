import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });
  final String imageUrl;
  final double width;
  final double? height;

  static const String _defaultDoctorImage =
      'https://tndrdtnxzkqtuedtpohi.supabase.co/storage/v1/object/public/images//pngtree-doctor-avatar-icon-png-image_15738245.png';

  @override
  Widget build(BuildContext context) {
    log('image $imageUrl');
    return Align(
      alignment: Alignment.bottomRight,
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: AppColors.onPrimary,
            highlightColor: AppColors.onSecondary,
            child: Image.network(
              _defaultDoctorImage,
              fit: BoxFit.contain,
              width: width,
              height: height,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: context.screenWidth * 0.7,
                  height: context.screenHeight * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                );
              },
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          log('Error loading image: $error');
          return Image.network(
            _defaultDoctorImage,
            fit: BoxFit.contain,
            width: context.screenWidth * 0.7,
            height: context.screenHeight * 0.7,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/doctor2.webp",
                fit: BoxFit.contain,
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.7,
              );
            },
          );
        },
      ),
    );
  }
}
