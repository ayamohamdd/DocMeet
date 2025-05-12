import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/text_styles.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_state.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/home_body_doctors_heading.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/home_body_doctors_list.dart';
import 'package:quest_task/features/home/presentation/views/widgets/home_body/home_body_doctors_shimmer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeBodyDoctorsHeading(),
        SizedBox(height: context.screenHeight * 0.01),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const HomeBodyDoctorsShimmer();
              } else if (state is HomeSuccessState) {
                return HomeBodyDoctorsList(specialists: state.specialists);
              } else {
                return const Text("invalid");
              }
            },
          ),
        ),
      ],
    );
  }
}
