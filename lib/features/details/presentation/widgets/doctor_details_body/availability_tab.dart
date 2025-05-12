import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/appointment/presentation/manager/cubit/appointment_state.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/day_chip.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_widgets/time_grid.dart';
import 'package:quest_task/core/utils/widgets/primary_button.dart';
import 'package:quest_task/features/appointment/presentation/manager/cubit/appointment_cubit.dart';

class AvailabilityTab extends StatefulWidget {
  const AvailabilityTab({super.key, required this.specialistEntity});

  final SpecialistEntity specialistEntity;

  @override
  State<AvailabilityTab> createState() => _AvailabilityTabState();
}

class _AvailabilityTabState extends State<AvailabilityTab> {
  String? selectedDay;
  String? selectedTime;
  late SpecialistEntity _currentSpecialist;

  @override
  void initState() {
    super.initState();
    _currentSpecialist = widget.specialistEntity;
  }

  void _updateSpecialist(SpecialistEntity updatedSpecialist) {
    setState(() {
      _currentSpecialist = updatedSpecialist;
      if (selectedDay != null && selectedTime != null) {
        final day = _currentSpecialist.availabilityDays?.firstWhere(
          (d) => d.day == selectedDay,
        );
        if (day != null) {
          final hour = day.hours?.firstWhere(
            (h) => h['hour'] == selectedTime && h['status'] == 'available',
          );
          if (hour == null) {
            selectedTime = null;
          }
        }
      }
    });
  }

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
            itemCount: _currentSpecialist.availabilityDays?.length ?? 0,
            itemBuilder: (context, index) {
              final day = _currentSpecialist.availabilityDays?[index].day;
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
          availabilityDays: _currentSpecialist.availabilityDays ?? [],
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
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is BookingAppointmentSuccess) {
          context
              .read<AppointmentCubit>()
              .refreshSpecialist(_currentSpecialist.id!)
              .then((updatedSpecialist) {
                if (updatedSpecialist != null) {
                  _updateSpecialist(updatedSpecialist);
                }
              });
        }
      },
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
              isLoading: state is BookingAppointmentLoading,
              onPressed:
                  selectedTime == null
                      ? null
                      : () {
                        context.read<AppointmentCubit>().bookAppointment(
                          day: selectedDay!,
                          hour: selectedTime!,
                          specialistId: _currentSpecialist.id ?? '',
                          specialistImage: _currentSpecialist.imageUrl!,
                          specialistName: _currentSpecialist.name!,
                          uid: userId,
                        );
                      },
            ),
          ],
        );
      },
    );
  }
}
