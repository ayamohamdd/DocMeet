import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/profile/domain/entities/user_entity.dart';
import 'package:quest_task/features/profile/domain/repos/profile_repo.dart';

class GetUserDataUseCase {
  final ProfileRepo _profileRepo;

  GetUserDataUseCase(this._profileRepo);

  Future<Either<Failure, UserEntity>> call(String userId) async {
    return await _profileRepo.getUserData(userId);
  }
} 