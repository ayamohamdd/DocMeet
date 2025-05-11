import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/use_cases/use_case.dart';
import 'package:quest_task/features/appointment/domain/repos/appointment_repo.dart';
import 'package:dartz/dartz.dart';

class RescheduleAppointmentParams {
  final String appointmentId;
  final String newDay;
  final String newHour;

  RescheduleAppointmentParams({
    required this.appointmentId,
    required this.newDay,
    required this.newHour,
  });
}

class RescheduleAppointmentUseCase implements UseCase<Future<Either<Failure, void>>, RescheduleAppointmentParams> {
  final AppointmentRepo _appointmentRepo;

  RescheduleAppointmentUseCase(this._appointmentRepo);

  @override
  Future<Either<Failure, void>> call([RescheduleAppointmentParams? params]) async {
    return await _appointmentRepo.rescheduleAppointment(
      appointmentId: params!.appointmentId,
      newDay: params.newDay,
      newHour: params.newHour,
    );
  }
} 