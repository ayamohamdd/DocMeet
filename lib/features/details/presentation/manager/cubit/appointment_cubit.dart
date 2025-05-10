import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';
import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';
import 'package:quest_task/features/details/domain/repos/appointment_repo.dart';
import 'package:quest_task/features/details/domain/use_cases/book_appointment_use_case.dart';
import 'package:quest_task/features/details/presentation/manager/cubit/appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final BookAppointmentUseCase _appointmentUseCase;
  List<AppointmentModel> _bookedAppointments = [];

  AppointmentCubit()
      : _appointmentUseCase = SetupSeviceLocator.sl.get(),
        super(AppointmentInitial());

  Future<void> bookAppointment({
    required String day,
    required String hour,
    required String specialistName,
    String? uid,
  }) async {
    emit(BookingAppointmentLoading());

    final appointment = AppointmentModel(
      day: day,
      hour: hour,
      specialistName: specialistName,
      status: 'booked',
      uid: uid,
    );
    log('model============ ${appointment}');
    final result = await _appointmentUseCase.call(appointment);

    result.fold(
      (failure) => emit(BookingAppointmentError(failure.message)),
      (_) {
        _bookedAppointments.add(appointment);
        emit(BookingAppointmentSuccess());
      },
    );
  }

  bool isSlotBooked(String day, String hour) {
    return _bookedAppointments.any(
      (appointment) =>
          appointment.day == day &&
          appointment.hour == hour &&
          appointment.status == 'booked',
    );
  }

  void updateBookedAppointments(List<AppointmentModel> appointments) {
    _bookedAppointments = appointments.where((app) => app.status == 'booked').toList();
    emit(AppointmentInitial());
  }
}
