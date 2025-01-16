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

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Ensure all dependencies are initialized in the correct order
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnboardingDependencies();
  await _initSplashScreenDependencies();
}

_initHomeDependencies() async {
  // Register HomeCubit
  getIt.registerSingleton<HomeCubit>(HomeCubit());
}

_initRegisterDependencies() async {
  // Register RegisterBloc
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc());
}

_initLoginDependencies() async {
  // Assert RegisterBloc and HomeCubit are already registered
  assert(getIt.isRegistered<RegisterBloc>(), "RegisterBloc not registered");
  assert(getIt.isRegistered<HomeCubit>(), "HomeCubit not registered");

  // Register LoginBloc with its dependencies
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(), // Inject RegisterBloc dependency
      homeCubit: getIt<HomeCubit>(), // Inject HomeCubit dependency
    ),
  );
}

_initOnboardingDependencies() async {
  // Assert that LoginBloc has been registered before OnboardingCubit
  assert(getIt.isRegistered<LoginBloc>(), "LoginBloc not registered");

  // Register OnboardingCubit
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(loginBloc: getIt<LoginBloc>()),
  );
}

_initSplashScreenDependencies() async {
  // Register SplashCubit
  getIt.registerFactory<SplashCubit>(() => SplashCubit());
}
