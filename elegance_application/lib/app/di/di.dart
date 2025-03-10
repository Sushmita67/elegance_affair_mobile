import 'package:elegance/app/shared_prefs/token_shared_prefs.dart';
import 'package:elegance/app/shared_prefs/user_shared_prefs.dart';
import 'package:elegance/core/network/api_service.dart';
import 'package:elegance/core/network/hive_service.dart';
import 'package:elegance/features/FAQ/presentation/view_model/faq_cubit.dart';
import 'package:elegance/features/about_us/presentation/view_model/about_us_cubit.dart';
import 'package:elegance/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:elegance/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:elegance/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:elegance/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:elegance/features/auth/domain/use_case/login_usecase.dart';
import 'package:elegance/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:elegance/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:elegance/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:elegance/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:elegance/features/auth/presentation/view_model/update_user/my_information_bloc.dart';
import 'package:elegance/features/cart/data/data_source/cart_datasource.dart';
import 'package:elegance/features/cart/data/repository/cart_remote_repository.dart';
import 'package:elegance/features/cart/domain/use_case/add_product_usecase.dart';
import 'package:elegance/features/cart/domain/use_case/clear_cart_usecase.dart';
import 'package:elegance/features/cart/domain/use_case/get_cart_usecase.dart';
import 'package:elegance/features/cart/domain/use_case/remove_product_usecase.dart';
import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:elegance/features/delivery_charge/presentation/view_model/delivery_charge_cubit.dart';
import 'package:elegance/features/feedback/presentation/view_model/feedback_cubit.dart';
import 'package:elegance/features/help/presentation/view_model/help_cubit.dart';
import 'package:elegance/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:elegance/features/order_view/presentation/view_model/order_view_cubit.dart';
import 'package:elegance/features/privacy_policy/presentation/view_model/privacy_policy_cubit.dart';
import 'package:elegance/features/product/data/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:elegance/features/product/data/repository/product_remote_repository.dart';
import 'package:elegance/features/product/domain/repository/product_repository.dart';
import 'package:elegance/features/product/domain/use_case/get_all_product_usecase.dart';
import 'package:elegance/features/product/presentation/view_model/product_bloc.dart';
import 'package:elegance/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:elegance/features/setting/presentation/view_model/setting_cubit.dart';
import 'package:elegance/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:elegance/features/support/presentation/view_model/support_cubit.dart';
import 'package:elegance/features/terms_and_condition/presentation/view_model/terms_and_condition_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initCartDependencies();
  await _initProductDependencies();
  await _initLoginDependencies();
  await _initRegisterDependencies();
  await _initOnboardingDependencies();
  await _initSplashDependencies();
  await _initProfileDependencies();
  await _initSettingsDependencies();
  await _initHomeDependencies();
}



_initCartDependencies() {
  getIt.registerLazySingleton<CartDatasource>(
    () => CartDatasource(userSharedPrefs: getIt<UserSharedPrefs>(),dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<CartRemoteRepository>(
    () => CartRemoteRepository(cartDatasource: getIt<CartDatasource>()),
  );

  getIt.registerLazySingleton<AddProductUsecase>(
    () => AddProductUsecase(repository: getIt<CartRemoteRepository>()),
  );
  getIt.registerLazySingleton<RemoveProductUsecase>(
    () => RemoveProductUsecase(repository: getIt<CartRemoteRepository>()),
  );
  getIt.registerLazySingleton<ClearCartUsecase>(
    () => ClearCartUsecase(repository: getIt<CartRemoteRepository>()),
  );
  getIt.registerLazySingleton<GetCartUsecase>(
    () => GetCartUsecase(repository: getIt<CartRemoteRepository>()),
  );

  getIt.registerFactory<CartBloc>(
    () => CartBloc(
        addProductUsecase: getIt(),
        removeProductUsecase: getIt(),
        clearCartUsecase: getIt(),
        getCartUsecase: getIt(), userSharedPrefs: getIt<UserSharedPrefs>()),
  );
}

//=======================PRODUCTS================//
_initProductDependencies() {
  // Register the remote data source for products
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(dio: getIt<Dio>()),
  );

  // Register the product repository
  getIt.registerLazySingleton<IProductRepository>(
    () => ProductRemoteRepository(
        remoteDataSource: getIt<ProductRemoteDataSource>()),
  );

  // Register the usecase for getting all products
  getIt.registerLazySingleton<GetAllProductUsecase>(
    () => GetAllProductUsecase(productRepository: getIt<IProductRepository>()),
  );

  // Register the ProductBloc  for managing product state in the home screen
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(getAllProductUsecase: getIt<GetAllProductUsecase>()),
  );
}

_initSettingsDependencies() {
  getIt.registerFactory<FeedbackCubit>(
    () => FeedbackCubit(),
  );
  getIt.registerFactory<FaqCubit>(
    () => FaqCubit(),
  );
  getIt.registerFactory<AboutUsCubit>(
    () => AboutUsCubit(),
  );
  getIt.registerFactory<DeliveryChargeCubit>(
    () => DeliveryChargeCubit(),
  );
  getIt.registerFactory<TermsAndConditionCubit>(
    () => TermsAndConditionCubit(),
  );
  getIt.registerFactory<PrivacyPolicyCubit>(
    () => PrivacyPolicyCubit(),
  );

  getIt.registerFactory<SettingCubit>(
    () => SettingCubit(
      getIt<FeedbackCubit>(),
      getIt<FaqCubit>(),
      getIt<AboutUsCubit>(),
      getIt<DeliveryChargeCubit>(),
      getIt<TermsAndConditionCubit>(),
      getIt<PrivacyPolicyCubit>(),
    ),
  );
}

_initSplashDependencies() {
  getIt.registerFactory<SplashCubit>(
      () => SplashCubit(getIt<OnBoardingScreenCubit>()));
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  getIt.registerLazySingleton<UserSharedPrefs>(
    () => UserSharedPrefs(getIt<SharedPreferences>()),
  );
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

//==================REGISTER==========================
_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init remote data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>(), getIt<UserSharedPrefs>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // init remote repository
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );
  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUseCase: getIt(),
    ),
  );
}

//==================LOGIN==========================
_initLoginDependencies() async {
  // =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
      getIt<UserSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initOnboardingDependencies() {
  getIt.registerFactory<OnBoardingScreenCubit>(
    () => OnBoardingScreenCubit(loginBloc: getIt<LoginBloc>()),
  );
}

//==================PROFILE==========================//
_initProfileDependencies() {
//===================Usecases========================//
  getIt.registerLazySingleton<UpdateUserUsecase>(
    () => UpdateUserUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  //===================Blocs and Cubits========================//
  getIt.registerFactory<OrderViewCubit>(
    () => OrderViewCubit(),
  );

  getIt.registerFactory<MyInformationBloc>(
    () => MyInformationBloc(updateUserUsecase: getIt<UpdateUserUsecase>()),
  );

  getIt.registerFactory<HelpCubit>(
    () => HelpCubit(),
  );

  getIt.registerFactory<SupportCubit>(
    () => SupportCubit(),
  );

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      orderViewCubit: getIt<OrderViewCubit>(),
      myInformationBloc: getIt<MyInformationBloc>(),
      help: getIt<HelpCubit>(),
      support: getIt<SupportCubit>(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}
