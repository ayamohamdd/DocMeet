import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';

abstract class AppointmentDataSource {
  Future<void> bookAnAppointment(AppointmentModel appointmentModel);
}

class AppointmentDataSourceImpl extends AppointmentDataSource {
  final appointmentService = FirestoreService<AppointmentModel>(
    collection: 'specialists',
    fromJson: AppointmentModel.fromJson,
    toJson: (specialist) => specialist.toJson(),
  );
  @override
  Future<void> bookAnAppointment(AppointmentModel appointmentModel) async {
    await appointmentService.create(appointmentModel);
  }
}
