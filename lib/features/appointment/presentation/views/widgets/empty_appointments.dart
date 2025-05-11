import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class EmptyAppointments extends StatelessWidget {
  const EmptyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: context.screenWidth * 0.2,
              color: AppColors.primary.withOpacity(0.5),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'No Appointments',
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Text(
              'You haven\'t scheduled any appointments yet',
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to book appointment screen
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.06,
                  vertical: context.screenHeight * 0.015,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Book an Appointment',
                style: AppTextStyles.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 