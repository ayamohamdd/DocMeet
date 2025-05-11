import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/features/auth/domain/use_cases/signin_use_case.dart';
import 'package:quest_task/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:quest_task/core/services/storage_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
    : _signInUseCase = SetupSeviceLocator.sl.get(),
      _signUpUseCase = SetupSeviceLocator.sl.get(),
      _storageService = SetupSeviceLocator.sl.get(),
      super(AuthInitialState());

  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final StorageService _storageService;

  Future<void> signIn(String email, String password) async {
    emit(AuthSignInLoadingState());
    final result = await _signInUseCase.call(email, password);
    result.fold((l) => emit(AuthSignInErrorState(error: l.toString())), (
      userId,
    ) async {
      await _storageService.saveUserId(userId);
      emit(AuthSignInSuccessState());
    });
  }

  Future<void> signUp(String name, String email, String password) async {
    emit(AuthSignUpLoadingState());
    final result = await _signUpUseCase.call(name, email, password);
    result.fold((l) => emit(AuthSignUpErrorState(error: l.toString())), (
      userId,
    ) async {
      await _storageService.saveUserId(userId);
      emit(AuthSignUpSuccessState());
    });
  }

  Future<void> signOut() async {
    await _storageService.removeUserId();
    emit(AuthInitialState());
  }

  bool isAuthenticated() {
    return _storageService.hasUserId();
  }
}
