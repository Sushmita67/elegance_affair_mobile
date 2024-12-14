import 'package:elegance_application/view/home_screen_view.dart';
import 'package:elegance_application/view/login_screen_view.dart';
import 'package:elegance_application/view/onboarding_screen.dart';
import 'package:elegance_application/view/signup_screen_view.dart';
import 'package:elegance_application/view/splash_screen_view.dart';
import 'package:elegance_application/view/start_screen_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Start at the splash screen
      routes: {
        '/': (context) => const SplashScreenView(),
        // Splash screen route
        '/onboarding': (context) => const OnboardingScreen(),
        // Onboarding route
        '/start screen': (context) => const StartScreen(),
        // Home screen route
        '/login': (context) => const LoginPage(),
        // Login page route
        '/signup': (context) => const SignUpPage(),
        // SignUp page route
        '/homepage': (context) => const HomePageScreen(),
      },
    );
  }
}