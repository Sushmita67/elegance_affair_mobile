import 'package:dio/dio.dart';
import 'package:elegance_application/core/network/hive_service.dart';
import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance_application/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:elegance_application/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_service.dart';
import '../../features/auth/data/data_source/remote_datasource/user_remote_data_source.dart';
import '../../features/auth/data/repository/user_remote_repository.dart';
import '../../features/auth/domain/use_case/create_user_usecase.dart';
import '../../features/auth/domain/use_case/login_user_usecase.dart';
import '../../features/auth/domain/use_case/upload_image_usecase.dart';
import '../../features/product/data/data_source/local_datasource/product_local_data_source.dart';
import '../../features/product/data/data_source/remote_datasource/product_remote_data_source.dart';
import '../../features/product/data/repository/product_local_repository.dart';
import '../../features/product/data/repository/product_remote_repository.dart';
import '../../features/product/domain/use_case/create_product_usecase.dart';
import '../../features/product/domain/use_case/delete_product_usecase.dart';
import '../../features/product/domain/use_case/get_all_product_usecase.dart';
import '../../features/product/domain/use_case/get_product_by_id_usecase.dart';
import '../../features/product/domain/use_case/update_product_usecase.dart';
import '../../features/product/presentation/view_model/product_bloc.dart';
import '../shared_prefs/token_shared_prefs.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Sequence of Dependencies Matter!!

  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();

  await _initProductDependencies();
  // Initialize Home and Register dependencies before LoginBloc
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  // Initialize other dependencies
  await _initSplashScreenDependencies();
  await _initOnboardingScreenDependencies();
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

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(sharedPreferences),
  );
}

_initProductDependencies() async {
  // Local Data Source
  getIt.registerFactory<ProductLocalDataSource>(
      () => ProductLocalDataSource(getIt<HiveService>()));

  // Remote Data Source
  getIt.registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSource(getIt<Dio>()));

  // Local Repository
  getIt.registerLazySingleton<ProductLocalRepository>(() =>
      ProductLocalRepository(
          productLocalDataSource: getIt<ProductLocalDataSource>()));

  // Remote Repository
  getIt.registerLazySingleton<ProductRemoteRepository>(() =>
      ProductRemoteRepository(
          productRemoteDataSource: getIt<ProductRemoteDataSource>()));
}

_initHomeDependencies() async {
  getIt.registerSingleton<HomeCubit>(
    HomeCubit(tokenSharedPrefs: getIt<TokenSharedPrefs>()),
  );
}

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

  // Register Upload Image Use Case
  getIt.registerLazySingleton<UploadImageUseCase>(
      () => UploadImageUseCase(getIt<UserRemoteRepository>()));

  // Register RegisterBloc
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      createUserUsecase: getIt<CreateUserUsecase>(),
      uploadImageUseCase: getIt<UploadImageUseCase>(),
    ),
  );

  // Remote Usecases
  getIt.registerLazySingleton<CreateProductUseCase>(() => CreateProductUseCase(
      productRepository: getIt<ProductRemoteRepository>()));

  getIt.registerLazySingleton<GetAllProductsUseCase>(() =>
      GetAllProductsUseCase(
          productRepository: getIt<ProductRemoteRepository>()));

  getIt.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(
        productRepository: getIt<ProductRemoteRepository>(),
        tokenSharedPrefs: getIt<TokenSharedPrefs>()),
  );

  getIt.registerLazySingleton<UpdateProductUseCase>(
    () => UpdateProductUseCase(
        productRepository: getIt<ProductRemoteRepository>(),
        tokenSharedPrefs: getIt<TokenSharedPrefs>()),
  );

  getIt.registerLazySingleton<GetProductByIdUseCase>(
    () => GetProductByIdUseCase(
        productRepository: getIt<ProductRemoteRepository>()),
  );

// Bloc
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      createProductUseCase: getIt<CreateProductUseCase>(),
      getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
      deleteProductUseCase: getIt<DeleteProductUseCase>(),
      updateProductUseCase: getIt<UpdateProductUseCase>(),
      // getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
    ),
  );
}

_initLoginDependencies() async {
  // getIt.registerLazySingleton<TokenSharedPrefs>(
  //   () => TokenSharedPrefs(getIt<SharedPreferences>()),
  // );

  // Use common StudentRemoteDataSource and StudentLocalRepository
  if (!getIt.isRegistered<LoginUserUsecase>()) {
    getIt.registerLazySingleton<LoginUserUsecase>(() => LoginUserUsecase(
        tokenSharedPrefs: getIt<TokenSharedPrefs>(),
        userRepository: getIt<UserRemoteRepository>()));
  }

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUserUsecase: getIt<LoginUserUsecase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(),
  );
}

_initOnboardingScreenDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<LoginBloc>()),
  );
}
