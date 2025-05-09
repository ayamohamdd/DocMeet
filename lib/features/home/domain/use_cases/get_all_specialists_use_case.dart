import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/use_cases/use_case.dart';
import 'package:quest_task/features/auth/domain/repos/auth_repo.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/domain/repos/home_repo.dart';

class GetAllSpecialistsUseCase
    extends UseCase<Future<Either<Failure, List<SpecialistEntity>>>, NoParam> {
  final HomeRepo homeRepo;

  GetAllSpecialistsUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<SpecialistEntity>>> call([NoParam? param]) async {
    return await homeRepo.getAllSpecialists();
  }
}
