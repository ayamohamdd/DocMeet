import 'package:flutter/material.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';

class AuthErrorHandler {
  static String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return _handleServerError(failure as ServerFailure);
      case NetworkFailure _:
        return 'Please check your internet connection';
      case ValidationFailure _:
        return (failure as ValidationFailure).message;
      default:
        return 'An unexpected error occurred';
    }
  }

  static String _handleServerError(ServerFailure failure) {
    if (failure.message.contains('user-not-found')) {
      return 'No account found with this email';
    }
    if (failure.message.contains('wrong-password')) {
      return 'Incorrect password';
    }
    if (failure.message.contains('email-already-in-use')) {
      return 'An account already exists with this email';
    }
    if (failure.message.contains('weak-password')) {
      return 'Password is too weak';
    }
    if (failure.message.contains('invalid-email')) {
      return 'Invalid email format';
    }
    if (failure.message.contains('network-request-failed')) {
      return 'Network error. Please try again';
    }
    return 'Something went wrong. Please try again';
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:AppColors.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
