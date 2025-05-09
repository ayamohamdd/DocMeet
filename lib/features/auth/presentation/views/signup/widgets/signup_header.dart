import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage("assets/images/logo.png"),
          width: context.screenWidth * 0.25,
        ),
        Text(
          'Create Account',
          style: AppTextStyles.heading2.copyWith(fontSize: 30),
        ),
        SizedBox(height: context.screenHeight * 0.01),
        Text(
          "Join us to find your perfect specialist match.",
          style: AppTextStyles.caption.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
