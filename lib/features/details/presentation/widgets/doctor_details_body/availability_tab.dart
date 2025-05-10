import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/details/presentation/manager/cubit/appointment_state.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/day_chip.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/time_grid.dart';
import 'package:quest_task/core/utils/widgets/primary_button.dart';
import 'package:quest_task/features/details/presentation/manager/cubit/appointment_cubit.dart';

class AvailabilityTab extends StatefulWidget {
  const AvailabilityTab({super.key, required this.specialistEntity});

  final SpecialistEntity specialistEntity;

  @override
  State<AvailabilityTab> createState() => _AvailabilityTabState();
}

class _AvailabilityTabState extends State<AvailabilityTab> {
  String? selectedDay;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
        vertical: context.screenHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDaySelector(),
          if (selectedDay != null) ...[
            SizedBox(height: context.screenHeight * 0.03),
            _buildTimeSelector(),
            SizedBox(height: context.screenHeight * 0.03),
            _buildBookingButton(),
            SizedBox(height: context.screenHeight * 0.1),
          ],
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Day', style: AppTextStyles.bodyLarge),
        SizedBox(height: context.screenHeight * 0.02),
        SizedBox(
          height: context.screenHeight * 0.06,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.specialistEntity.availabilityDays?.length ?? 0,
            itemBuilder: (context, index) {
              final day = widget.specialistEntity.availabilityDays?[index].day;
              return DayChip(
                day: day ?? '',
                isSelected: day == selectedDay,
                onSelected: (selected) {
                  setState(() {
                    selectedDay = selected ? day : null;
                    selectedTime = null;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Hours for $selectedDay',
          style: AppTextStyles.bodyLarge,
        ),
        SizedBox(height: context.screenHeight * 0.02),
        TimeGrid(
          selectedDay: selectedDay!,
          availabilityDays: widget.specialistEntity.availabilityDays ?? [],
          selectedTime: selectedTime,
          onTimeSelected: (time) {
            setState(() {
              selectedTime = time;
            });
          },
        ),
      ],
    );
  }

  Widget _buildBookingButton() {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId == null) {
          return const Text(
            'Please sign in to book an appointment',
            style: TextStyle(color: Colors.red),
          );
        }

        return Column(
          children: [
            PrimaryButton(
              text: 'Book Now',
              onPressed:
                  selectedTime == null
                      ? null
                      : () {
                        context.read<AppointmentCubit>().bookAppointment(
                          day: selectedDay!,
                          hour: selectedTime!,
                          specialistName: widget.specialistEntity.name ?? '',
                          uid: userId,
                        );
                      },
            ),
            if (state is BookingAppointmentLoading)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: CircularProgressIndicator(),
              ),
            if (state is BookingAppointmentError)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  state.message,
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.red),
                ),
              ),
            if (state is BookingAppointmentSuccess)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Appointment booked successfully!',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.green),
                ),
              ),
          ],
        );
      },
    );
  }
}
