import 'package:flutter/material.dart';
import 'package:quest_task/core/styles/text_styles.dart';

class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello Aya', style: AppTextStyles.heading2),
        Text(
          'How are you today?',
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
} 