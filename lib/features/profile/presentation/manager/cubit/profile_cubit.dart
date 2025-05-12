import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/core/services/storage_service.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:quest_task/features/profile/domain/use_cases/get_user_data_use_case.dart';
import 'package:quest_task/features/profile/domain/use_cases/sign_out_use_case.dart';
import 'package:quest_task/features/profile/presentation/manager/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final SignOutUseCase _signOutUseCase;
  final StorageService _storageService;
  final AuthCubit _authCubit;

  ProfileCubit()
    : _getUserDataUseCase = SetupSeviceLocator.sl.get(),
      _signOutUseCase = SetupSeviceLocator.sl.get(),
      _storageService = SetupSeviceLocator.sl.get(),
      _authCubit = SetupSeviceLocator.sl.get(),
      super(ProfileInitial());

  Future<void> getUserData() async {
    emit(ProfileLoading());
    final String? userId = _storageService.getUserId();
    if (userId == null) {
      emit(ProfileError('User not found'));
      return;
    }

    final result = await _getUserDataUseCase(userId);
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (user) => emit(ProfileLoaded(user)),
    );
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    final result = await _signOutUseCase();
    result.fold(
      (failure) => emit(SignOutError(failure.message)),
      (_) async {
        log("success sign out====");
        await _authCubit.signOut();
        emit(SignOutSuccess());
      },
    );
  }
}
