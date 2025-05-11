import 'package:quest_task/features/home/domain/entities/specialist_entity.dart';
import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';
import 'availability_day.dart';

class SpecialistModel extends SpecialistEntity {
  String? id;
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
  String? imageUrl;

  SpecialistModel({
    this.id,
    List<AvailabilityDay>? availabilityDays,
    this.bio,
    this.category,
    this.experienceYears,
    this.name,
    this.patientCount,
    this.price,
    this.imageUrl,
    this.rating,
  }) : super(
         id: id,
         availabilityDays: availabilityDays?.cast<AvailabilityDayEntity>(),
         bio: bio,
         category: category,
         experienceYears: experienceYears,
         name: name,
         patientCount: patientCount,
         price: price,
         rating: rating,
       ) {
    this.availabilityDays = availabilityDays?.cast<AvailabilityDayEntity>();
  }

  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    final availabilityList =
        (json['availability'] as List<dynamic>?)
            ?.map((e) {
              try {
                if (e is Map<String, dynamic>) {
                  final result = AvailabilityDay.fromJson(e);
                  return result;
                } else {
                  return null;
                }
              } catch (error) {
                return null;
              }
            })
            .where((item) => item != null)
            .cast<AvailabilityDay>()
            .toList();

    final model = SpecialistModel(
      id: json['id'] ?? json['document_id'],
      availabilityDays: availabilityList,
      bio: json['bio'] as String?,
      category: json['category'] as String?,
      experienceYears: json['experience_years'] as int?,
      name: json['name'] as String?,
      patientCount: json['patient_count'] as int?,
      price: json['price'] as int?,
      imageUrl: json['image_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );
    print(
      'Debug - Created SpecialistModel with ID: ${model.id}, availability days: ${model.availabilityDays?.length}',
    );
    return model;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'availability':
        availabilityDays?.map((e) => (e as AvailabilityDay).toJson()).toList(),
    'bio': bio,
    'category': category,
    'experience_years': experienceYears,
    'name': name,
    'patient_count': patientCount,
    'price': price,
    'image_url': imageUrl,
    'rating': rating,
  };
}
