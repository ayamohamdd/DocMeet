import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final authCubit = SetupSeviceLocator.sl<AuthCubit>();
        if (authCubit.isAuthenticated()) {
          GoRouter.of(context).pushReplacement(AppRouter.mainNavigationView);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.signInView);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: context.screenWidth * 0.4,
                      height: context.screenWidth * 0.4,
                      decoration: const BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                    Text(
                      'DocMeet',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        color: AppColors.surface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
