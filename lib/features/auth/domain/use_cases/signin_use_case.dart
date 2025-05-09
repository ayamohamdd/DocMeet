import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/use_cases/use_case.dart';
import 'package:quest_task/features/auth/domain/repos/auth_repo.dart';

class SignInUseCase extends UseCase<Future<Either<Failure, String>>, String> {
  final AuthRepo authRepo;

  SignInUseCase({required this.authRepo});

  @override
  Future<Either<Failure, String>> call([String? param, String? param1]) async {
    return await authRepo.signIn(param!, param1!);
  }
}
