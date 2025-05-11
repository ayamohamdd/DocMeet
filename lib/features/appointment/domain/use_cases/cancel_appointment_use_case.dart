import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/use_cases/use_case.dart';
import 'package:quest_task/features/appointment/domain/repos/appointment_repo.dart';
import 'package:dartz/dartz.dart';

class CancelAppointmentUseCase implements UseCase<Future<Either<Failure, void>>, String> {
  final AppointmentRepo _appointmentRepo;

  CancelAppointmentUseCase(this._appointmentRepo);

  @override
  Future<Either<Failure, void>> call([String? appointmentId]) async {
    return await _appointmentRepo.cancelAppointment(appointmentId!);
  }
} 