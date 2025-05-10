import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:quest_task/features/auth/presentation/views/signin/views/login_view.dart';
import 'package:quest_task/features/auth/presentation/views/signup/views/signup_view.dart';
import 'package:quest_task/features/details/presentation/views/doctor_details_view.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:quest_task/features/main_navigation/presentation/views/main_navigation_view.dart';
import 'package:quest_task/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splashView = '/';
  static const String mainNavigationView = '/main';
  static const String detailsView = '/detailsView';

  static const String signInView = '/login';
  static const String signUpView = '/register';

  static final appRouter = GoRouter(
    initialLocation: splashView,
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: mainNavigationView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => HomeCubit()..getAllSpecialists(),
              child: const MainNavigationView(),
            ),
      ),
      GoRoute(
        path: detailsView,
        builder: (context, state) {
          final SpecialistEntity specialistEntity =
              state.extra as SpecialistEntity;
          return DoctorDetailsView(specialistEntity: specialistEntity);
        },
      ),
      GoRoute(
        path: signInView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: signUpView,
        builder:
            (context, state) => BlocProvider.value(
              value: SetupSeviceLocator.sl<AuthCubit>(),
              child: const SignUpView(),
            ),
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
