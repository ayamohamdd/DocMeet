import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';
import 'availability_day.dart';

class SpecialistModel extends SpecialistEntity {
  @override
  List<AvailabilityDayEntity>? availabilityDays;
  @override
  String? bio;
  @override
  String? category;
  @override
  int? experienceYears;
  @override
  String? name;
  @override
  int? patientCount;
  @override
  int? price;
  @override
  double? rating;

  SpecialistModel({
    List<AvailabilityDay>? availabilityDays,
    this.bio,
    this.category,
    this.experienceYears,
    this.name,
    this.patientCount,
    this.price,
    this.rating,
  }) : super(
          availabilityDays: availabilityDays?.cast<AvailabilityDayEntity>(),
          bio: bio,
          category: category,
          experienceYears: experienceYears,
          name: name,
          patientCount: patientCount,
          price: price,
          rating: rating,
        );

  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    return SpecialistModel(
      availabilityDays:
          (json['availability_days'] as List<dynamic>?)
              ?.map((e) => AvailabilityDay.fromJson(e as Map<String, dynamic>))
              .toList(),
      bio: json['bio'] as String?,
      category: json['category'] as String?,
      experienceYears: json['experience_years'] as int?,
      name: json['name'] as String?,
      patientCount: json['patient_count'] as int?,
      price: json['price'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'availability_days': availabilityDays?.map((e) => (e as AvailabilityDay).toJson()).toList(),
        'bio': bio,
        'category': category,
        'experience_years': experienceYears,
        'name': name,
        'patient_count': patientCount,
        'price': price,
        'rating': rating,
      };
}
