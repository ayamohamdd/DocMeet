import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/use_cases/use_case.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';
import 'package:quest_task/features/appointment/domain/repos/appointment_repo.dart';

class FetchUserAppointmentsUseCase
    extends UseCase<Future<Either<Failure, List<AppointmentModel>>>, String?> {
  final AppointmentRepo appointmentRepo;

  FetchUserAppointmentsUseCase({required this.appointmentRepo});

  @override
  Future<Either<Failure, List<AppointmentModel>>> call([String? userId]) async {
    return await appointmentRepo.fetchUserAppointments(userId!);
  }
}
