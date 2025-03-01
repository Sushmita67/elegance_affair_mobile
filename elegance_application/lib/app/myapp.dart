import 'package:elegance/app/di/di.dart';
import 'package:elegance/core/theme/get_application_theme.dart';
import 'package:elegance/features/splash/presentation/view/splash_screen_view.dart';
import 'package:elegance/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:elegance/sensor/near.detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final onBoardingScreenCubit = GetIt.instance<OnBoardingScreenCubit>();

    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      title: "Ailav",
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: const SplashView(),
      ),
      builder: (context, child) {
        return GlobalProximityListener(child: child!);
      },
    );
  }
}
