import 'dart:developer';
import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';
import 'package:quest_task/features/home/data/specialist_model/specialist_model.dart';

abstract class AppointmentDataSource {
  Future<void> bookAnAppointment(AppointmentModel appointmentModel);
  Future<List<AppointmentModel>> fetchUserAppointments(String? userId);
  Future<void> cancelAppointment(String appointmentId);
  Future<void> rescheduleAppointment(
    String appointmentId,
    String newDay,
    String newHour,
  );
}

class AppointmentDataSourceImpl extends AppointmentDataSource {
  final appointmentService = FirestoreService<AppointmentModel>(
    collection: 'appointment',
    fromJson: AppointmentModel.fromJson,
    toJson: (appointment) => appointment.toJson(),
  );

  final specialistService = FirestoreService<SpecialistModel>(
    collection: 'specialists',
    fromJson: SpecialistModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );

  @override
  Future<void> bookAnAppointment(AppointmentModel appointmentModel) async {
    log(
      'Attempting to book appointment with specialist ID: ${appointmentModel.specialistId}',
    );

    final specialist = await specialistService.get(
      appointmentModel.specialistId!,
    );

    if (specialist == null) {
      log('Specialist not found with ID: ${appointmentModel.specialistId}');
      final allSpecialists = await specialistService.getAll();
      log(
        'Available specialists: ${allSpecialists.map((s) => '${s.id}: ${s.name}').join(', ')}',
      );
      throw Exception('Specialist not found');
    }

    log('Found specialist: ${specialist.name} (ID: ${specialist.id})');
    log(
      'Current availability: ${specialist.availabilityDays?.map((d) => '${d.day}: ${d.hours}').join(', ')}',
    );

    if (specialist.availabilityDays != null) {
      for (var day in specialist.availabilityDays!) {
        if (day.day == appointmentModel.day) {
          if (day.hours != null) {
            for (var hour in day.hours!) {
              if (hour['hour'] == appointmentModel.hour) {
                hour['status'] = 'booked';
                log('Updated hour ${hour['hour']} to booked status');
                break;
              }
            }
          }
          break;
        }
      }
    }

    await specialistService.update(specialist.id!, specialist);
    log('Updated specialist availability in Firestore');

    final docRef = await appointmentService.create(appointmentModel);
    final appointmentId = docRef;
    appointmentModel.id = appointmentId;

    await appointmentService.update(appointmentId, appointmentModel);
    log('Created appointment record with ID: $appointmentId');

    final updatedSpecialist = await specialistService.get(specialist.id!);
    if (updatedSpecialist == null) {
      log('Warning: Could not verify specialist update');
    } else {
      log(
        'Verified specialist update - New availability: ${updatedSpecialist.availabilityDays?.map((d) => '${d.day}: ${d.hours}').join(', ')}',
      );
    }
  }

  @override
  Future<List<AppointmentModel>> fetchUserAppointments(String? userId) async {
    final result = await appointmentService.getWhere('uid', userId!);
    return result;
  }

  @override
  Future<void> cancelAppointment(String appointmentId) async {
    final appointment = await appointmentService.get(appointmentId);
    if (appointment == null) {
      throw Exception('Appointment not found');
    }
    
    if (appointment.specialistId != null) {
      final specialist = await specialistService.get(appointment.specialistId!);
      if (specialist != null && specialist.availabilityDays != null) {
        for (var day in specialist.availabilityDays!) {
          if (day.day == appointment.day) {
            if (day.hours != null) {
              for (var hour in day.hours!) {
                if (hour['hour'] == appointment.hour) {
                  hour['status'] = 'available';
                  break;
                }
              }
            }
            break;
          }
        }
        await specialistService.update(specialist.id!, specialist);
      }
    }
    
    await appointmentService.delete(appointmentId);
  }

  @override
  Future<void> rescheduleAppointment(
    String appointmentId,
    String newDay,
    String newHour,
  ) async {
    final appointment = await appointmentService.get(appointmentId);
    if (appointment == null) {
      throw Exception('Appointment not found');
    }

    if (appointment.specialistId != null) {
      final specialist = await specialistService.get(appointment.specialistId!);
      if (specialist != null && specialist.availabilityDays != null) {
        for (var day in specialist.availabilityDays!) {
          if (day.day == appointment.day) {
            if (day.hours != null) {
              for (var hour in day.hours!) {
                if (hour['hour'] == appointment.hour) {
                  hour['status'] = 'available';
                  break;
                }
              }
            }
            break;
          }
        }
        await specialistService.update(specialist.id!, specialist);
      }
    }

    appointment.day = newDay;
    appointment.hour = newHour;
    appointment.status = 'rescheduled';
    await appointmentService.update(appointmentId, appointment);

    if (appointment.specialistId != null) {
      final specialist = await specialistService.get(appointment.specialistId!);
      if (specialist != null && specialist.availabilityDays != null) {
        for (var day in specialist.availabilityDays!) {
          if (day.day == newDay) {
            if (day.hours != null) {
              for (var hour in day.hours!) {
                if (hour['hour'] == newHour) {
                  hour['status'] = 'booked';
                  break;
                }
              }
            }
            break;
          }
        }
        await specialistService.update(specialist.id!, specialist);
      }
    }
  }
}
