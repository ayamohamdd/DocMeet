import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:quest_task/core/services/firebase_services/firebase_auth_services.dart';
import 'package:quest_task/features/auth/data/data_source/auth_data_source.dart';
import 'package:quest_task/features/auth/data/repos/auth_repo_impl.dart';
import 'package:quest_task/features/auth/domain/repos/auth_repo.dart';
import 'package:quest_task/features/auth/domain/use_cases/signin_use_case.dart';
import 'package:quest_task/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:quest_task/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:quest_task/core/services/storage_service.dart';
import 'package:quest_task/features/appointment/domain/use_cases/book_appointment_use_case.dart';
import 'package:quest_task/features/appointment/domain/use_cases/cancel_appointment_use_case.dart';
import 'package:quest_task/features/appointment/domain/use_cases/reschedule_appointment_use_case.dart';
import 'package:quest_task/features/appointment/presentation/manager/cubit/appointment_cubit.dart';
import 'package:quest_task/features/profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quest_task/features/home/data/data_source/home_data_source.dart';
import 'package:quest_task/features/home/data/repos/home_repo_impl.dart';
import 'package:quest_task/features/home/domain/repos/home_repo.dart';
import 'package:quest_task/features/home/domain/use_cases/get_all_specialists_use_case.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:quest_task/features/appointment/data/data_source/appointment_data_source.dart';
import 'package:quest_task/features/appointment/data/repos/appointment_repo_impl.dart';
import 'package:quest_task/features/appointment/domain/repos/appointment_repo.dart';
import 'package:quest_task/features/appointment/domain/use_cases/fetch_user_appointments_use_case.dart';
import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/features/appointment/data/models/appointment_model.dart';
import 'package:quest_task/features/profile/data/data_source/profile_data_source.dart';
import 'package:quest_task/features/profile/data/repos/profile_repo_impl.dart';
import 'package:quest_task/features/profile/domain/repos/profile_repo.dart';
import 'package:quest_task/features/profile/domain/use_cases/get_user_data_use_case.dart';
import 'package:quest_task/features/profile/domain/use_cases/sign_out_use_case.dart';
import 'package:quest_task/features/profile/presentation/manager/cubit/profile_cubit.dart';

class SetupSeviceLocator {
  static final sl = GetIt.asNewInstance();

  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPreferences);

    registerDataSources();
    registerRepositories();
    registerUseCases();
    registerCubits();
    registerCore();
    registerExternal();
  }

  static void registerDataSources() {
    sl.registerLazySingleton<AuthDataSource>(
      () =>
          AuthDataSourceImpl(firebaseAuthServices: sl<FirebaseAuthServices>()),
    );
    sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
    sl.registerLazySingleton<AppointmentDataSource>(
      () => AppointmentDataSourceImpl(),
    );
    sl.registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(
        userService: FirestoreService<UserModel>(
          collection: 'users',
          fromJson: UserModel.fromJson,
          toJson: (user) => user.toJson(),
        ),
        authService: sl<FirebaseAuthServices>(),
      ),
    );
  }

  static void registerRepositories() {
    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(authDataSource: sl<AuthDataSource>()),
    );
    sl.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeDataSource: sl<HomeDataSource>()),
    );
    sl.registerLazySingleton<AppointmentRepo>(
      () => AppointmentRepoImpl(
        appointmentDataSource: sl<AppointmentDataSource>(),
        firestoreService: FirestoreService<AppointmentModel>(
          collection: 'appointments',
          fromJson: AppointmentModel.fromJson,
          toJson: (appointment) => appointment.toJson(),
        ),
      ),
    );
    sl.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImpl(profileDataSource: sl<ProfileDataSource>()),
    );
  }

  static void registerUseCases() {
    sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(authRepo: sl<AuthRepo>()),
    );
    sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepo: sl<AuthRepo>()),
    );
    sl.registerLazySingleton<GetAllSpecialistsUseCase>(
      () => GetAllSpecialistsUseCase(homeRepo: sl<HomeRepo>()),
    );
    sl.registerLazySingleton<BookAppointmentUseCase>(
      () => BookAppointmentUseCase(appointmentRepo: sl<AppointmentRepo>()),
    );
    sl.registerLazySingleton<FetchUserAppointmentsUseCase>(
      () =>
          FetchUserAppointmentsUseCase(appointmentRepo: sl<AppointmentRepo>()),
    );
    sl.registerLazySingleton<CancelAppointmentUseCase>(
      () => CancelAppointmentUseCase(sl<AppointmentRepo>()),
    );
    sl.registerLazySingleton<RescheduleAppointmentUseCase>(
      () => RescheduleAppointmentUseCase(sl<AppointmentRepo>()),
    );
    sl.registerLazySingleton<GetUserDataUseCase>(
      () => GetUserDataUseCase(sl<ProfileRepo>()),
    );
    sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(sl<ProfileRepo>()),
    );
  }

  static void registerCubits() {
    sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
    sl.registerLazySingleton<HomeCubit>(() => HomeCubit());
    sl.registerLazySingleton<AppointmentCubit>(() => AppointmentCubit());
    sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
  }

  static void registerCore() {
    sl.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  }

  static void registerExternal() {
    sl.registerSingleton<StorageService>(
      StorageService(sl<SharedPreferences>()),
    );
  }
}
