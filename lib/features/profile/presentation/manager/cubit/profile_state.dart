import 'package:quest_task/features/profile/domain/entities/user_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserEntity user;

  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class SignOutLoading extends ProfileState {}

class SignOutSuccess extends ProfileState {}

class SignOutError extends ProfileState {
  final String message;

  SignOutError(this.message);
} 