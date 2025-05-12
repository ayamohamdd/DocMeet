import 'package:flutter/material.dart';
import 'package:quest_task/core/constants/media_query_extension.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/about_tab.dart';
import 'package:quest_task/features/details/presentation/widgets/doctor_details_body/availability_tab.dart';

class DoctorDetailsBody extends StatefulWidget {
  const DoctorDetailsBody({super.key, required this.specialistEntity});
  final SpecialistEntity specialistEntity;

  @override
  State<DoctorDetailsBody> createState() => _DoctorDetailsBodyState();
}

class _DoctorDetailsBodyState extends State<DoctorDetailsBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            dividerColor: AppColors.onPrimary,
            unselectedLabelColor: AppColors.onSurfaceVariant,
            indicatorColor: AppColors.primary,
            tabs: const [Tab(text: 'About'), Tab(text: 'Availability')],
          ),
          SizedBox(
            height: context.screenHeight * 0.5,
            child: TabBarView(
              controller: _tabController,
              children: [
                AboutTab(specialistEntity: widget.specialistEntity),
                AvailabilityTab(specialistEntity: widget.specialistEntity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
