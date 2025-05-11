import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, void>> bookAppointment(AppointmentModel appointment);
  Future<Either<Failure, List<AppointmentModel>>> fetchUserAppointments(String? userId);
  Future<Either<Failure, void>> cancelAppointment(String appointmentId);
  Future<Either<Failure, void>> rescheduleAppointment({
    required String appointmentId,
    required String newDay,
    required String newHour,
  });
}
