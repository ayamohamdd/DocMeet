import 'package:flutter/material.dart';
import 'package:quest_task/features/auth/presentation/views/common_widgets/base_auth_form.dart';

class SignUpForm extends StatelessWidget {
  final dynamic Function(String?, String, String) onSignUp;
  final VoidCallback onLogin;

  const SignUpForm({super.key, required this.onSignUp, required this.onLogin});

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthForm(
      submitButtonText: 'Sign Up',
      onSubmit: (email, password, [name]) => onSignUp(name!, email, password),
      alternateActionText: 'Already have an account? ',
      alternateActionButtonText: 'Sign In',
      onAlternateAction: onLogin,
      nameValidator: _validateName,
      showPasswordStrength: true,
    );
  }
}
