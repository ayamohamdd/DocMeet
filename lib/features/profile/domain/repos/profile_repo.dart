import 'package:dartz/dartz.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getUserData(String userId);
  Future<Either<Failure, void>> signOut();
} 