import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/profile/domain/entities/user_entity.dart';
import 'package:quest_task/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:quest_task/features/profile/presentation/views/widgets/sign_out_button.dart';
import 'package:quest_task/features/profile/presentation/views/widgets/user_info_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(user: user),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.06,
              vertical: context.screenHeight * 0.02,
            ),
            child: Column(
              children: [
                UserInfoCard(
                  title: 'Name',
                  value: user.name ?? 'No Name',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: context.screenHeight * 0.02),
                UserInfoCard(
                  title: 'Email',
                  value: user.email ?? 'No Email',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: context.screenHeight * 0.02),
                UserInfoCard(
                  title: 'Phone',
                  value: user.phone ?? 'No Phone',
                  icon: Icons.phone_outlined,
                ),
                SizedBox(height: context.screenHeight * 0.04),
                const SignOutButton(),
                SizedBox(height: context.screenHeight * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 