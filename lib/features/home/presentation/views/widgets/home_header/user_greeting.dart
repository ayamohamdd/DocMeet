import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:quest_task/features/profile/presentation/manager/cubit/profile_state.dart';

class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final userName = state is ProfileLoaded ? state.user.name : 'Guest';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello $userName', style: AppTextStyles.heading2),
            Text('How are you today?', style: AppTextStyles.bodySmall),
          ],
        );
      },
    );
  }
}
