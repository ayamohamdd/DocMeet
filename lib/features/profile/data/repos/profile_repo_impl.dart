import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/profile/data/data_source/profile_data_source.dart';
import 'package:quest_task/features/profile/data/models/user_model.dart';
import 'package:quest_task/features/profile/domain/entities/user_entity.dart';
import 'package:quest_task/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource _profileDataSource;

  ProfileRepoImpl({required ProfileDataSource profileDataSource})
      : _profileDataSource = profileDataSource;

  @override
  Future<Either<Failure, UserEntity>> getUserData(String userId) async {
    try {
      final user = await _profileDataSource.getUserData(userId);
      return Right(user);
    } catch (e) {
      log('Error getting user data: ${e.toString()}');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _profileDataSource.signOut();
      return const Right(null);
    } catch (e) {
      log('Error signing out: ${e.toString()}');
      return Left(ServerFailure(message: e.toString()));
    }
  }
} 