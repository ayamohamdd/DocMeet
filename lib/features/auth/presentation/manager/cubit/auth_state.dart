abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthSignInLoadingState extends AuthState {}

final class AuthSignInSuccessState extends AuthState {}

final class AuthSignInErrorState extends AuthState {
  final String error;

  AuthSignInErrorState({required this.error});
}

final class AuthSignUpLoadingState extends AuthState {}

final class AuthSignUpSuccessState extends AuthState {}

final class AuthSignUpErrorState extends AuthState {
  final String error;

  AuthSignUpErrorState({required this.error});
}

final class AuthSignOutLoadingState extends AuthState {}

final class AuthSignOutSuccessState extends AuthState {}

final class AuthSignOutErrorState extends AuthState {
  final String error;

  AuthSignOutErrorState({required this.error});
}
