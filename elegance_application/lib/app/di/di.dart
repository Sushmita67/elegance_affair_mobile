import 'package:dio/dio.dart';
import 'package:elegance_application/core/network/hive_service.dart';
import 'package:elegance_application/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance_application/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:elegance_application/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/api_service.dart';
import '../../features/auth/data/repository/user_remote_repository.dart';
import '../../features/auth/domain/use_case/create_user_usecase.dart';
import '../../features/auth/domain/use_case/login_user_usecase.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  // await _initCommonDependencies();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
  await _initOnboardingScreenViewDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
        () => ApiService(Dio()).dio,
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

// _initCommonDependencies() {
//   // Register common dependencies used across multiple features
//   if (!getIt.isRegistered<UserLocalDatasource>()) {
//     getIt.registerFactory<UserLocalDatasource>(
//       () => UserLocalDatasource(getIt<HiveService>()),
//     );
//   }
//
//   if (!getIt.isRegistered<UserLocalRepository>()) {
//     getIt.registerLazySingleton<UserLocalRepository>(() =>
//         UserLocalRepository(
//             userLocalDataSource: getIt<UserLocalDatasource>()));
//   }
// }
//
// _initRegisterDependencies() async {
//   // Register CreateUserUsecase once
//   getIt.registerLazySingleton<CreateUserUsecase>(() =>
//       CreateUserUsecase(
//           userRepository: getIt<UserLocalRepository>()));
//
//   // Register RegisterBloc with the required parameters
//   getIt.registerFactory<RegisterBloc>(
//     () => RegisterBloc(
//       registerUseCase: getIt<CreateUserUsecase>(),
//       createUserUsecase: getIt<CreateUserUsecase>(),
//     ),
//   );
// }
//
// _initLoginDependencies() async {
//   // Use common UserLocalDatasource and UserLocalRepository
//   getIt.registerLazySingleton<LoginUserUsecase>(() => LoginUserUsecase(
//       userRepository: getIt<UserLocalRepository>()));
//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       registerBloc: getIt<RegisterBloc>(),
//       homeCubit: getIt<HomeCubit>(),
//       loginUserUsecase: getIt<LoginUserUsecase>(),
//     ),
//   );
// }

_initRegisterDependencies() async {
  if (!getIt.isRegistered<UserRemoteDataSource>()) {
    getIt.registerFactory<UserRemoteDataSource>(
          () => UserRemoteDataSource(getIt<Dio>()),
    );
  }

  if (!getIt.isRegistered<UserRemoteRepository>()) {
    getIt.registerLazySingleton<UserRemoteRepository>(
            () => UserRemoteRepository(getIt<UserRemoteDataSource>()));
  }

  // Register CreateStudentUsecase
  getIt.registerLazySingleton<CreateUserUsecase>(
          () => CreateUserUsecase(userRepository: getIt<UserRemoteRepository>()));

  // Register RegisterBloc
  getIt.registerFactory<RegisterBloc>(
        () => RegisterBloc(
      // batchBloc: getIt<BatchBloc>(),
      // workshopBloc: getIt<WorkshopBloc>(),
      createUserUsecase: getIt<CreateUserUsecase>(),
    ),
  );
}

_initLoginDependencies() async {
  // Use common StudentRemoteDataSource and StudentLocalRepository
  if (!getIt.isRegistered<LoginUserUsecase>()) {
    getIt.registerLazySingleton<LoginUserUsecase>(
            () => LoginUserUsecase(userRepository: getIt<UserRemoteRepository>()));
  }

  getIt.registerFactory<LoginBloc>(
        () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      // batchBloc: getIt<BatchBloc>(),
      // workshopBloc: getIt<WorkshopBloc>(),
      loginUserUsecase: getIt<LoginUserUsecase>(),
    ),
  );
}


_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

_initOnboardingScreenViewDependencies() {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(
      getIt<HomeCubit>(),
      loginBloc: getIt<LoginBloc>(),
    ),
  );
}
