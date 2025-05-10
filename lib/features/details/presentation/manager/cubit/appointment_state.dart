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
