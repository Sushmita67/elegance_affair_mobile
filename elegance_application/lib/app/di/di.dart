import 'package:dio/dio.dart';
import 'package:elegance_application/core/network/hive_service.dart';
import 'package:elegance_application/features/auth/data/data_source/local_datasource/customer_local_datasource.dart';
import 'package:elegance_application/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:elegance_application/features/auth/data/repository/customer_local_repository.dart';
import 'package:elegance_application/features/auth/domain/use_case/create_customer_usecase.dart';
import 'package:elegance_application/features/auth/domain/use_case/login_customer_usecase.dart';
import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance_application/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:elegance_application/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/api_service.dart';
import '../../features/auth/data/repository/user_remote_repository.dart';

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
//   if (!getIt.isRegistered<CustomerLocalDatasource>()) {
//     getIt.registerFactory<CustomerLocalDatasource>(
//       () => CustomerLocalDatasource(getIt<HiveService>()),
//     );
//   }
//
//   if (!getIt.isRegistered<CustomerLocalRepository>()) {
//     getIt.registerLazySingleton<CustomerLocalRepository>(() =>
//         CustomerLocalRepository(
//             customerLocalDataSource: getIt<CustomerLocalDatasource>()));
//   }
// }
//
// _initRegisterDependencies() async {
//   // Register CreateCustomerUsecase once
//   getIt.registerLazySingleton<CreateCustomerUsecase>(() =>
//       CreateCustomerUsecase(
//           customerRepository: getIt<CustomerLocalRepository>()));
//
//   // Register RegisterBloc with the required parameters
//   getIt.registerFactory<RegisterBloc>(
//     () => RegisterBloc(
//       registerUseCase: getIt<CreateCustomerUsecase>(),
//       createCustomerUsecase: getIt<CreateCustomerUsecase>(),
//     ),
//   );
// }
//
// _initLoginDependencies() async {
//   // Use common CustomerLocalDatasource and CustomerLocalRepository
//   getIt.registerLazySingleton<LoginCustomerUsecase>(() => LoginCustomerUsecase(
//       customerRepository: getIt<CustomerLocalRepository>()));
//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       registerBloc: getIt<RegisterBloc>(),
//       homeCubit: getIt<HomeCubit>(),
//       loginCustomerUsecase: getIt<LoginCustomerUsecase>(),
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
  getIt.registerLazySingleton<CreateCustomerUsecase>(
          () => CreateCustomerUsecase(customerRepository: getIt<UserRemoteRepository>()));

  // Register RegisterBloc
  getIt.registerFactory<RegisterBloc>(
        () => RegisterBloc(
      // batchBloc: getIt<BatchBloc>(),
      // workshopBloc: getIt<WorkshopBloc>(),
      createCustomerUsecase: getIt<CreateCustomerUsecase>(),
    ),
  );
}

_initLoginDependencies() async {
  // Use common StudentRemoteDataSource and StudentLocalRepository
  if (!getIt.isRegistered<LoginCustomerUsecase>()) {
    getIt.registerLazySingleton<LoginCustomerUsecase>(
            () => LoginCustomerUsecase(customerRepository: getIt<UserRemoteRepository>()));
  }

  getIt.registerFactory<LoginBloc>(
        () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      // batchBloc: getIt<BatchBloc>(),
      // workshopBloc: getIt<WorkshopBloc>(),
      loginCustomerUsecase: getIt<LoginCustomerUsecase>(),
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
