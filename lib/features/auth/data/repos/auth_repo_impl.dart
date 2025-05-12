import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/auth/data/data_source/auth_data_source.dart';
import 'package:quest_task/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<Failure, String>> signIn(String email, String password) async {
    try {
      final userId = await authDataSource.signIn(email, password);

      dev.log("userId $userId");
      return right(userId);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(
        const AuthFailure(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> signUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      final userId = await authDataSource.signUp(name, email, password);

      return right(userId);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(
        const AuthFailure(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        ),
      );
    }
  }

  
}
