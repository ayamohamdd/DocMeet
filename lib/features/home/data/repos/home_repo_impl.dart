import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/home/data/data_source/home_data_source.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl({required this.homeDataSource});
  @override
  Future<Either<Failure, List<SpecialistEntity>>> getAllSpecialists() async {
    try {
      final response = await homeDataSource.getAllSpecialist();
      return right(response);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      log('eror ${e.toString()}');
      return left(
        const AuthFailure(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        ),
      );
    }
  }
}
