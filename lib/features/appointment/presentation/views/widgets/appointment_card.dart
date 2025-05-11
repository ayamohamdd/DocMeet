import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/doctor_card/doctor_image.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  // final VoidCallback? onReschedule;
  final VoidCallback? onCancel;

  const AppointmentCard({
    super.key,
    required this.appointment,
    // this.onReschedule,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.3,
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.02,
        vertical: context.screenHeight * 0.01,
      ),
      child: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DoctorImage(
                  imageUrl: appointment.specialistImageUrl!,
                  width: context.screenWidth * 0.15,
                  height: context.screenWidth * 0.15,
                ),
                SizedBox(width: context.screenWidth * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.specialistName ?? 'Unknown Specialist',
                        style: AppTextStyles.heading3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.02),
            _buildInfoRow(context, 'Date', appointment.day ?? 'Not specified'),
            SizedBox(height: context.screenHeight * 0.01),
            _buildInfoRow(context, 'Time', appointment.hour ?? 'Not specified'),
            SizedBox(height: context.screenHeight * 0.01),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.04,
                    vertical: context.screenHeight * 0.01,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: AppTextStyles.label.copyWith(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: AppTextStyles.label.copyWith(color: Colors.grey),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
