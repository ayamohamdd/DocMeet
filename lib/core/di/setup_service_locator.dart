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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quest_task/features/home/data/data_source/home_data_source.dart';
import 'package:quest_task/features/home/data/repos/home_repo_impl.dart';
import 'package:quest_task/features/home/domain/repos/home_repo.dart';
import 'package:quest_task/features/home/domain/use_cases/get_all_specialists_use_case.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_cubit.dart';

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
      () => AuthDataSourceImpl(firebaseAuthServices: sl<FirebaseAuthServices>()),
    );
    sl.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(),
    );
  }

  static void registerRepositories() {
    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(authDataSource: sl<AuthDataSource>()),
    );
    sl.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeDataSource: sl<HomeDataSource>()),
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
  }

  static void registerCubits() {
    sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
    sl.registerLazySingleton<HomeCubit>(() => HomeCubit());
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
