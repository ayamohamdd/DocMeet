import 'package:quest_task/features/appointment/data/models/appointment_model.dart';

abstract class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class BookingAppointmentLoading extends AppointmentState {}

final class BookingAppointmentSuccess extends AppointmentState {}

final class BookingAppointmentError extends AppointmentState {
  final String message;

  BookingAppointmentError(this.message);
}

class LoadingBookedAppointments extends AppointmentState {}

class LoadingBookedAppointmentsError extends AppointmentState {
  final String message;

  LoadingBookedAppointmentsError(this.message);
}

class FetchUserAppointmentsLoading extends AppointmentState {}

class FetchUserAppointmentsSuccess extends AppointmentState {
  List<AppointmentModel> appointments;
  FetchUserAppointmentsSuccess({required this.appointments});
}

class FetchUserAppointmentsFiled extends AppointmentState {
  String error;
  FetchUserAppointmentsFiled({required this.error});
}

class CancelingAppointmentLoading extends AppointmentState {}

class CancelingAppointmentSuccess extends AppointmentState {}

class CancelingAppointmentError extends AppointmentState {
  final String message;
  CancelingAppointmentError(this.message);
}

class ReschedulingAppointmentLoading extends AppointmentState {}

class ReschedulingAppointmentSuccess extends AppointmentState {}

class ReschedulingAppointmentError extends AppointmentState {
  final String message;
  ReschedulingAppointmentError(this.message);
}
