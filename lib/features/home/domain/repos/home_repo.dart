import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SpecialistEntity>>> getAllSpecialists();
}
