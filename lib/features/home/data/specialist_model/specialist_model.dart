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
        ) {
    print('Debug - Constructor availabilityDays: $availabilityDays');
    print('Debug - Constructor availabilityDays length: ${availabilityDays?.length}');
    this.availabilityDays = availabilityDays?.cast<AvailabilityDayEntity>();
  }

  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    print('Debug - Raw availability data: ${json['availability']}');
    final availabilityList =
        (json['availability'] as List<dynamic>?)
            ?.map((e) {
              print('Debug - Processing availability item: $e');
              try {
                if (e is Map<String, dynamic>) {
                  final result = AvailabilityDay.fromJson(e);
                  print('Debug - Created AvailabilityDay instance: day=${result.day}, hours=${result.hours}');
                  return result;
                } else {
                  print('Debug - Invalid availability item format: $e');
                  return null;
                }
              } catch (error) {
                print('Debug - Error processing availability item: $error');
                return null;
              }
            })
            .where((item) => item != null)
            .cast<AvailabilityDay>()
            .toList();
    print('Debug - Final availability list length: ${availabilityList?.length}');
    print('Debug - Final availability list: $availabilityList');
    
    final model = SpecialistModel(
      availabilityDays: availabilityList,
      bio: json['bio'] as String?,
      category: json['category'] as String?,
      experienceYears: json['experience_years'] as int?,
      name: json['name'] as String?,
      patientCount: json['patient_count'] as int?,
      price: json['price'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
    );
    print('Debug - Created SpecialistModel with availability days: ${model.availabilityDays?.length}');
    return model;
  }

  Map<String, dynamic> toJson() => {
    'availability':
        availabilityDays?.map((e) => (e as AvailabilityDay).toJson()).toList(),
    'bio': bio,
    'category': category,
    'experience_years': experienceYears,
    'name': name,
    'patient_count': patientCount,
    'price': price,
    'rating': rating,
  };
}
