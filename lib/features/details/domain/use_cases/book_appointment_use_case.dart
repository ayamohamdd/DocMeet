import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/use_cases/use_case.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';
import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';
import 'package:quest_task/features/details/domain/repos/appointment_repo.dart';
class BookAppointmentUseCase
    extends UseCase<Future<Either<Failure, void>>, AppointmentModel> {
  final AppointmentRepo appointmentRepo;

  BookAppointmentUseCase({required this.appointmentRepo});

  @override
  Future<Either<Failure, void>> call([
    AppointmentModel? appointmentModel,
  ]) async {
    return await appointmentRepo.bookAnAppointment(appointmentModel!);
  }
}
