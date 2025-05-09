import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:quest_task/features/auth/presentation/views/signin/widgets/login_form.dart';
import 'package:quest_task/features/auth/presentation/views/signin/widgets/login_header.dart';

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
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignInSuccessState) {
                      GoRouter.of(context).pushReplacement(AppRouter.homeView);
                    } else if (state is AuthSignInErrorState) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return LoginForm(
                      onSignIn:
                          (email, password, [name]) =>
                              _handleSignIn(context, email, password),
                      onSignUp: () => _handleSignUp(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignIn(BuildContext context, String email, String password) {
    log('email $email');
    context.read<AuthCubit>().signIn(email, password);
  }

  void _handleSignUp(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRouter.signUpView);
  }
}
