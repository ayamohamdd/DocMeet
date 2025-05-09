import 'package:flutter/material.dart';
import 'package:quest_task/features/auth/presentation/views/common_widgets/base_auth_form.dart';

class LoginForm extends StatelessWidget {
  final dynamic Function(String, String, [String?]) onSignIn;
  final VoidCallback onSignUp;

  const LoginForm({super.key, required this.onSignIn, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return BaseAuthForm(
      submitButtonText: 'Sign In',
      onSubmit: onSignIn,
      alternateActionText: "Don't have an account? ",
      alternateActionButtonText: 'Sign Up',
      onAlternateAction: onSignUp,
    );
  }
}
