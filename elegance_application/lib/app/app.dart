import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/di/di.dart'; // Import your dependency initialization
import '../core/app_theme/app_theme.dart'; // Theme file
import '../features/splash/presentation/view/splash_view.dart'; // Splash view
import '../features/splash/presentation/view_model/splash_cubit.dart'; // SplashCubit

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glamour Jewelry',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider<SplashCubit>(
        create: (_) => getIt<SplashCubit>(),
        child: SplashView(),
      ),
    );
  }
}
