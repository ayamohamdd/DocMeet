import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/auth/presentation/signup/widgets/signup_form.dart';
import 'package:quest_task/features/auth/presentation/signup/widgets/signup_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
              vertical: context.screenHeight * 0.02,
            ),
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.05),
                const SignUpHeader(),
                SizedBox(height: context.screenHeight * 0.05),
                SignUpForm(
                  onSignUp: _handleSignUp,
                  onLogin: () {
                    _handleLogin(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignUp() {
    // TODO: Implement sign up logic
  }

  void _handleLogin(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRouter.signInView);
  }
}
