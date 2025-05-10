import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, void>> bookAnAppointment(
    AppointmentEntity appointmentEntity,
  );
}
