import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/core/utils/error_handling/auth_error_handler.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/widgets/default_text_field.dart';
import 'package:quest_task/core/utils/widgets/password_requirements_indicator.dart';
import 'package:quest_task/core/utils/widgets/password_strength_indicator.dart';
import 'package:quest_task/core/utils/widgets/primary_button.dart';

class BaseAuthForm extends StatefulWidget {
  final List<Widget> additionalFields;
  final String submitButtonText;
  final Function(String email, String password, [String? name]) onSubmit;
  final String alternateActionText;
  final String alternateActionButtonText;
  final VoidCallback onAlternateAction;
  final String? Function(String?)? nameValidator;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  final bool showPasswordStrength;

  const BaseAuthForm({
    super.key,
    this.additionalFields = const [],
    required this.submitButtonText,
    required this.onSubmit,
    required this.alternateActionText,
    required this.alternateActionButtonText,
    required this.onAlternateAction,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    this.showPasswordStrength = false,
  });

  @override
  State<BaseAuthForm> createState() => _BaseAuthFormState();
}

class _BaseAuthFormState extends State<BaseAuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  PasswordStrength _passwordStrength = PasswordStrength.weak;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _passwordController.removeListener(_onPasswordChanged);
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    if (_passwordController.text.isEmpty) {
      setState(() => _passwordStrength = PasswordStrength.weak);
    } else {
      _checkPasswordStrength(_passwordController.text);
    }
  }

  void _checkPasswordStrength(String password) {
    final bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final bool hasDigits = password.contains(RegExp(r'[0-9]'));
    final bool hasSpecialCharacters = password.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
    final bool hasMinLength = password.length >= 8;

    int strength = 0;
    if (hasUppercase) strength++;
    if (hasDigits) strength++;
    if (hasSpecialCharacters) strength++;
    if (hasMinLength) strength++;

    setState(() {
      if (strength <= 2) {
        _passwordStrength = PasswordStrength.weak;
      } else if (strength == 3) {
        _passwordStrength = PasswordStrength.medium;
      } else {
        _passwordStrength = PasswordStrength.strong;
      }
    });
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await widget.onSubmit(
          _emailController.text,
          _passwordController.text,
          widget.nameValidator != null ? _nameController.text : null,
        );
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (widget.nameValidator != null) ...[
            DefaultTextField(
              label: 'Full Name',
              hint: 'Enter your full name',
              controller: _nameController,
              prefixIcon: const Icon(Icons.person_outline),
              validator: widget.nameValidator,
            ),
            SizedBox(height: context.screenHeight * 0.02),
          ],
          DefaultTextField(
            label: 'Email',
            hint: 'Enter your email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email_outlined),
            validator: widget.emailValidator ?? _validateEmail,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          DefaultTextField(
            label: 'Password',
            hint: 'Enter your password',
            controller: _passwordController,
            isPassword: !_isPasswordVisible,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: _buildPasswordVisibilityToggle(),
            validator: widget.passwordValidator ?? _validatePassword,
          ),
          if (widget.showPasswordStrength && _passwordController.text.isNotEmpty) ...[
            SizedBox(height: context.screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PasswordStrengthIndicator(strength: _passwordStrength),
                  SizedBox(height: context.screenHeight * 0.01),
                  PasswordRequirementsIndicator(
                    password: _passwordController.text,
                  ),
                ],
              ),
            ),
          ],
          ...widget.additionalFields,
          SizedBox(height: context.screenHeight * 0.03),
          PrimaryButton(
            text: widget.submitButtonText,
            onPressed: _handleSubmit,
            isLoading: _isLoading,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          _buildAlternateActionLink(),
        ],
      ),
    );
  }

  Widget _buildPasswordVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _isPasswordVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        color: AppColors.onSurfaceVariant,
      ),
      onPressed:
          _isLoading
              ? null
              : () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
    );
  }

  Widget _buildAlternateActionLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.alternateActionText,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
        ),
        GestureDetector(
          onTap: _isLoading ? null : widget.onAlternateAction,
          child: Text(
            widget.alternateActionButtonText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color:
                  _isLoading ? AppColors.onSurfaceDisabled : AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (widget.showPasswordStrength) {
      if (value.length < 8) {
        return 'Password must be at least 8 characters';
      }
      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Password must contain at least one uppercase';
      }
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Password must contain at least one number';
      }
      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return 'Password must contain at least one special character';
      }
    }
    return null;
  }
}
