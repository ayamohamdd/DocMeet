import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/appointment/data/data_source/appointment_data_source.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';
import 'package:quest_task/features/appointment/domain/entities/appointment_entity.dart';
import 'package:quest_task/features/appointment/domain/repos/appointment_repo.dart';

class AppointmentRepoImpl extends AppointmentRepo {
  final AppointmentDataSource _appointmentDataSource;
  final FirestoreService<AppointmentModel> _firestoreService;

  AppointmentRepoImpl({
    required AppointmentDataSource appointmentDataSource,
    required FirestoreService<AppointmentModel> firestoreService,
  }) : _appointmentDataSource = appointmentDataSource,
       _firestoreService = firestoreService;

  @override
  Future<Either<Failure, List<AppointmentModel>>> fetchUserAppointments(
    String? userId,
  ) async {
    try {
      final response = await _appointmentDataSource.fetchUserAppointments(
        userId,
      );
      return right(response);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      log('eror ${e.toString()}');
      return left(
        const AuthFailure(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment(String appointmentId) async {
    try {
      await _appointmentDataSource.cancelAppointment(appointmentId);
      return const Right(null);
    } catch (e) {
      log('Error canceling appointment: ${e.toString()}');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rescheduleAppointment({
    required String appointmentId,
    required String newDay,
    required String newHour,
  }) async {
    try {
      await _appointmentDataSource.rescheduleAppointment(
        appointmentId,
        newDay,
        newHour,
      );
      return const Right(null);
    } catch (e) {
      log('Error rescheduling appointment: ${e.toString()}');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bookAppointment(
    AppointmentModel appointment,
  ) async {
    try {
      final response = await _appointmentDataSource.bookAnAppointment(
        appointment,
      );
      return right(response);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      log('eror ${e.toString()}');
      return left(
        const AuthFailure(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        ),
      );
    }
  }
}
