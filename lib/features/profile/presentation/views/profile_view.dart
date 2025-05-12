import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:quest_task/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:quest_task/features/profile/presentation/manager/cubit/profile_state.dart';
import 'package:quest_task/features/profile/presentation/views/widgets/error_view.dart';
import 'package:quest_task/features/profile/presentation/views/widgets/loading_view.dart';
import 'package:quest_task/features/profile/presentation/views/widgets/profile_content.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileViewContent();
  }
}

class _ProfileViewContent extends StatelessWidget {
  const _ProfileViewContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            context.read<AuthCubit>().signOut();
            GoRouter.of(context).pushReplacementNamed(AppRouter.signInView);
          } else if (state is SignOutError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const LoadingView();
          } else if (state is ProfileLoaded) {
            return ProfileContent(user: state.user);
          } else if (state is ProfileError) {
            return ErrorView(message: state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
