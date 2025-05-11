import 'package:quest_task/features/appointment/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  String? id;
  @override
  String? day;
  @override
  String? hour;

  @override
  String? specialistId;
  String? specialistName;
  String? specialistImageUrl;

  @override
  String? status;
  @override
  String? uid;

  AppointmentModel({
    this.id,
    this.day,
    this.hour,
    this.specialistId,
    this.status,
    this.specialistName,
    this.specialistImageUrl,
    this.uid,
  }) : super(
         day: day,
         hour: hour,
         specialistId: specialistId,
         status: status,
         uid: uid,
       );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json["id"] as String?,
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      specialistId: json['specialist_id'] as String?,
      specialistName: json['specialist_name'] as String?,
      specialistImageUrl: json['image_url'] as String?,
      status: json['status'] as String?,
      uid: json['uid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'day': day,
    'hour': hour,
    'specialist_id': specialistId,
    'status': status,
    'uid': uid,
    'specialist_name': specialistName,
    'image_url': specialistImageUrl,
  };
}
