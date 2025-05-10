import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/widgets/header_action_button.dart';
import 'package:quest_task/core/utils/widgets/primary_button.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/doctor_details_body.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_header/doctor_details_header.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/details/presentation/manager/cubit/appointment_cubit.dart';
import 'package:quest_task/features/details/domain/repos/appointment_repo.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({
    super.key, 
    required this.specialistEntity,
  });
  
  final SpecialistEntity specialistEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(),
      child: Scaffold(
        backgroundColor: AppColors.surfaceVariant,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.screenWidth * 0.05,
                    right: context.screenWidth * 0.05,
                    top: context.screenHeight * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderActionButton(
                        icon: Icons.arrow_back,
                        iconSize: 20,
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.4,
                        child: DoctorDetailsHeader(
                          specialistEntity: specialistEntity,
                        ),
                      ),
                    ],
                  ),
                ),
                DoctorDetailsBody(specialistEntity: specialistEntity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
