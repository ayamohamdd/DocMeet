import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/features/details/presentation/views/doctor_details_view.dart';
import 'package:quest_task/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const String home = '/home';
  static const String detailsView = '/detailsView';

  static const String login = '/login';
  static const String register = '/register';

  static final appRouter = GoRouter(
    initialLocation: detailsView,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomeView()),
      GoRoute(
        path: detailsView,
        builder: (context, state) => const DoctorDetailsView(),
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
