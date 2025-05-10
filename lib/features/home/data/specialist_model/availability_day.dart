// ignore_for_file: overridden_fields

import 'package:quest_task/features/home/domain/entities/availability_day_entity.dart';

class AvailabilityDay extends AvailabilityDayEntity {
  @override
  String? day;
  @override
  List<String>? hours;
  AvailabilityDay({this.day, this.hours}) : super(day: day, hours: hours);

  factory AvailabilityDay.fromJson(Map<String, dynamic> json) {
    print('Debug - AvailabilityDay raw json: $json');
    String? day;
    
    if (json['day'] != null) {
      day = json['day'].toString();
      print('Debug - Found day from day field: $day');
    } else {
      final dayNames = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
      for (var dayName in dayNames) {
        if (json.containsKey(dayName)) {
          day = dayName;
          print('Debug - Found day from key: $day');
          break;
        }
      }
    }

    final hours = (json['hours'] as List<dynamic>?)?.map((e) {
      final hour = e.toString();
      if (hour.length == 4) { 
        return "0$hour";
      }
      return hour;
    }).toList();
    print('Debug - Parsed hours: $hours');

    final result = AvailabilityDay(
      day: day,
      hours: hours,
    );
    print('Debug - Created AvailabilityDay: day=${result.day}, hours=${result.hours}');
    return result;
  }

  Map<String, dynamic> toJson() => {'day': day, 'hours': hours};
}
