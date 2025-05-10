import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';
import 'package:quest_task/features/home/data/specialist_model/specialist_model.dart';

abstract class AppointmentDataSource {
  Future<void> bookAnAppointment(AppointmentModel appointmentModel);
}

class AppointmentDataSourceImpl extends AppointmentDataSource {
  final appointmentService = FirestoreService<AppointmentModel>(
    collection: 'appointment',
    fromJson: AppointmentModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );

  final specialistService = FirestoreService<SpecialistModel>(
    collection: 'specialist',
    fromJson: SpecialistModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );
  @override
  Future<void> bookAnAppointment(AppointmentModel appointmentModel) async {
    await appointmentService.create(appointmentModel);
  }
}
