import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity{
  @override
  String? day;
  @override
  String? hour;
  @override
  String? specialistName;
  @override
  String? status;
  @override
  String? uid;

  AppointmentModel({
    this.day,
    this.hour,
    this.specialistName,
    this.status,
    this.uid,
  }):super(day: day,hour: hour,specialistName: specialistName,status: status);

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      specialistName: json['specialist_name'] as String?,
      status: json['status'] as String?,
      uid: json['uid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'hour': hour,
    'specialist_name': specialistName,
    'status': status,
    'uid': uid,
  };
}
