import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';

abstract class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<SpecialistEntity> specialists;

  HomeSuccessState({required this.specialists});
}

final class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
} 