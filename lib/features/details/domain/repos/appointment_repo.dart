import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, void>> bookAnAppointment(
    AppointmentModel appointmentModel,
  );
}
