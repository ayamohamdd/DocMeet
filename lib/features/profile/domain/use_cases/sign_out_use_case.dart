import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/profile/domain/repos/profile_repo.dart';

class SignOutUseCase {
  final ProfileRepo _profileRepo;

  SignOutUseCase(this._profileRepo);

  Future<Either<Failure, void>> call() async {
    return await _profileRepo.signOut();
  }
} 