import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/features/auth/presentation/signin/widgets/login_form.dart';
import 'package:quest_task/features/auth/presentation/signin/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceVariant,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
              vertical: context.screenHeight * 0.05,
            ),
            child: Column(
              children: [
                const Center(child: LoginHeader()),
                SizedBox(height: context.screenHeight * 0.05),
                LoginForm(
                  onSignIn: _handleSignIn,
                  onSignUp: () => _handleSignUp(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignIn() {
    // TODO: Implement sign in logic
  }

  void _handleSignUp(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRouter.signUpView);
  }
}
