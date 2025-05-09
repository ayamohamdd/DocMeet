import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/features/auth/presentation/signin/views/login_view.dart';
import 'package:quest_task/features/auth/presentation/signup/views/signup_view.dart';
import 'package:quest_task/features/details/presentation/views/doctor_details_view.dart';
import 'package:quest_task/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const String homeView = '/home';
  static const String detailsView = '/detailsView';

  static const String signInView = '/login';
  static const String signUpView = '/register';

  static final appRouter = GoRouter(
    initialLocation: signInView,
    routes: [
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: detailsView,
        builder: (context, state) => const DoctorDetailsView(),
      ),
      GoRoute(path: signInView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(
            child: Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
  );
}
