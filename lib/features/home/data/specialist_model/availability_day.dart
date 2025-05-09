// ignore_for_file: overridden_fields

import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';

class AvailabilityDay extends AvailabilityDayEntity {
  AvailabilityDay({super.day, super.hours});

  factory AvailabilityDay.fromJson(Map<String, dynamic> json) {
    return AvailabilityDay(
      day: json['day'] as String?,
      hours: (json['hours'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'day': day,
        'hours': hours,
      };
}
