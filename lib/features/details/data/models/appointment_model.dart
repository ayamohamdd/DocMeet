import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  @override
  String? day;
  @override
  String? hour;
  @override
  String? specialistId;
  @override
  String? status;
  @override
  String? uid;

  AppointmentModel({
    this.day,
    this.hour,
    this.specialistId,
    this.status,
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
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      specialistId: json['specialist_id'] as String?,
      status: json['status'] as String?,
      uid: json['uid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'hour': hour,
    'specialist_id': specialistId,
    'status': status,
    'uid': uid,
  };
}
