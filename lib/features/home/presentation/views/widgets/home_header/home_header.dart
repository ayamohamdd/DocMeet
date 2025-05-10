import 'package:flutter/material.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_header/user_greeting.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_header/header_actions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserGreeting(),
        HeaderActions(),
      ],
    );
  }
} 