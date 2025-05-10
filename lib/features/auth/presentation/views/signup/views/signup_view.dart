import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:quest_task/features/auth/presentation/views/signup/widgets/signup_form.dart';
import 'package:quest_task/features/auth/presentation/views/signup/widgets/signup_header.dart';

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
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignUpSuccessState) {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.mainNavigationView);
                    } else if (state is AuthSignUpErrorState) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return SignUpForm(
                      onSignUp:
                          (name, email, password) =>
                              _handleSignUp(context, name!, email, password),
                      onLogin: () => _handleLogin(context),
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

  void _handleSignUp(
    BuildContext context,
    String name,
    String email,
    String password,
  ) {
    log('email $email');
    log('name $name');
    log('pass $password');

    context.read<AuthCubit>().signUp(name, email, password);
  }

  void _handleLogin(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRouter.signInView);
  }
}
