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
