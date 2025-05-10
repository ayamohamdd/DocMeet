// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';

class SpecialistEntity {
  List<AvailabilityDayEntity>? availabilityDays;
  String? bio;
  String? category;
  int? experienceYears;
  String? name;
  int? patientCount;
  int? price;
  String? imageUrl;
  double? rating;
  SpecialistEntity({
    this.availabilityDays,
    this.bio,
    this.category,
    this.experienceYears,
    this.name,
    this.imageUrl,
    this.patientCount,
    this.price,
    this.rating,
  });
}
