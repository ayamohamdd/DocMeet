import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/features/profile/domain/entities/user_entity.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary.withOpacity(0.1), Colors.transparent],
        ),
      ),
      child: Center(
        child: Hero(
          tag: 'profile_avatar',
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              radius: context.screenWidth * 0.15,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              backgroundImage:
                  user.imageUrl != null ? NetworkImage(user.imageUrl!) : null,
              child:
                  user.imageUrl == null
                      ? Icon(
                        Icons.person,
                        size: context.screenWidth * 0.15,
                        color: AppColors.primary,
                      )
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}
