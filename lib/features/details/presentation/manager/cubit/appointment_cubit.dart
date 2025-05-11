import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';
import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';
import 'package:quest_task/features/details/domain/repos/appointment_repo.dart';
import 'package:quest_task/features/details/domain/use_cases/book_appointment_use_case.dart';
import 'package:quest_task/features/details/presentation/manager/cubit/appointment_state.dart';
import 'package:quest_task/features/home/data/specialist_model/specialist_model.dart';
import 'package:quest_task/core/services/firestore_service.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final BookAppointmentUseCase _appointmentUseCase;
  final _specialistService = FirestoreService<SpecialistModel>(
    collection: 'specialists',
    fromJson: SpecialistModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );
  List<AppointmentModel> _bookedAppointments = [];

  AppointmentCubit()
      : _appointmentUseCase = SetupSeviceLocator.sl.get(),
        super(AppointmentInitial());

  Future<void> bookAppointment({
    required String day,
    required String hour,
    required String specialistId,
    String? uid,
  }) async {
    emit(BookingAppointmentLoading());

    final appointment = AppointmentModel(
      day: day,
      hour: hour,
      specialistId: specialistId,
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

  Future<SpecialistModel?> refreshSpecialist(String specialistId) async {
    try {
      final specialist = await _specialistService.get(specialistId);
      if (specialist != null) {
        log('Refreshed specialist data: ${specialist.name} (ID: ${specialist.id})');
        log('Updated availability: ${specialist.availabilityDays?.map((d) => '${d.day}: ${d.hours}').join(', ')}');
      }
      return specialist;
    } catch (e) {
      log('Error refreshing specialist: $e');
      return null;
    }
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
