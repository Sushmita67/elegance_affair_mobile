// import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:elegance_application/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
// import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
// import 'package:elegance_application/features/splash/presentation/view_model/splash_cubit.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// Future<void> initDependencies() async {
//   // Sequence of Dependencies Matter!!
//   // await _initBatchDependencies();

//   // Initialize Home and Register dependencies before LoginBloc
//   await _initHomeDependencies();
//   await _initRegisterDependencies();

//   // Initialize LoginBloc after HomeCubit and RegisterBloc
//   await _initLoginDependencies();

//   // Initialize other dependencies
//   await _initOnboardingDependencies();
//   await _initSplashScreenDependencies();
// }

// // _initBatchDependencies() async {
// //   getIt.registerFactory<BatchBloc>(
// //     () => BatchBloc(),
// //   );
// // }

// _initHomeDependencies() async {
//   getIt.registerSingleton<HomeCubit>(
//     HomeCubit(),
//   );
// }

// _initRegisterDependencies() async {
//   getIt.registerFactory<RegisterBloc>(
//     () => RegisterBloc(),
//   );
// }

// _initLoginDependencies() async {
//   assert(getIt.isRegistered<RegisterBloc>(), "RegisterBloc not registered");
//   assert(getIt.isRegistered<HomeCubit>(), "HomeCubit not registered");

//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       registerBloc: getIt<RegisterBloc>(),
//       homeCubit: getIt<HomeCubit>(),
//     ),
//   );
// }

// _initSplashScreenDependencies() async {
//   getIt.registerFactory<SplashCubit>(
//     () => SplashCubit(),
//   );
// }

// _initOnboardingDependencies() async {
//   assert(getIt.isRegistered<LoginBloc>(), "LoginBloc not registered");

//   getIt.registerFactory<OnboardingCubit>(
//     () => OnboardingCubit(loginBloc: getIt<LoginBloc>()),
//   );
// }

import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance_application/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:elegance_application/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/hive_service.dart';
import '../../features/auth/data/data_source/local_datasource/student_local_datasource.dart';
import '../../features/auth/data/repository/student_local_repository.dart';
import '../../features/auth/domain/use_case/create_student_usecase.dart';
import '../../features/auth/domain/use_case/login_student_usecase.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initCommonDependencies();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
}

_initHiveService(){
  getIt.registerLazySingleton<HiveService>(()=> HiveService());
}


_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(),
  );
}

_initCommonDependencies() {
  // Register common dependencies used across multiple features
  if (!getIt.isRegistered<StudentLocalDatasource>()) {
    getIt.registerFactory<StudentLocalDatasource>(
          () => StudentLocalDatasource(getIt<HiveService>()),
    );
  }

  if (!getIt.isRegistered<StudentLocalRepository>()) {
    getIt.registerLazySingleton<StudentLocalRepository>(() =>
        StudentLocalRepository(studentLocalDataSource: getIt<StudentLocalDatasource>()));
  }
}

_initRegisterDependencies() async {
  // Use common StudentLocalDatasource and StudentLocalRepository
  getIt.registerLazySingleton<CreateStudentUsecase>(() =>
      CreateStudentUsecase(studentRepository: getIt<StudentLocalRepository>()));
  getIt.registerFactory<RegisterBloc>(
        () => RegisterBloc(
      createStudentUsecase: getIt<CreateStudentUsecase>(),
    ),
  );
}

_initLoginDependencies() async {
  // Use common StudentLocalDatasource and StudentLocalRepository
  getIt.registerLazySingleton<LoginStudentUsecase>(() =>
      LoginStudentUsecase(studentRepository: getIt<StudentLocalRepository>()));
  getIt.registerFactory<LoginBloc>(
        () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginStudentUsecase: getIt<LoginStudentUsecase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
        () => SplashCubit(getIt<LoginBloc>()),
  );
}
