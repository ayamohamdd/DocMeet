import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/features/home/presentation/widgets/home_header/header_action_button.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderActionButton(
          icon: Icons.search,
          onTap: () {
            // TODO: Implement search functionality
          },
        ),
        SizedBox(width: context.screenWidth * 0.01),
        HeaderActionButton(
          icon: Icons.notifications_none_outlined,
          onTap: () {
            // TODO: Implement notifications functionality
          },
        ),
      ],
    );
  }
} 