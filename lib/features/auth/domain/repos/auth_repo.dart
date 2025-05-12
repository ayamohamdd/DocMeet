import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signIn(String email, String password);
  Future<Either<Failure, String>> signUp(
    String name,
    String email,
    String password,
  );
  // Future<Either<Failure, void>> signOut();
}
