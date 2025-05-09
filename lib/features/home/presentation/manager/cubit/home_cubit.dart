import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/domain/use_cases/get_all_specialists_use_case.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : _getAllSpecialistsUseCase = SetupSeviceLocator.sl.get(),
      super(HomeInitialState());

  final GetAllSpecialistsUseCase _getAllSpecialistsUseCase;

  Future<void> getAllSpecialists() async {
    emit(HomeLoadingState());
    final result = await _getAllSpecialistsUseCase.call();
    result.fold(
      (failure) {
        log('errrrrrrorrrrr ${failure.message}');
        emit(HomeErrorState(error: failure.message));
      },
      (specialists) {
        log('spec in cu $specialists');
        emit(HomeSuccessState(specialists: specialists));
      },
    );
  }
}
