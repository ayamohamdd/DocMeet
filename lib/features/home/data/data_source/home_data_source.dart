import 'dart:developer';

import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/features/home/data/specialist_model/specialist_model.dart';

abstract class HomeDataSource {
  Future<List<SpecialistModel>> getAllSpecialist();
}

class HomeDataSourceImpl extends HomeDataSource {
  final specialistService = FirestoreService<SpecialistModel>(
    collection: 'specialists',
    fromJson: SpecialistModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );
  @override
  Future<List<SpecialistModel>> getAllSpecialist() async {
    final result = await specialistService.getAll();
    log('from ds $result');
    return result;
  }
}
