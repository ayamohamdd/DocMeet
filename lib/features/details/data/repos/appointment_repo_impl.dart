import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_task/core/utils/errors/failure.dart';
import 'package:quest_task/features/details/data/data_source/appointment_data_source.dart';
import 'package:quest_task/features/details/data/models/appointment_model.dart';
import 'package:quest_task/features/details/domain/entities/appointment_entity.dart';
import 'package:quest_task/features/details/domain/repos/appointment_repo.dart';

class AppointmentRepoImpl extends AppointmentRepo {
  final AppointmentDataSource appointmentDataSource;

  AppointmentRepoImpl({required this.appointmentDataSource});

  @override
  Future<Either<Failure, void>> bookAnAppointment(
    AppointmentModel appointmentModel,
  ) async {
    try {
      final response = await appointmentDataSource.bookAnAppointment(
        appointmentModel,
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
