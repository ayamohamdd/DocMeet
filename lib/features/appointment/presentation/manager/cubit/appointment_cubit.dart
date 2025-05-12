import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/core/services/storage_service.dart';
import 'package:quest_task/features/appointment/domain/use_cases/fetch_user_appointments_use_case.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';
import 'package:quest_task/features/appointment/domain/use_cases/book_appointment_use_case.dart';
import 'package:quest_task/features/appointment/domain/use_cases/cancel_appointment_use_case.dart';
import 'package:quest_task/features/appointment/domain/use_cases/reschedule_appointment_use_case.dart';
import 'package:quest_task/features/appointment/presentation/manager/cubit/appointment_state.dart';
import 'package:quest_task/features/home/data/models/specialist_model.dart';
import 'package:quest_task/core/services/firestore_service.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final BookAppointmentUseCase _bookAppointmentUseCase;
  final FetchUserAppointmentsUseCase _fetchUserAppointmentsUseCase;
  final CancelAppointmentUseCase _cancelAppointmentUseCase;
  final RescheduleAppointmentUseCase _rescheduleAppointmentUseCase;
  final StorageService _storageService;
  final _specialistService = FirestoreService<SpecialistModel>(
    collection: 'specialists',
    fromJson: SpecialistModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );
  List<AppointmentModel> _bookedAppointments = [];

  AppointmentCubit()
    : _bookAppointmentUseCase = SetupSeviceLocator.sl.get(),
      _fetchUserAppointmentsUseCase = SetupSeviceLocator.sl.get(),
      _cancelAppointmentUseCase = SetupSeviceLocator.sl.get(),
      _rescheduleAppointmentUseCase = SetupSeviceLocator.sl.get(),
      _storageService = SetupSeviceLocator.sl.get(),
      super(AppointmentInitial());

  Future<void> bookAppointment({
    required String day,
    required String hour,
    required String specialistId,
    required String specialistName,
    required String specialistImage,
    String? uid,
  }) async {
    emit(BookingAppointmentLoading());

    final appointment = AppointmentModel(
      day: day,
      hour: hour,
      specialistId: specialistId,
      specialistName: specialistName,
      specialistImageUrl: specialistImage,
      status: 'booked',
      uid: uid,
    );
    final result = await _bookAppointmentUseCase.call(appointment);

    result.fold((failure) => emit(BookingAppointmentError(failure.message)), (
      _,
    ) {
      _bookedAppointments.add(appointment);
      emit(BookingAppointmentSuccess());
    });
  }

  Future<void> cancelAppointment(String appointmentId) async {
    emit(CancelingAppointmentLoading());
    final result = await _cancelAppointmentUseCase.call(appointmentId);
    result.fold(
      (failure) => emit(CancelingAppointmentError(failure.toString())),
      (_) {
        emit(CancelingAppointmentSuccess());
        fetchUserAppointments();
      },
    );
  }

  Future<void> rescheduleAppointment({
    required String appointmentId,
    required String newDay,
    required String newHour,
  }) async {
    emit(ReschedulingAppointmentLoading());
    final params = RescheduleAppointmentParams(
      appointmentId: appointmentId,
      newDay: newDay,
      newHour: newHour,
    );
    final result = await _rescheduleAppointmentUseCase.call(params);
    result.fold(
      (failure) => emit(ReschedulingAppointmentError(failure.toString())),
      (_) {
        emit(ReschedulingAppointmentSuccess());
        fetchUserAppointments();
      },
    );
  }

  Future<SpecialistModel?> refreshSpecialist(String specialistId) async {
    try {
      final specialist = await _specialistService.get(specialistId);
      if (specialist != null) {
        log(
          'Refreshed specialist data: ${specialist.name} (ID: ${specialist.id})',
        );
        log(
          'Updated availability: ${specialist.availabilityDays?.map((d) => '${d.day}: ${d.hours}').join(', ')}',
        );
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
    _bookedAppointments =
        appointments.where((app) => app.status == 'booked').toList();
    emit(AppointmentInitial());
  }

  Future<void> fetchUserAppointments() async {
    emit(FetchUserAppointmentsLoading());
    final String? userId = _storageService.getUserId();

    final result = await _fetchUserAppointmentsUseCase(userId);
    result.fold(
      (failure) => emit(FetchUserAppointmentsFiled(error: failure.message)),
      (appointments) =>
          emit(FetchUserAppointmentsSuccess(appointments: appointments)),
    );
  }
}
