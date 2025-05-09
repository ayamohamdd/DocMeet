import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  final String? code;
  final dynamic data;

  const Failure({
    required this.message,
    this.code,
    this.data,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.data,
  });
}

class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
    super.data,
  });

  factory CacheFailure.saveError() {
    return const CacheFailure(
      message: 'Failed to save data locally',
      code: 'SAVE_ERROR',
    );
  }

  factory CacheFailure.readError() {
    return const CacheFailure(
      message: 'Failed to read local data',
      code: 'READ_ERROR',
    );
  }
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
    super.data,
  });

  factory ValidationFailure.invalidEmail() {
    return const ValidationFailure(
      message: 'Please enter a valid email address',
      code: 'INVALID_EMAIL',
    );
  }

  factory ValidationFailure.invalidPassword() {
    return const ValidationFailure(
      message: 'Password must be at least 6 characters long',
      code: 'INVALID_PASSWORD',
    );
  }

  factory ValidationFailure.passwordsDoNotMatch() {
    return const ValidationFailure(
      message: 'Passwords do not match',
      code: 'PASSWORDS_DONT_MATCH',
    );
  }

  factory ValidationFailure.emptyField(String fieldName) {
    return ValidationFailure(
      message: '$fieldName cannot be empty',
      code: 'EMPTY_FIELD',
      data: {'field': fieldName},
    );
  }
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
    super.data,
  });

  factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const AuthFailure(
          message: 'No user found with this email',
          code: 'USER_NOT_FOUND',
        );
      case 'wrong-password':
        return const AuthFailure(
          message: 'Wrong password provided',
          code: 'WRONG_PASSWORD',
        );
      case 'email-already-in-use':
        return const AuthFailure(
          message: 'Email is already in use',
          code: 'EMAIL_IN_USE',
        );
      case 'weak-password':
        return const AuthFailure(
          message: 'Password is too weak',
          code: 'WEAK_PASSWORD',
        );
      case 'invalid-email':
        return const AuthFailure(
          message: 'Email address is invalid',
          code: 'INVALID_EMAIL',
        );
      case 'user-disabled':
        return const AuthFailure(
          message: 'This user account has been disabled',
          code: 'USER_DISABLED',
        );
      case 'operation-not-allowed':
        return const AuthFailure(
          message: 'Operation not allowed',
          code: 'OPERATION_NOT_ALLOWED',
        );
      case 'too-many-requests':
        return const AuthFailure(
          message: 'Too many attempts. Please try again later',
          code: 'TOO_MANY_REQUESTS',
        );
      case 'network-request-failed':
        return const AuthFailure(
          message: 'Network error occurred',
          code: 'NETWORK_ERROR',
        );
      case 'requires-recent-login':
        return const AuthFailure(
          message: 'Please log in again to perform this action',
          code: 'REQUIRES_RECENT_LOGIN',
        );
      case 'invalid-verification-code':
        return const AuthFailure(
          message: 'Invalid verification code',
          code: 'INVALID_VERIFICATION_CODE',
        );
      case 'invalid-verification-id':
        return const AuthFailure(
          message: 'Invalid verification ID',
          code: 'INVALID_VERIFICATION_ID',
        );
      case 'credential-already-in-use':
        return const AuthFailure(
          message: 'This credential is already associated with a different user',
          code: 'CREDENTIAL_IN_USE',
        );
      case 'account-exists-with-different-credential':
        return const AuthFailure(
          message: 'An account already exists with the same email address but different sign-in credentials',
          code: 'ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL',
        );
      default:
        return AuthFailure(
          message: e.message ?? 'An authentication error occurred',
          code: e.code,
        );
    }
  }

  factory AuthFailure.invalidCredentials() {
    return const AuthFailure(
      message: 'Invalid email or password',
      code: 'INVALID_CREDENTIALS',
    );
  }

  factory AuthFailure.userNotFound() {
    return const AuthFailure(
      message: 'User not found',
      code: 'USER_NOT_FOUND',
    );
  }

  factory AuthFailure.emailAlreadyInUse() {
    return const AuthFailure(
      message: 'Email is already in use',
      code: 'EMAIL_IN_USE',
    );
  }

  factory AuthFailure.weakPassword() {
    return const AuthFailure(
      message: 'Password is too weak',
      code: 'WEAK_PASSWORD',
    );
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
    super.data,
  });

  factory NetworkFailure.noConnection() {
    return const NetworkFailure(
      message: 'No internet connection',
      code: 'NO_CONNECTION',
    );
  }
}
